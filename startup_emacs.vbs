Set ws = CreateObject("Wscript.Shell")
ws.CurrentDirectory = ".\script"
ws.Run "cmd /c startup_emacs.cmd", vbhide
