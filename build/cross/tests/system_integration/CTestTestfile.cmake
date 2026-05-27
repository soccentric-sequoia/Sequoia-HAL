# CMake generated Testfile for 
# Source directory: /workspace/tests/system_integration
# Build directory: /workspace/build/cross/tests/system_integration
# 
# This file includes the relevant testing commands required for 
# testing this directory and lists subdirectories to be tested as well.
add_test(test_system_integration "/workspace/build/cross/bin/test_system_integration")
set_tests_properties(test_system_integration PROPERTIES  TIMEOUT "300" _BACKTRACE_TRIPLES "/workspace/tests/system_integration/CMakeLists.txt;4;add_test;/workspace/tests/system_integration/CMakeLists.txt;0;")
