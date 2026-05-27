# CMake generated Testfile for 
# Source directory: /workspace/tests/cpu
# Build directory: /workspace/build/cross/tests/cpu
# 
# This file includes the relevant testing commands required for 
# testing this directory and lists subdirectories to be tested as well.
add_test(test_cpu "/workspace/build/cross/bin/test_cpu")
set_tests_properties(test_cpu PROPERTIES  TIMEOUT "300" _BACKTRACE_TRIPLES "/workspace/tests/cpu/CMakeLists.txt;4;add_test;/workspace/tests/cpu/CMakeLists.txt;0;")
