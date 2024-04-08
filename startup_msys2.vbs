Set ws = CreateObject("Wscript.Shell")
ws.CurrentDirectory = ".\script"
ws.Run "cmd /c startup_msys2.cmd", vbhide
