set(vsroot "C:\\Program Files\\Microsoft Visual Studio\\2022\\Professional")
set(vcvars64 "${vsroot}\\VC\\Auxiliary\\Build\\vcvars64.bat")

# Generate chain call 

set(chain ${CMAKE_CURRENT_BINARY_DIR}/chain.bat)
file(WRITE ${chain} "@chcp 65001 > NUL\ncall \"${vcvars64}\"\nmsbuild hello.sln")
execute_process(COMMAND chmod +x ${chain})

#set(ENV{PATH} "c:\\Windows\\System32;c:\\Windows")

execute_process(
    COMMAND ${chain}
    RESULT_VARIABLE rr
    WORKING_DIRECTORY ${CMAKE_CURRENT_LIST_DIR}/vs/build)

if(rr)
    message(FATAL_ERROR "Err(${chain}): ${rr}")
endif()

