#pragma once

#include <algorithm>
#include <chrono>
#include <cstdint>
#include <fstream>
#include <limits>
#include <numeric>
#include <pthread.h>
#include <sched.h>
#include <sstream>
#include <string>
#include <sys/resource.h>
#include <sys/socket.h>
#include <sys/stat.h>
#include <sys/un.h>
#include <thread>
#include <unistd.h>
#include <vector>

namespace rt_engine {

struct IsolationConfig
{
    std::vector<int> isolated_cores;
    bool preempt_rt_enabled{false};
    bool nohz_full_enabled{false};
    bool rcu_nocbs_enabled{false};
};

struct IpcContract
{
    // Request: uint32_t seq + uint64_t t0_ns
    // Reply:   uint32_t seq + uint64_t t1_ns
    uint32_t max_payload_bytes{128};
    uint32_t expected_round_trip_us{250};
    std::string transport{"unix_dgram"};
};

inline std::string read_line(const std::string& path)
{
    std::ifstream f(path);
    if (!f.is_open()) {
        return "";
    }
    std::string line;
    std::getline(f, line);
    return line;
}

inline bool path_exists(const std::string& path)
{
    struct stat st;
    return ::stat(path.c_str(), &st) == 0;
}

inline bool is_preempt_rt_enabled()
{
    std::string rt = read_line("/sys/kernel/realtime");
    if (!rt.empty() && (rt == "1" || rt == "Y" || rt == "y")) {
        return true;
    }
    std::string version = read_line("/proc/version");
    return version.find("PREEMPT_RT") != std::string::npos;
}

inline std::vector<int> parse_cpu_list(const std::string& v)
{
    std::vector<int> out;
    std::stringstream ss(v);
    std::string token;
    while (std::getline(ss, token, ',')) {
        auto dash = token.find('-');
        try {
            if (dash == std::string::npos) {
                out.push_back(std::stoi(token));
            } else {
                int a = std::stoi(token.substr(0, dash));
                int b = std::stoi(token.substr(dash + 1));
                if (b < a) {
                    std::swap(a, b);
                }
                for (int i = a; i <= b; ++i) {
                    out.push_back(i);
                }
            }
        } catch (...) {
        }
    }
    std::sort(out.begin(), out.end());
    out.erase(std::unique(out.begin(), out.end()), out.end());
    return out;
}

inline std::vector<int> isolated_cores_from_cmdline()
{
    std::string cmdline = read_line("/proc/cmdline");
    auto pos = cmdline.find("isolcpus=");
    if (pos == std::string::npos) {
        return {};
    }
    pos += 9;
    auto end = cmdline.find(' ', pos);
    std::string val = cmdline.substr(pos, end == std::string::npos ? std::string::npos : (end - pos));
    auto comma = val.find_last_of(':');
    if (comma != std::string::npos) {
        val = val.substr(comma + 1);
    }
    return parse_cpu_list(val);
}

inline IsolationConfig detect_isolation_config()
{
    IsolationConfig cfg;
    cfg.preempt_rt_enabled = is_preempt_rt_enabled();
    cfg.isolated_cores = isolated_cores_from_cmdline();

    std::string cmdline = read_line("/proc/cmdline");
    cfg.nohz_full_enabled = cmdline.find("nohz_full=") != std::string::npos;
    cfg.rcu_nocbs_enabled = cmdline.find("rcu_nocbs=") != std::string::npos;
    return cfg;
}

inline bool set_current_thread_affinity(int core)
{
    cpu_set_t cpuset;
    CPU_ZERO(&cpuset);
    CPU_SET(core, &cpuset);
    return pthread_setaffinity_np(pthread_self(), sizeof(cpu_set_t), &cpuset) == 0;
}

inline bool set_current_thread_fifo(int priority)
{
    sched_param p{};
    p.sched_priority = priority;
    return pthread_setschedparam(pthread_self(), SCHED_FIFO, &p) == 0;
}

inline std::vector<double> measure_wakeup_jitter_us(int samples, int period_us)
{
    std::vector<double> out;
    out.reserve(static_cast<size_t>(samples));

    using clock = std::chrono::steady_clock;
    auto next = clock::now();
    for (int i = 0; i < samples; ++i) {
        next += std::chrono::microseconds(period_us);
        std::this_thread::sleep_until(next);
        auto now = clock::now();
        double err_us = std::chrono::duration<double, std::micro>(now - next).count();
        out.push_back(err_us);
    }
    return out;
}

inline double percentile_us(std::vector<double> samples, double pct)
{
    if (samples.empty()) {
        return 0.0;
    }
    std::sort(samples.begin(), samples.end());
    size_t idx = static_cast<size_t>((pct / 100.0) * static_cast<double>(samples.size() - 1));
    return samples[idx];
}

inline double unix_dgram_round_trip_us(int rounds)
{
    if (rounds <= 0) {
        return 0.0;
    }

    int sv[2];
    if (socketpair(AF_UNIX, SOCK_DGRAM, 0, sv) != 0) {
        return -1.0;
    }

    uint64_t msg = 0;
    std::thread worker([&]() {
        uint64_t rx = 0;
        for (int i = 0; i < rounds; ++i) {
            if (read(sv[1], &rx, sizeof(rx)) != static_cast<ssize_t>(sizeof(rx))) {
                break;
            }
            (void)write(sv[1], &rx, sizeof(rx));
        }
    });

    auto t0 = std::chrono::steady_clock::now();
    for (int i = 0; i < rounds; ++i) {
        msg = static_cast<uint64_t>(i + 1);
        if (write(sv[0], &msg, sizeof(msg)) != static_cast<ssize_t>(sizeof(msg))) {
            close(sv[0]);
            close(sv[1]);
            worker.join();
            return -1.0;
        }
        uint64_t rx = 0;
        if (read(sv[0], &rx, sizeof(rx)) != static_cast<ssize_t>(sizeof(rx))) {
            close(sv[0]);
            close(sv[1]);
            worker.join();
            return -1.0;
        }
    }
    auto t1 = std::chrono::steady_clock::now();

    close(sv[0]);
    close(sv[1]);
    worker.join();

    const double total_us = std::chrono::duration<double, std::micro>(t1 - t0).count();
    return total_us / static_cast<double>(rounds);
}

inline bool hypervisor_present()
{
    std::string cpuinfo = read_line("/proc/cpuinfo");
    std::ifstream f("/proc/cpuinfo");
    std::string line;
    while (std::getline(f, line)) {
        if (line.find("hypervisor") != std::string::npos || line.find("KVM") != std::string::npos ||
            line.find("ACRN") != std::string::npos || line.find("Jailhouse") != std::string::npos) {
            return true;
        }
    }
    return false;
}

} // namespace rt_engine
