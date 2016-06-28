#InstallKeybdHook

MsgBox Press some keys, terminating with ENTER or SPACE

T = %A_TickCount%

LastKeyEvents(60)

T := A_TickCount - T



MsgBox %Keys%

MsgBox % "The last event was:`n`n" Line%Line0% "`n`nIt took " T "ms"



LastKeyEvents(n)

{

   Global Keys

   KeyHistory

   ControlGetText Keys, Edit1, ahk_class AutoHotkey

   Send !{F4}

   StringGetPos pos, Keys, ----------`r`n

   StringTrimLeft Keys, Keys, pos+12

   StringTrimRight Keys, Keys, 23

   StringGetPos pos, Keys, `n, R%n%

   StringTrimLeft Keys, Keys, pos+1

   StringSplit Line, Keys, `n

}