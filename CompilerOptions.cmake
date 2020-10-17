cmake_minimum_required(VERSION 3.16)

if (NOT TARGET CompilerOptions::StaticAnalysis)
    add_library(CompilerOptions_StaticAnalysis INTERFACE)
    mark_as_advanced(FORCE CompilerOptions_StaticAnalysis)
    target_compile_options(CompilerOptions_StaticAnalysis
        INTERFACE
        $<$<CXX_COMPILER_ID:Clang,AppleClang,GNU>:-Wall -Werror -Wextra -Wpedantic -pedantic-errors>
        $<$<CXX_COMPILER_ID:Clang,AppleClang,GNU>:-fvisibility=hidden -fvisibility-inlines-hidden>
        $<$<CXX_COMPILER_ID:Clang,AppleClang,GNU>:-Wdouble-promotion>
        $<$<CXX_COMPILER_ID:Clang,AppleClang,GNU>:-Wformat=2 -Wformat-security -Wformat-signedness>
        $<$<CXX_COMPILER_ID:Clang,AppleClang,GNU>:-Wnull-dereference>
        $<$<CXX_COMPILER_ID:Clang,AppleClang,GNU>:-Wimplicit-fallthrough=5>
        $<$<CXX_COMPILER_ID:Clang,AppleClang,GNU>:-Wmissing-include-dirs>
        $<$<CXX_COMPILER_ID:Clang,AppleClang,GNU>:-Wshift-overflow=2>
        $<$<CXX_COMPILER_ID:Clang,AppleClang,GNU>:-Wswitch-default>
        $<$<CXX_COMPILER_ID:Clang,AppleClang,GNU>:-Wswitch-enum>
        $<$<CXX_COMPILER_ID:Clang,AppleClang,GNU>:-Wunused-const-variable>
        $<$<CXX_COMPILER_ID:Clang,AppleClang,GNU>:-Wuninitialized>
        $<$<CXX_COMPILER_ID:Clang,AppleClang,GNU>:-Wstrict-overflow=5>
        $<$<CXX_COMPILER_ID:Clang,AppleClang,GNU>:-Wstringop-overflow=4>
        $<$<CXX_COMPILER_ID:Clang,AppleClang,GNU>:-Wsuggest-attribute=pure>
#        $<$<CXX_COMPILER_ID:Clang,AppleClang,GNU>:-Wsuggest-attribute=const>   Triggers on static methods
        $<$<CXX_COMPILER_ID:Clang,AppleClang,GNU>:-Wsuggest-attribute=noreturn>
        $<$<CXX_COMPILER_ID:Clang,AppleClang,GNU>:-Wsuggest-attribute=malloc>
        $<$<CXX_COMPILER_ID:Clang,AppleClang,GNU>:-Wsuggest-attribute=format>
        $<$<CXX_COMPILER_ID:Clang,AppleClang,GNU>:-Wsuggest-attribute=cold>
        $<$<CXX_COMPILER_ID:Clang,AppleClang,GNU>:-Walloc-zero>
        $<$<CXX_COMPILER_ID:Clang,AppleClang,GNU>:-Walloca>
        $<$<CXX_COMPILER_ID:Clang,AppleClang,GNU>:-Wno-attribute-alias>
        $<$<CXX_COMPILER_ID:Clang,AppleClang,GNU>:-Wduplicated-branches>
        $<$<CXX_COMPILER_ID:Clang,AppleClang,GNU>:-Wduplicated-cond>
        $<$<CXX_COMPILER_ID:Clang,AppleClang,GNU>:-Wtrampolines>
        $<$<CXX_COMPILER_ID:Clang,AppleClang,GNU>:-Wfloat-equal>
        $<$<CXX_COMPILER_ID:Clang,AppleClang,GNU>:-Wshadow>
        $<$<CXX_COMPILER_ID:Clang,AppleClang,GNU>:-Wunsafe-loop-optimizations>
        $<$<CXX_COMPILER_ID:Clang,AppleClang,GNU>:-Wundef>
        $<$<CXX_COMPILER_ID:Clang,AppleClang,GNU>:-Wunused-macros>
        $<$<CXX_COMPILER_ID:Clang,AppleClang,GNU>:-Wcast-qual>
        $<$<CXX_COMPILER_ID:Clang,AppleClang,GNU>:-Wcast-align=strict>
        $<$<CXX_COMPILER_ID:Clang,AppleClang,GNU>:-Wwrite-strings>
        $<$<CXX_COMPILER_ID:Clang,AppleClang,GNU>:-Wconversion>
        $<$<CXX_COMPILER_ID:Clang,AppleClang,GNU>:-Wdate-time>
        $<$<CXX_COMPILER_ID:Clang,AppleClang,GNU>:-Wno-endif-labels>
        $<$<CXX_COMPILER_ID:Clang,AppleClang,GNU>:-Wsign-conversion>
        $<$<CXX_COMPILER_ID:Clang,AppleClang,GNU>:-Wlogical-op>
        $<$<CXX_COMPILER_ID:Clang,AppleClang,GNU>:-Wno-aggressive-loop-optimizations>
        $<$<CXX_COMPILER_ID:Clang,AppleClang,GNU>:-Wmissing-declarations>
        $<$<CXX_COMPILER_ID:Clang,AppleClang,GNU>:-Wredundant-decls>
        $<$<CXX_COMPILER_ID:Clang,AppleClang,GNU>:-Wdisabled-optimization>
        $<$<CXX_COMPILER_ID:Clang,AppleClang,GNU>:-Wstack-protector>
        $<$<CXX_COMPILER_ID:Clang,AppleClang,GNU>:-Wctor-dtor-privacy>
        $<$<CXX_COMPILER_ID:Clang,AppleClang,GNU>:-Wold-style-cast>
        $<$<CXX_COMPILER_ID:Clang,AppleClang,GNU>:-Woverloaded-virtual>
        $<$<CXX_COMPILER_ID:Clang,AppleClang,GNU>:-Wsign-promo>
        $<$<CXX_COMPILER_ID:Clang,AppleClang,GNU>:-Wstrict-null-sentinel>
        $<$<CXX_COMPILER_ID:Clang,AppleClang,GNU>:-Wnoexcept>
        $<$<CXX_COMPILER_ID:Clang,AppleClang,GNU>:-Weffc++>
        $<$<CXX_COMPILER_ID:Clang,AppleClang,GNU>:-Wsuggest-final-types -Wsuggest-final-methods>
        $<$<CXX_COMPILER_ID:MSVC>:/Wx>
        $<$<CXX_COMPILER_ID:MSVC>:/W4>
        $<$<CXX_COMPILER_ID:GNU>:$<$<VERSION_GREATER_EQUAL:$<CXX_COMPILER_VERSION>,10.1>:-Warith-conversion>>
        $<$<CXX_COMPILER_ID:GNU>:$<$<VERSION_GREATER_EQUAL:$<CXX_COMPILER_VERSION>,10.1>:-Wvolatile>>
        $<$<CXX_COMPILER_ID:GNU>:$<$<VERSION_GREATER_EQUAL:$<CXX_COMPILER_VERSION>,10.1>:-Wredundant-tags>>
        # $<$<CXX_COMPILER_ID:GNU>:$<$<VERSION_GREATER_EQUAL:$<CXX_COMPILER_VERSION>,10.1>:-Wmismatched-tags>>  Triggers on the standard library
        )
    add_library(CompilerOptions::StaticAnalysis ALIAS CompilerOptions_StaticAnalysis)
endif ()

if (NOT TARGET CompilerOptions::Optimizations)
    add_library(CompilerOptions_Optimizations INTERFACE)
    mark_as_advanced(FORCE CompilerOptions_Optimizations)
    target_compile_options(CompilerOptions_Optimizations
        INTERFACE
        $<$<CONFIG:Debug>:-Og>
        $<$<CONFIG:Release>:-O2>
        )
    add_library(CompilerOptions::Optimizations ALIAS CompilerOptions_Optimizations)
endif ()

if (NOT TARGET CompilerOptions::CodeCoverage)
    add_library(CompilerOptions_CodeCoverage INTERFACE)
    mark_as_advanced(FORCE CompilerOptions_CodeCoverage)
    target_compile_options(CompilerOptions_CodeCoverage
        INTERFACE
        $<$<CONFIG:Debug>:$<$<CXX_COMPILER_ID:Clang,AppleClang>:-fprofile-instr-generate -fcoverage-mapping>>
        $<$<CONFIG:Debug>:$<$<CXX_COMPILER_ID:GNU>:-fprofile-arcs -ftest-coverage>>
        )
    target_link_options(CompilerOptions_CodeCoverage
        INTERFACE
        $<$<CONFIG:Debug>:$<$<CXX_COMPILER_ID:GNU>:-lgcov>>
        $<$<CONFIG:Debug>:$<$<CXX_COMPILER_ID:Clang,AppleClang,GNU>:--coverage>>
        )
    add_library(CompilerOptions::CodeCoverage ALIAS CompilerOptions_CodeCoverage)
endif ()
