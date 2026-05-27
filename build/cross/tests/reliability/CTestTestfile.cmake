# CMake generated Testfile for 
# Source directory: /workspace/tests/reliability
# Build directory: /workspace/build/cross/tests/reliability
# 
# This file includes the relevant testing commands required for 
# testing this directory and lists subdirectories to be tested as well.
add_test(test_reliability "/workspace/build/cross/bin/test_reliability")
set_tests_properties(test_reliability PROPERTIES  TIMEOUT "300" _BACKTRACE_TRIPLES "/workspace/tests/reliability/CMakeLists.txt;4;add_test;/workspace/tests/reliability/CMakeLists.txt;0;")
