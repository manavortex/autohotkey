#SingleInstance force	

SetWorkingDir, %A_ScriptDir%

#Include AutoHotkey\RunOrSwitchTo.ahk
#Include AutoHotkey\CornerNotify.ahk

; Just for gaming :P
;#Include AutoHotkey\jumpme.ahk
#Include AutoHotkey\KeyPress\AlternateKeypress.ahk
#Include AutoHotkey\KeyPress\ToggleKeypress.ahk

; ------------------------------------------------------------------------------------------
; --------------------- ! is alt ^ is ctrl # is windows + is shift  ------------------------
; ------------------------------------------------------------------------------------------

MinMax()
{
WinGetPos, winWidth, winHeight, , , A  ; "A" to get the active window's pos.
    if ( winWidth == -8 and winHeight == -8) {
        WinRestore, A
    } else
    {
        WinMaximize, A
    }   
}

; ------------------------------------------------------------------------------------------
; Windows-H will minimize, Windows-M will maximize current window
; ------------------------------------------------------------------------------------------
#m::MinMax()
#h::WinMinimize, A

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
#IfWinActive

; ------------------------------------------------------------------------------------------
; close notepad with ctrl-w
; ------------------------------------------------------------------------------------------
#IfWinActive ahk_exe notepad.exe
^w::Send !{F4}
#IfWinActive

; ---------------------------------------------
; paste to console with ctrl+v
; ---------------------------------------------
#IfWinActive ahk_class ConsoleWindowClass
^V::
SendInput {Raw}%clipboard%
return
#IfWinActive

; ------------------------------------------------------------------------------------------
; 			Andromeda - gaming example
; ------------------------------------------------------------------------------------------
#IfWinActive, ahk_exe MassEffectAndromeda.exe
XButton1::ToggleButton("w")
XButton2::e
F13::AlternateKeypress("m", "Tab")
F14::h
#IfWinActive


; ------------------------------------------------------------------------------------------
; search clipboard in google on ctrl-alt-c
; ------------------------------------------------------------------------------------------
^!c::
{
Send, ^c
Sleep 50
Run, http://www.google.com/search?q=%clipboard%
Return
}

; ------------------------------------------------------------------------------------------
; reload with ctrl+alt+y
; ------------------------------------------------------------------------------------------
!^y::Reload

; ------------------------------------------------------------------------------------------
; uncomment for debug - alt-Y for key history
; ------------------------------------------------------------------------------------------
;#InstallKeybdHook
;!y::KeyHistory 


return
