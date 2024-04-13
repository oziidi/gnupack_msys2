
Invoke-Expression .\script\adapt_drive.ps1
Invoke-Expression .\script\setenv.ps1
Invoke-Expression .\script\setenv_gvim.ps1

$arg1 = "-mingw64 -defterm -full-path -no-start"
$arg2 = "-where " + $env:HOME
$arg3 = "-c " + $env:DRIVE + ":/gnupack_msys2/exe/vim/gvim.exe"
$arg0 = $arg1 + " " + $arg2 + " " + $arg3

<# Debug
echo $arg0
#>

$fpath = $env:DRIVE + ":\gnupack_msys2\exe\msys64\msys2_shell.cmd"

Start-Process -FilePath $fpath -ArgumentList $arg0 -WindowStyle Hidden
