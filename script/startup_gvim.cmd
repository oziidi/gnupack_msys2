@echo off

call setenv.cmd
call adapt_drive.cmd
set TMP=%DRIVE%:\gnupack_msys2\temp\gvim
set TEMP=%DRIVE%:\gnupack_msys2\temp\gvim
set TERM=gvim

rem ..\exe\vim\gvim.exe
call ..\exe\msys64\msys2_shell.cmd -mingw64 -defterm -full-path -no-start -where %HOME% -c %DRIVE%:/gnupack_msys2/exe/vim/gvim.exe
