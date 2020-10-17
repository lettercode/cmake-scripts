cmake_minimum_required(VERSION 3.16)

include(FetchThirdParty)

FetchThirdParty(
    Catch2
    "single_include"
    GIT_REPOSITORY https://github.com/catchorg/Catch2.git
    GIT_TAG v2.13.0
    GIT_SHALLOW ON
)

get_target_property(CATCH_INC_DIR Catch2 INTERFACE_SYSTEM_INCLUDE_DIRECTORIES)
message(STATUS "Using Catch2: ${CATCH_INC_DIR}/catch2/catch.hpp")

set(CTEST_USE_LAUNCHERS 0)

include(${CATCH_INC_DIR}/../contrib/Catch.cmake)
