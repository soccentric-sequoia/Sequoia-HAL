# Install script for directory: /workspace/tests

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

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for each subdirectory.
  include("/workspace/build/cross/tests/gpu/cmake_install.cmake")
  include("/workspace/build/cross/tests/cpu/cmake_install.cmake")
  include("/workspace/build/cross/tests/deep_learning_accelerator/cmake_install.cmake")
  include("/workspace/build/cross/tests/vision_accelerator/cmake_install.cmake")
  include("/workspace/build/cross/tests/system_memory/cmake_install.cmake")
  include("/workspace/build/cross/tests/storage/cmake_install.cmake")
  include("/workspace/build/cross/tests/video_encode_decode/cmake_install.cmake")
  include("/workspace/build/cross/tests/pcie/cmake_install.cmake")
  include("/workspace/build/cross/tests/ethernet/cmake_install.cmake")
  include("/workspace/build/cross/tests/usb/cmake_install.cmake")
  include("/workspace/build/cross/tests/camera_interfaces/cmake_install.cmake")
  include("/workspace/build/cross/tests/display_interfaces/cmake_install.cmake")
  include("/workspace/build/cross/tests/communication_interface/cmake_install.cmake")
  include("/workspace/build/cross/tests/gpio/cmake_install.cmake")
  include("/workspace/build/cross/tests/audio_interfaces/cmake_install.cmake")
  include("/workspace/build/cross/tests/power_management/cmake_install.cmake")
  include("/workspace/build/cross/tests/thermal_management/cmake_install.cmake")
  include("/workspace/build/cross/tests/clock_and_timing/cmake_install.cmake")
  include("/workspace/build/cross/tests/security_features/cmake_install.cmake")
  include("/workspace/build/cross/tests/watchdog_and_reset/cmake_install.cmake")
  include("/workspace/build/cross/tests/external_connector/cmake_install.cmake")
  include("/workspace/build/cross/tests/mcu_interface/cmake_install.cmake")
  include("/workspace/build/cross/tests/ethernet_switch/cmake_install.cmake")
  include("/workspace/build/cross/tests/gnss/cmake_install.cmake")
  include("/workspace/build/cross/tests/imu/cmake_install.cmake")
  include("/workspace/build/cross/tests/serializer_deserializer/cmake_install.cmake")
  include("/workspace/build/cross/tests/environmental/cmake_install.cmake")
  include("/workspace/build/cross/tests/reliability/cmake_install.cmake")
  include("/workspace/build/cross/tests/software_interface/cmake_install.cmake")
  include("/workspace/build/cross/tests/functional_safety/cmake_install.cmake")
  include("/workspace/build/cross/tests/system_integration/cmake_install.cmake")
  include("/workspace/build/cross/tests/debug_and_development_interfaces/cmake_install.cmake")
  include("/workspace/build/cross/tests/sense_hat/cmake_install.cmake")
  include("/workspace/build/cross/tests/camera_module3/cmake_install.cmake")
  include("/workspace/build/cross/tests/poe_hat/cmake_install.cmake")

endif()

