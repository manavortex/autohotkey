#Include %A_ScriptDir%\AutoHotkey\RunOrSwitchTo.ahk
;#Include %A_ScriptDir%\AutoHotkey\jumpme.ahk
;#include %A_ScriptDir%\AutoHotkey\CornerNotify.ahk
#Include %A_ScriptDir%\AutoHotkey\KeepInsertOff.ahk

;! is alt ^ is ctrl # is windows


; ---------------------------------------------
; Windows-M will minimize current window
; ---------------------------------------------
#m::WinMinimize, A 	


Insert::Delete

SetNumlockState, AlwaysOn
SetCapsLockState, AlwaysOff



#n::RunOrActivate("C:\Program Files (x86)\Notepad++\notepad++.exe")
#f::RunOrActivate("C:\Program Files (x86)\Google\Chrome\Application\chrome.exe")
;#c::RunOrActivate("C:\01_apps\Console2\Console.exe -t bash")


; ---------------------------------------------
; alt-shift-d opens download folder
; opens explorer on c drive
; ---------------------------------------------
!+d::Run, explore "%userprofile%\Downloads"
#e::Run explorer.exe "C:\"

!+::


; ---------------------------------------------
; suppress f10 and f1 on notepad++
; ---------------------------------------------
#IfWinActive, ahk_exe notepad++.exe *32
F10::^s
F1::
+Escape::



; ---------------------------------------------
; close notepad with ctrl-w
; ---------------------------------------------
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


; ---------------------------------------------
; search clipboard in google on ctrl-shift-c
; ---------------------------------------------
^+c::
{
Send, ^c
Sleep 50
Run, http://www.google.com/search?q=%clipboard%
Return
}


; ---------------------------------------------
; backspace goes up one folder level
; ---------------------------------------------
#IfWinActive, ahk_class CabinetWClass
Backspace::
   ControlGet renamestatus,Visible,,Edit1,A
   ControlGetFocus focussed, A
   if(renamestatus!=1&&(focussed=”DirectUIHWND3″||focussed=SysTreeView321))
   {
    SendInput {Alt Down}{Up}{Alt Up}
  }else{
      Send {Backspace}
  }
#IfWinActive



; ---------------------------------------------
; uncomment for debug - alt-Y for key history
; ---------------------------------------------
;#InstallKeybdHook
;!y::KeyHistory 


return
