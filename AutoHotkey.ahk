SetWorkingDir, %A_ScriptDir%

#Include AutoHotkey\RunOrSwitchTo.ahk
#Include AutoHotkey\CornerNotify.ahk

; Just for gaming :P
;#Include AutoHotkey\jumpme.ahk
;#Include AutoHotkey\KeyPress\AlternateKeypress.ahk
;#Include AutoHotkey\KeyPress\ToggleKeypress.ahk

; ------------------------------------------------------------------------------------------
; --------------------- ! is alt ^ is ctrl # is windows + is shift  ------------------------
; ------------------------------------------------------------------------------------------


; ------------------------------------------------------------------------------------------
; Windows-M will minimize current window
; ------------------------------------------------------------------------------------------
#m::WinMinimize, A 


; ------------------------------------------------------------------------------------------
; Make sure that annoying toggle keys are fix
; ------------------------------------------------------------------------------------------
Insert::Delete
SetNumlockState, AlwaysOn
SetCapsLockState, AlwaysOff


; ------------------------------------------------------------------------------------------
; windows+key opens program
; requires RunOrSwitchTo.ahk to be loaded
; ------------------------------------------------------------------------------------------
#n::RunOrActivate("C:\Program Files (x86)\Notepad++\notepad++.exe")
#f::RunOrActivate("C:\Program Files (x86)\Google\Chrome\Application\chrome.exe")
;#c::RunOrActivate("C:\01_apps\Console2\Console.exe -t bash")


; ------------------------------------------------------------------------------------------
; alt-shift-d opens download folder
; opens explorer on c drive
; ------------------------------------------------------------------------------------------
!+d::Run, explore "%userprofile%\Downloads"
#e::Run explorer.exe "%userprofile%"

; ------------------------------------------------------------------------------------------
; suppress f10 and f1 and shift+esc on notepad++
; ------------------------------------------------------------------------------------------
#IfWinActive, ahk_exe notepad++.exe *32
F10::^s
F1::
+Escape::


; ------------------------------------------------------------------------------------------
; close notepad with ctrl-w
; ------------------------------------------------------------------------------------------
#IfWinActive ahk_exe notepad.exe
^w::Send !{F4}


; ---------------------------------------------
; paste to console with ctrl+v
; ---------------------------------------------
#IfWinActive ahk_class ConsoleWindowClass
^V::
SendInput {Raw}%clipboard%
return
#IfWinActive


; ------------------------------------------------------------------------------------------
; search clipboard in google on ctrl-shift-c
; ------------------------------------------------------------------------------------------
^+c::
{
Send, ^c
Sleep 50
Run, http://www.google.com/search?q=%clipboard%
Return
}

; ------------------------------------------------------------------------------------------
; uncomment for debug - alt-Y for key history
; ------------------------------------------------------------------------------------------
;#InstallKeybdHook
;!y::KeyHistory 


return
