# Module Inventory and Sequoia Mapping

All 35 HAL modules were read and mapped before edits. Public class names and public method names are preserved.

| Module | Sequoia backend mapping |
|---|---|
| audio_interfaces | ALSA/PipeWire + generic Linux sound stack |
| camera_interfaces_lib | Generic V4L2/media topology (USB/PCI cameras) |
| camera_module3_lib | Generic camera path with optional sensor-specific checks |
| clock_and_timing_lib | Linux clocksource/thermal/hwmon based timing checks |
| communication_interface_lib | Linux tty/spi/i2c/can + Unix IPC RTT contract |
| cpu_lib | x86 core topology + PREEMPT_RT isolated-core jitter checks |
| debug_and_development_interfaces | Generic debug/serial/process diagnostics |
| deep_learning_accelerator_lib | Optional PCIe/USB accelerator discovery + fallback |
| display_interfaces | DRM/KMS generic display stack |
| environmental_lib | Generic thermal/hwmon/iio environment telemetry |
| ethernet_lib | Generic NIC via /sys/class/net and ethtool |
| ethernet_switch_lib | Generic switch/device discovery over Linux interfaces |
| external_connector_lib | Generic connector and power path checks |
| functional_safety_lib | Software safety proxies + partition fault isolation |
| gnss_lib | Generic GNSS device/service checks |
| gpio_lib | Linux gpiochip model with generic defaults |
| gpu_lib | Generic DRM/devfreq probing and software fallback metrics |
| imu_lib | Generic IIO/IMU probing |
| mcu_interface_lib | Generic MCU link validation over serial/spi/i2c |
| pcie_lib | Generic PCIe topology and link checks |
| poe_hat_lib | Generic PoE and power/thermal telemetry checks |
| power_management_lib | Generic power_supply/hwmon based checks |
| reliability_lib | Platform-agnostic reliability tests |
| security_features_lib | Generic Linux security feature checks |
| sense_hat_lib | Optional sensor HAT style checks via Linux interfaces |
| serializer_deserializer_lib | Generic SerDes/clock/link checks |
| software_interface_lib | Linux userland/runtime and service checks |
| storage_lib | Generic block-device and throughput checks |
| system_integration_lib | System-level integration + RT partition config detection |
| system_memory_lib | Generic memory topology/bandwidth/latency checks |
| thermal_management_lib | Generic thermal zones/hwmon/fan checks |
| usb_lib | Generic xHCI/USB topology checks |
| video_encode_decode_lib | Generic V4L2/codec path checks |
| vision_accelerator_lib | Generic vision acceleration fallback paths |
| watchdog_and_reset_lib | Generic Linux watchdog/reset telemetry |
