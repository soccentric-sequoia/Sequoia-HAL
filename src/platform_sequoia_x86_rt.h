/**
 * @file platform_sequoia_x86_rt.h
 * @brief Sequoia x86 PREEMPT_RT platform defaults and portable Linux paths.
 */

#pragma once

// CPU defaults for validation windows when exact limits are not discoverable.
static constexpr int    X86RT_CPU_CORES              = 4;
static constexpr double X86RT_CPU_MAX_FREQ_MHZ       = 6000.0;
static constexpr double X86RT_CPU_MIN_FREQ_MHZ       = 500.0;
static constexpr double X86RT_CPU_TEMP_MAX_C         = 95.0;

// GPU/devfreq probing defaults (optional on x86).
static constexpr int    X86RT_GPU_SHADER_CORES       = 0;
static constexpr double X86RT_GPU_MAX_FREQ_MHZ       = 3000.0;
static constexpr double X86RT_GPU_MIN_FREQ_MHZ       = 100.0;
static constexpr double X86RT_GPU_TEMP_MAX_C         = 95.0;
static constexpr const char* X86RT_GPU_DEVFREQ_PATH  = "/sys/class/devfreq";
static constexpr const char* X86RT_GPU_DEVICE_PATH   = "/sys/class/drm";
static constexpr const char* X86RT_V3D_DEV_PATH      = "/dev/dri/card0";
static constexpr const char* X86RT_V3D_RENDER_PATH   = "/dev/dri/renderD128";

// Memory defaults.
static constexpr long long X86RT_MEM_8GB_BYTES       = 8LL * 1024 * 1024 * 1024;
static constexpr long long X86RT_MEM_4GB_BYTES       = 4LL * 1024 * 1024 * 1024;
static constexpr double    X86RT_MEM_SPEED_MHZ       = 4800.0;
static constexpr double    X86RT_MEM_BW_GBS          = 30.0;
static constexpr int       X86RT_MEM_BUS_BITS        = 64;

// PCIe defaults.
static constexpr int    X86RT_PCIE_GEN               = 4;
static constexpr int    X86RT_PCIE_LANES             = 4;
static constexpr double X86RT_PCIE_BW_GBS            = 8.0;
static constexpr const char* X86RT_PCIE_RC_PATH      = "/sys/bus/pci/devices";

// USB defaults.
static constexpr const char* X86RT_XHCI_DRIVER_PATH  = "/sys/bus/pci/drivers/xhci_hcd";
static constexpr int X86RT_USB3_PORT_COUNT           = 2;
static constexpr int X86RT_USB2_PORT_COUNT           = 2;

// Networking defaults.
static constexpr const char* X86RT_ETH_IFACE         = "eth0";
static constexpr int         X86RT_ETH_SPEED_MBPS    = 1000;

// Camera/media defaults.
static constexpr const char* X86RT_CSI_DEVICE0       = "/dev/video0";
static constexpr const char* X86RT_CSI_DEVICE1       = "/dev/video1";
static constexpr const char* X86RT_MEDIA_CTL0        = "/dev/media0";
static constexpr const char* X86RT_UNICAM_PATH       = "/sys/class/video4linux";

// Display defaults.
static constexpr const char* X86RT_DRM_CARD0         = "/dev/dri/card0";
static constexpr const char* X86RT_DRM_CARD1         = "/dev/dri/card1";

// Audio defaults.
static constexpr const char* X86RT_I2S_DEVICE        = "/sys/class/sound";
static constexpr const char* X86RT_ALSA_CARDS        = "/proc/asound/cards";

// Serial debug defaults.
static constexpr const char* X86RT_DEBUG_UART        = "/dev/ttyS0";
static constexpr const char* X86RT_UART1             = "/dev/ttyS1";

// Thermal defaults.
static constexpr const char* X86RT_THERMAL_CPU_ZONE  = "/sys/class/thermal/thermal_zone0";
static constexpr const char* X86RT_THERMAL_SB_ZONE   = "/sys/class/thermal/thermal_zone1";
static constexpr double      X86RT_THERMAL_THROTTLE_C = 85.0;
static constexpr double      X86RT_THERMAL_SHUTDOWN_C = 95.0;

// GPIO and storage defaults.
static constexpr const char* X86RT_GPIOCHIP_PATH     = "/dev/gpiochip0";
static constexpr int         X86RT_GPIO_PIN_COUNT     = 32;
static constexpr const char* X86RT_MMCBLK_PATH       = "/dev/mmcblk0";
static constexpr const char* X86RT_NVME_PATH         = "/dev/nvme0n1";
static constexpr const char* X86RT_POWER_SUPPLY_PATH = "/sys/class/power_supply";

// Accelerator vendor IDs often seen on x86 add-in cards.
static constexpr const char* X86RT_HAILO8_PCIE_VENDOR = "1e60";
static constexpr const char* X86RT_CORAL_USB_VENDOR   = "18d1";

// Generic platform labels.
static constexpr const char* PLATFORM_NAME            = "Sequoia x86 PREEMPT_RT";
static constexpr const char* PLATFORM_SOC             = "x86_64";
static constexpr const char* PLATFORM_IOBRIDGE        = "PCIe/Platform I/O";
static constexpr const char* X86RT_DT_MODEL_PATH      = "/sys/devices/virtual/dmi/id/product_name";
