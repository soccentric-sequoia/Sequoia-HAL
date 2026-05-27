# Install script for directory: /workspace/src

# Set the install prefix
if(NOT DEFINED CMAKE_INSTALL_PREFIX)
  set(CMAKE_INSTALL_PREFIX "/usr/local")
endif()
string(REGEX REPLACE "/$" "" CMAKE_INSTALL_PREFIX "${CMAKE_INSTALL_PREFIX}")

# Set the install configuration name.
if(NOT DEFINED CMAKE_INSTALL_CONFIG_NAME)
  if(BUILD_TYPE)
    string(REGEX REPLACE "^[^A-Za-z0-9_]+" ""
           CMAKE_INSTALL_CONFIG_NAME "${BUILD_TYPE}")
  else()
    set(CMAKE_INSTALL_CONFIG_NAME "")
  endif()
  message(STATUS "Install configuration: \"${CMAKE_INSTALL_CONFIG_NAME}\"")
endif()

# Set the component getting installed.
if(NOT CMAKE_INSTALL_COMPONENT)
  if(COMPONENT)
    message(STATUS "Install component: \"${COMPONENT}\"")
    set(CMAKE_INSTALL_COMPONENT "${COMPONENT}")
  else()
    set(CMAKE_INSTALL_COMPONENT)
  endif()
endif()

# Install shared libraries without execute permission?
if(NOT DEFINED CMAKE_INSTALL_SO_NO_EXE)
  set(CMAKE_INSTALL_SO_NO_EXE "1")
endif()

# Is this installation the result of a crosscompile?
if(NOT DEFINED CMAKE_CROSSCOMPILING)
  set(CMAKE_CROSSCOMPILING "FALSE")
endif()

# Set default install directory permissions.
if(NOT DEFINED CMAKE_OBJDUMP)
  set(CMAKE_OBJDUMP "/usr/bin/objdump")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib" TYPE STATIC_LIBRARY FILES "/workspace/build/cross/lib/liblib_base.a")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/sequoia_hal" TYPE FILE FILES "/workspace/src/lib_base.h")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for each subdirectory.
  include("/workspace/build/cross/src/gpu_lib/cmake_install.cmake")
  include("/workspace/build/cross/src/cpu_lib/cmake_install.cmake")
  include("/workspace/build/cross/src/deep_learning_accelerator_lib/cmake_install.cmake")
  include("/workspace/build/cross/src/vision_accelerator_lib/cmake_install.cmake")
  include("/workspace/build/cross/src/system_memory_lib/cmake_install.cmake")
  include("/workspace/build/cross/src/storage_lib/cmake_install.cmake")
  include("/workspace/build/cross/src/video_encode_decode_lib/cmake_install.cmake")
  include("/workspace/build/cross/src/pcie_lib/cmake_install.cmake")
  include("/workspace/build/cross/src/ethernet_lib/cmake_install.cmake")
  include("/workspace/build/cross/src/usb_lib/cmake_install.cmake")
  include("/workspace/build/cross/src/camera_interfaces_lib/cmake_install.cmake")
  include("/workspace/build/cross/src/display_interfaces/cmake_install.cmake")
  include("/workspace/build/cross/src/communication_interface_lib/cmake_install.cmake")
  include("/workspace/build/cross/src/gpio_lib/cmake_install.cmake")
  include("/workspace/build/cross/src/audio_interfaces/cmake_install.cmake")
  include("/workspace/build/cross/src/power_management_lib/cmake_install.cmake")
  include("/workspace/build/cross/src/thermal_management_lib/cmake_install.cmake")
  include("/workspace/build/cross/src/clock_and_timing_lib/cmake_install.cmake")
  include("/workspace/build/cross/src/security_features_lib/cmake_install.cmake")
  include("/workspace/build/cross/src/watchdog_and_reset_lib/cmake_install.cmake")
  include("/workspace/build/cross/src/external_connector_lib/cmake_install.cmake")
  include("/workspace/build/cross/src/mcu_interface_lib/cmake_install.cmake")
  include("/workspace/build/cross/src/ethernet_switch_lib/cmake_install.cmake")
  include("/workspace/build/cross/src/gnss_lib/cmake_install.cmake")
  include("/workspace/build/cross/src/imu_lib/cmake_install.cmake")
  include("/workspace/build/cross/src/serializer_deserializer_lib/cmake_install.cmake")
  include("/workspace/build/cross/src/environmental_lib/cmake_install.cmake")
  include("/workspace/build/cross/src/reliability_lib/cmake_install.cmake")
  include("/workspace/build/cross/src/software_interface_lib/cmake_install.cmake")
  include("/workspace/build/cross/src/functional_safety_lib/cmake_install.cmake")
  include("/workspace/build/cross/src/system_integration_lib/cmake_install.cmake")
  include("/workspace/build/cross/src/debug_and_development_interfaces/cmake_install.cmake")
  include("/workspace/build/cross/src/sense_hat_lib/cmake_install.cmake")
  include("/workspace/build/cross/src/camera_module3_lib/cmake_install.cmake")
  include("/workspace/build/cross/src/poe_hat_lib/cmake_install.cmake")

endif()

