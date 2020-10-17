cmake_minimum_required(VERSION 3.16)

include(FetchContent)

macro (FetchThirdParty TARGET_NAME INC_DIR_LIST)
    string(TOLOWER ${TARGET_NAME}_data target_int)
    FetchContent_Declare(
        ${target_int}
        ${ARGN}
    )
    FetchContent_GetProperties(${target_int}
        SOURCE_DIR SRC_DIR
        POPULATED IsPopulated
        )
    if (NOT ${target_int}_POPULATED)
        message(STATUS "Downloading ${TARGET_NAME} ...")
        FetchContent_Populate(${target_int})
    endif ()
    
    if (NOT TARGET ${TARGET_NAME})
        add_library(${TARGET_NAME} INTERFACE)
        foreach (REL_INC ${INC_DIR_LIST})
            file(TO_CMAKE_PATH "${${target_int}_SOURCE_DIR}/${REL_INC}" INC_DIR)
            target_include_directories(${TARGET_NAME} SYSTEM INTERFACE ${INC_DIR})
        endforeach ()
    endif ()
endmacro ()
