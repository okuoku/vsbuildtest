set(vsroot "C:\\Program Files\\Microsoft Visual Studio\\2022\\Professional")
set(vcvars64 "${vsroot}\\VC\\Auxiliary\\Build\\vcvars64.bat")

#set(ENV{PATH} "c:\\Windows\\System32;c:\\Windows")

execute_process(
    COMMAND cmd /c chcp 65001 &&
    ${vcvars64} && msbuild hello.sln 
    RESULT_VARIABLE rr
    WORKING_DIRECTORY ${CMAKE_CURRENT_LIST_DIR}/vs/build)

if(rr)
    message(FATAL_ERROR "Err(${chain}): ${rr}")
endif()

