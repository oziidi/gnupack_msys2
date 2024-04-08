@echo off

call adapt_drive.cmd

set HOME=%DRIVE%:\gnupack_msys2\home
set PATH=%DRIVE%:\gnupack_msys2\exe\cmigemo;%PATH%
set PATH=%DRIVE%:\gnupack_msys2\exe\cscope;%PATH%
set PATH=%DRIVE%:\gnupack_msys2\exe\hunspell\bin;%PATH%
set PATH=%DRIVE%:\gnupack_msys2\exe\pandoc;%PATH%
set PATH=%DRIVE%:\gnupack_msys2\exe\msys64\mingw64\bin;%PATH%
set PATH=%DRIVE%:\gnupack_msys2\exe\msys64\usr\local\bin;%PATH%
set PATH=%DRIVE%:\gnupack_msys2\exe\msys64\usr\bin;%PATH%
set PATH=%DRIVE%:\gnupack_msys2\exe\msys64\bin;%PATH%
set LANG=en_US.UTF-8
