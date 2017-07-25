Set shell = WScript.CreateObject("WScript.Shell")
shell.Run "KeyBindings.ahk", 0, false
shell.Run "emacs -mm -q -l .emacs", 0, true
shell.Run "taskkill /im autohotkey.exe", 0, true
