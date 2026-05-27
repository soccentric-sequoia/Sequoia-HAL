# CMake generated Testfile for 
# Source directory: /workspace/tests/functional_safety
# Build directory: /workspace/build/cross/tests/functional_safety
# 
# This file includes the relevant testing commands required for 
# testing this directory and lists subdirectories to be tested as well.
add_test(test_functional_safety "/workspace/build/cross/bin/test_functional_safety")
set_tests_properties(test_functional_safety PROPERTIES  TIMEOUT "300" _BACKTRACE_TRIPLES "/workspace/tests/functional_safety/CMakeLists.txt;4;add_test;/workspace/tests/functional_safety/CMakeLists.txt;0;")
