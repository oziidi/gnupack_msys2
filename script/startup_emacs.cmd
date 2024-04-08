@echo off

call setenv.cmd
call adapt_drive.cmd
set DICTIONARY=en_US
set DICPATH=%DRIVE%:/gnupack_msys2/exe/hunspell/share/hunspell
set MIGEDIC=%DRIVE%:/gnupack_msys2/exe/cmigemo/dict/utf-8/migemo-dict
set MKDWCSS=%DRIVE%:/gnupack_msys2/script/github-markdown.css
set TMP=%DRIVE%:\gnupack_msys2\temp\emacs
set TEMP=%DRIVE%:\gnupack_msys2\temp\emacs

rem version 1
rem ..\exe\msys64\usr\bin\mintty.exe -w hide /usr/bin/env MSYSTEM=MINGW64 /usr/bin/bash -lc %DRIVE%:/gnupack_msys2/exe/emacs/bin/emacs

rem version 2
rem call ..\exe\msys64\msys2_shell.cmd -defterm -no-start -mingw64 -where %HOME% -c %DRIVE%:/gnupack_msys2/exe/emacs/bin/emacs

rem version 3
rem ..\exe\emacs\bin\emacs.exe

rem version 4
call ..\exe\msys64\msys2_shell.cmd -mingw64 -defterm -full-path -no-start -where %HOME% -c %DRIVE%:/gnupack_msys2/exe/emacs/bin/emacs
