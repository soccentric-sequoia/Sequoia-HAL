# CMake generated Testfile for 
# Source directory: /workspace/tests/gpu
# Build directory: /workspace/build/cross/tests/gpu
# 
# This file includes the relevant testing commands required for 
# testing this directory and lists subdirectories to be tested as well.
add_test(test_gpu "/workspace/build/cross/bin/test_gpu")
set_tests_properties(test_gpu PROPERTIES  TIMEOUT "300" _BACKTRACE_TRIPLES "/workspace/tests/gpu/CMakeLists.txt;4;add_test;/workspace/tests/gpu/CMakeLists.txt;0;")
