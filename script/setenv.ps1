
$env:HOME = $env:DRIVE + ":\gnupack_msys2\home"
$env:PATH = $env:DRIVE + ":\gnupack_msys2\exe\cmigemo;" + $env:PATH
$env:PATH = $env:DRIVE + ":\gnupack_msys2\exe\cscope;" + $env:PATH
$env:PATH = $env:DRIVE + ":\gnupack_msys2\exe\hunspell\bin;" + $env:PATH
$env:PATH = $env:DRIVE + ":\gnupack_msys2\exe\pandoc;" + $env:PATH
$env:PATH = $env:DRIVE + ":\gnupack_msys2\exe\msys64\mingw64\bin;" + $env:PATH
$env:PATH = $env:DRIVE + ":\gnupack_msys2\exe\msys64\usr\local\bin;" + $env:PATH
$env:PATH = $env:DRIVE + ":\gnupack_msys2\exe\msys64\usr\bin;" + $env:PATH
$env:PATH = $env:DRIVE + ":\gnupack_msys2\exe\msys64\bin;" + $env:PATH
$env:LANG = "en_US.UTF-8"

<# Debug #>
<#
echo $env:PATH
echo $env:LANG
#>

