# CMake generated Testfile for 
# Source directory: /workspace/tests/pcie
# Build directory: /workspace/build/cross/tests/pcie
# 
# This file includes the relevant testing commands required for 
# testing this directory and lists subdirectories to be tested as well.
add_test(test_pcie "/workspace/build/cross/bin/test_pcie")
set_tests_properties(test_pcie PROPERTIES  TIMEOUT "300" _BACKTRACE_TRIPLES "/workspace/tests/pcie/CMakeLists.txt;4;add_test;/workspace/tests/pcie/CMakeLists.txt;0;")
