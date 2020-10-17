cmake_minimum_required(VERSION 3.16)

include(FetchThirdParty)

FetchThirdParty(
    Lyra
    "data/single_include"
    GIT_REPOSITORY https://github.com/bfgroup/Lyra.git
    GIT_TAG 1.2
    GIT_SHALLOW ON
)

get_target_property(LYRA_INC_DIR Lyra INTERFACE_SYSTEM_INCLUDE_DIRECTORIES)
message(STATUS "Using Lyra: ${LYRA_INC_DIR}/lyra/lyra.hpp")
