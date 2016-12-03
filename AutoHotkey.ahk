#Include %A_ScriptDir%\AutoHotkey\RunOrSwitchTo.ahk
#Include %A_ScriptDir%\AutoHotkey\jumpme.ahk
#include %A_ScriptDir%\AutoHotkey\CornerNotify.ahk

;! is alt ^ is ctrl # is windows

#m::WinMinimize, A 	; Windows-M will minimize current window

Insert::Delete
SetNumlockState, AlwaysOn

^y::Reload

#e::RunOrActivate("C:\01_apps\xplorer2_ult\xplorer2_64.exe")
#n::RunOrActivate("C:\Program Files (x86)\Notepad++\notepad++.exe")
#s::RunOrActivate("C:\01_apps\Atom.lnk")
#f::RunOrActivate("C:\Program Files (x86)\Mozilla Firefox\firefox.exe")
#c::RunOrActivate("C:\01_apps\Console2\Console.exe -t bash")

^!m::SoundSet, +1, , mute

#IfWinActive, ahk_class EsoClientWndClass
NumpadEnter::return

!+::

#IfWinActive, ahk_exe notepad++.exe *32
F10::^s

#IfWinActive, ahk_exe notepad.exe *32
^w::!f4

return
