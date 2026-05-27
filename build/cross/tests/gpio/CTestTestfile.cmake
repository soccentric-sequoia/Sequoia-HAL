# CMake generated Testfile for 
# Source directory: /workspace/tests/gpio
# Build directory: /workspace/build/cross/tests/gpio
# 
# This file includes the relevant testing commands required for 
# testing this directory and lists subdirectories to be tested as well.
add_test(test_gpio "/workspace/build/cross/bin/test_gpio")
set_tests_properties(test_gpio PROPERTIES  TIMEOUT "300" _BACKTRACE_TRIPLES "/workspace/tests/gpio/CMakeLists.txt;4;add_test;/workspace/tests/gpio/CMakeLists.txt;0;")
