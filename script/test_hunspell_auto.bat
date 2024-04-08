@echo off

call ..\adapt_drive.cmd

set PATH=%DRIVE%:\gnupack_msys2\exe\hunspell\bin;%PATH%
set DICTIONARY=en_US
set DICPATH=%DRIVE%:\gnupack_msys2\exe\hunspell\share\hunspell

hunspell.exe -D

pause
