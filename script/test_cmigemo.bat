@echo off

call ..\adapt_drive.cmd

set PATH=%DRIVE%:\gnupack_msys2\exe\cmigemo;%PATH%
cmd /c "cmigemo -d .\exe\cmigemo\dict\utf-8\migemo-dict -e"

pause
