# Sequoia-HAL

## Project Summary

Sequoia-HAL is the C++ hardware-abstraction and validation library used by the Sequoia client and
related tooling. It presents module-oriented APIs for compute, memory, thermal, power, networking,
storage, USB/PCIe, GPIO, camera, display, audio/video, sensors, safety, and system interfaces. The
repository contains the implementation headers and sources, protobuf contracts, CMake build files,
module test programs, Docker helpers, Doxygen configuration, and a packaged binary artifact. A
shared platform header centralizes target paths, constants, and thresholds so individual modules can
use the same board model.

The existing implementation inventory and test tree are broad, but successful hardware access is
necessarily target-dependent. CMake registers many module tests, while the README documents native
and Docker-based builds plus static analysis and deployment helpers. The protobuf subdirectory is
the contract boundary consumed by Sequoia-Client and server-side services. The library’s feature
rows below therefore separate source/test presence from claims about physical devices, drivers,
accelerators, or cross-compiled deployment. A test binary existing in the tree is evidence of an
executable test surface, not evidence that it passed on a board.

The module-oriented layout gives Sequoia-Client a stable place to map hardware operations into
higher-level runs, while the protobuf files provide shared wire contracts for that integration.
Driver permissions, kernel support, device enumeration, timing, and sensor calibration are outside
what a host-only compile can establish.

The same caution applies to packaged `.deb` outputs: packaging presence does not establish
installation success or runtime ABI compatibility.

## Feature Inventory

| # | Name / Description | Implemented? | Test Coverage? | Manual Test |
| --- | --- | --- | --- | --- |
|   1 | Modular C++ HAL library and common base types                    | Implemented  | Broad module test tree                       | [ ] Manual verification required |
|   2 | Sequoia platform constants and device-path mapping               | Implemented  | Partial; target-dependent                    | [ ] Manual verification required |
|   3 | CPU, GPU, and accelerator modules                                | Implemented  | Dedicated module tests present               | [ ] Manual verification required |
|   4 | Memory, storage, and thermal modules                             | Implemented  | Dedicated module tests present               | [ ] Manual verification required |
|   5 | Power, watchdog, clock, and reliability modules                  | Implemented  | Dedicated module tests present               | [ ] Manual verification required |
|   6 | Ethernet, switch, communication, and PCIe modules                | Implemented  | Dedicated module tests present               | [ ] Manual verification required |
|   7 | USB, GPIO, connectors, and MCU interfaces                        | Implemented  | Dedicated module tests present               | [ ] Manual verification required |
|   8 | Camera, display, audio, and video interfaces                     | Implemented  | Dedicated module tests present               | [ ] Manual verification required |
|   9 | IMU, GNSS, environmental, and specialized HAT modules            | Implemented  | Dedicated module tests present               | [ ] Manual verification required |
|  10 | Functional safety, security, debug, and software interfaces      | Implemented  | Dedicated module tests present               | [ ] Manual verification required |
|  11 | Protobuf/gRPC contract library                                   | Implemented  | Build/test coverage depends on CMake targets | [ ] Manual verification required |
|  12 | Native build, Docker cross-build, Doxygen, clang-format/cppcheck | Implemented  | Command-level evidence only                  | [ ] Manual verification required |
|  13 | Real device-driver behavior on Sequoia hardware                  | Unknown      | Requires target hardware                     | [ ] Manual verification required |

## Build and Test

```bash
make build
make run
make cppcheck
make format
```

Run the generated CTest suite from the configured build directory. Module tests are under `tests/`;
inspect their CMake files for exact target names.

> Ported to Sequoia x86 RT 5 (x86 SoM + platform I/O) — all platform-specific paths, constants, and
> device nodes updated for the Intel x86 RT 5 hardware. ### Target Platform | Property | Value |
> |---|---| | SoC | x86 SoM (quad-core Cortex-A76 @ 2.4 GHz) | | South-bridge | platform I/O (USB 3,
> PCIe Gen3 x1, GPIO, I2S, CSI/DSI) | | GPU | Intel x86 RT 5 (12 shader quad cores, 800 MHz max) | |
> Memory | 4 GB / 8 GB LPDDR4X-4267 | | AI Accelerator | Hailo-8 HAT+ (PCIe, ~26 INT8 TOPS) or Coral
> USB Edge TPU (~4 TOPS) | | OS | Sequoia x86 RT OS (64-bit) / Ubuntu 24.04 ARM64 | ### Key
> Features - **Modular Library Architecture**: Separate libraries for CPU, GPU, DLA (Hailo-8/Coral),
> video codec (V4L2 M2M), camera (Unicam/platform I/O), audio (platform I/O I2S), PCIe, USB
> (xhci-hcd), GPIO (gpiochip0), storage, Ethernet, and more.

- **Sequoia Platform Header**: Centralised constants in `src/platform_sequoia_x86_rt.h` (device
  paths, thermal thresholds, memory bandwidth).
- **Cross-compilation via Docker**: ARM64 Ubuntu 24.04 container (`Intel x86 RT 5-builder`).
- **Comprehensive Testing**: Unit tests, integration tests, and deployment workflows.
- **Documentation Generation**: Integrated Doxygen support.
- **Code Quality Tools**: clang-format and cppcheck. ## Prerequisites ### System Requirements -
  **Operating System**: Linux (Ubuntu 20.04+ recommended for host)
- **Compiler**: GCC 11+ or Clang 14+
- **Build Tools**: - CMake 3.10+ - Ninja build system - Make - Git
- Docker installed and running (for cross-compilation) ## Build Process The project supports two
  primary build methods: 1. **Native Compilation**: Build directly on a Sequoia x86 RT 5 running
  64-bit OS.

2. **Docker-based Cross-Compilation**: Build for ARM64 on any Linux host using the
   `Intel x86 RT 5-builder` container. ### Native Compilation (on Intel x86 RT 5) #### Install
   Dependencies

````bash
sudo apt update
sudo apt install -y build-essential cmake ninja-build git \ protobuf-compiler libprotobuf-dev libprotoc-dev \ libgrpc++-dev libsqlite3-dev libboost-system-dev \ libboost-date-time-dev doxygen clang-format cppcheck
``` #### Build and Run Tests
```bash
make build
make run
``` ### Docker-based Cross-Compilation The Docker image is based on `ubuntu:22.04` (ARM64) and is named `sequoia`. #### Build Process 1. **Ensure Docker is Installed** ```bash make docker-install ``` 2. **Build the Docker Image** ```bash make docker-image ``` This creates a Docker image named `acadia` based on `ubuntu:22.04` with all necessary ARM64 build dependencies pre-installed. 3. **Build** ```bash make docker-build ``` This command: - Runs the Docker container with the project mounted - Configures the build system with Ninja generator - Builds all targets - Outputs binaries in the `build/cross/` directory 4. **Deploy and Run on Target Intel x86 RT 5** ```bash # For Intel x86 RT 5 Primary (192.168.1.3) make run-a # For Intel x86 RT 5 Secondary (192.168.1.13) make run-b # Specify custom IP address make run-b IP_B=192.168.200.2
``` ## Platform-Specific Notes ### AI Inference (DLA)
- **Hailo-8** (PCIe HAT+): detected at `/dev/hailo0`, kernel module `hailo_pci` (vendor `0x1e60`)
- **Coral USB Edge TPU**: detected via USB vendor `18d1` at `/dev/apex_0` ### GPU (Intel x86 RT 5)
- devfreq sysfs: `/sys/class/devfreq/fde00000.gpu/`
- DRM: `/dev/dri/card0`, `/dev/dri/renderD128`
- Module: `v3d` ### Video Codec
- H.264 encode/decode: `generic-codec` at `/dev/video10` (encoder), `/dev/video11` (decoder)
- H.265/HEVC decode: `rpivid` at `/dev/video18` or `/dev/video19` ### Camera (CSI)
- Unicam CSI-2 controller: `/sys/bus/platform/devices/1f00110000.csi`
- V4L2 device: `/dev/video0`, media controller: `/dev/media0` ### Debug UART
- `/dev/ttyAMA0` (115200 8N1 by default on Intel x86 RT 5) ## Make Targets For the full list of supported commands, run: ```bash
make help
``` ## Contributing 1. Follow the established code formatting (use `make format`)
2. Run static analysis before submitting (`make cppcheck`)
3. Add tests for new functionality
4. Update documentation as needed
````
