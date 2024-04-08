@echo off

call setenv.cmd
call adapt_drive.cmd

chcp 65001
set MSYS=winsymlinks:nativestrict
call ..\exe\msys64\msys2_shell.cmd -mingw64 -full-path -defterm

