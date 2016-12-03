#Include %A_ScriptDir%\AutoHotkey\run_or_open.ahk
#Include %A_ScriptDir%\AutoHotkey\jumpme.ahk
#include %A_ScriptDir%\AutoHotkey\CornerNotify.ahk

;! is alt ^ is ctrl # is windows

#m::WinMinimize, A 	; Windows-M will minimize current window

Insert::Delete
SetNumlockState, AlwaysOn

; requires RunOrSwitchTo to be loaded
#e::RunOrActivate("C:\Program Files\xplorer2_ult\xplorer2_64.exe", 					"xplorer2_64.exe")
#n::RunOrActivate("C:\Program Files (x86)\Notepad++\notepad++.exe", 				"notepad++.exe")
#s::RunOrActivate("C:\Users\ewa\AppData\Local\atom\Update.exe", 						"atom.exe")
#f::RunOrActivate("C:\Program Files (x86)\Mozilla Firefox\firefox.exe", 		"firefox.exe")
#c::RunOrActivate("C:\01_apps\Console2\Console.exe -t bash", 								"Console.exe")


^!m::SoundSet, +1, , mute

#IfWinActive, ahk_class EsoClientWndClass
NumpadEnter::return

!+::

#IfWinActive, ahk_exe notepad++.exe *32
F10::^s

#IfWinActive, ahk_exe notepad.exe *32
^w::!f4

return
