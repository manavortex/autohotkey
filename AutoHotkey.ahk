#Include %A_ScriptDir%\AutoHotkey\RunOrSwitchTo.ahk
#Include %A_ScriptDir%\AutoHotkey\jumpme.ahk
#Include %A_ScriptDir%\AutoHotkey\KeyFinder.ahk
#Include %A_ScriptDir%\AutoHotkey\scrollhorizontal.ahk
#Include %A_ScriptDir%\AutoHotkey\GetWinClass.ahk
#Include %A_ScriptDir%\AutoHotkey\CopyOnSelect.ahk
#Include %A_ScriptDir%\AutoHotkey\ReloadCtrlAltR.ahk
;#include %A_ScriptDir%\AutoHotkey\warframe.ahk

;! is alt ^ is ctrl # is windows

#m::WinMinimize, A 	; Windows-M will minimize current window

Insert::Delete
SetNumlockState, AlwaysOn

; requires RunOrSwitchTo to be loaded
#e::RunOrActivate("C:\Program Files\xplorer2_ult\xplorer2_64.exe")
^!e::RunOrActivate("C:\ESO\The Elder Scrolls Online EU\game\client\eso.exe")
#n::RunOrActivate("C:\Program Files (x86)\Notepad++\notepad++.exe")
#s::RunOrActivate("C:\Program Files\Sublime Text 3\sublime_text.exe")
#f::RunOrActivate("C:\Program Files (x86)\Mozilla Firefox\firefox.exe")
#c::RunOrActivate("C:\Program Files\Console2\Console.exe")
#!m::RunOrActivate("C:\Users\ewa\AppData\Local\Minion\Minion.exe")

^!m::SoundSet, +1, , mute

#IfWinActive, ahk_exe eso.exe
ß::?
!ß::\

#IfWinActive, ahk_exe notepad++.exe *32
F10::^s

return 
