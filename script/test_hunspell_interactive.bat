@echo off

rem Run this batch file at the command line.
rem Then type "hunspell -d en_US".
rem After Hunspell x.x.x is displayed on the console, type incorrect
rem English spell, for example, tset etc.

call ..\adapt_drive.cmd

set PATH=%DRIVE%:\gnupack_msys2\exe\hunspell\bin;%PATH%
set DICTIONARY=en_US
set DICPATH=%DRIVE%:\gnupack_msys2\exe\hunspell\share\hunspell

echo Type "hunspell -d en_US" to start test
echo After Hunspell x.x.x is displayed on the console,
echo type incorrect English spell, for example, tset etc.
