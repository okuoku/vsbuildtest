set(vsroot "C:\\Program Files\\Microsoft Visual Studio\\2022\\Professional")
set(vcvars64 "${vsroot}\\VC\\Auxiliary\\Build\\vcvars64.bat")
set(cmakeext_bin "${vsroot}\\Common7\\IDE\\CommonExtensions\\Microsoft\\CMake\\CMake\\bin")

#set(ENV{PATH} "c:\\Windows\\System32;c:\\Windows")

set(builddir "${CMAKE_CURRENT_LIST_DIR}/build")
file(MAKE_DIRECTORY "${builddir}")

execute_process(
    COMMAND cmd /c chcp 65001 &&
    ${vcvars64} && ${cmakeext_bin}\\cmake 
    -G "Visual Studio 17 2022" 
    -A x64 ../vs
    RESULT_VARIABLE rr
    WORKING_DIRECTORY ${builddir})

if(rr)
    message(FATAL_ERROR "Err(${chain}): ${rr}")
endif()

