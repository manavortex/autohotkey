#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

$Insert:: 
GetKeyState, InsertState, Insert, T
If InsertState = U ;If insert is off 
{ 
MsgBox, 260, , Are you sure you want to enable insert?, 5 
} 
If InsertState = D ;If insert is on 
{ 
MsgBox, 4, , Are you sure you want to disable insert?, 5 
} 
IfMsgBox No 
return 
else IfMsgBox Timeout 
return 
Else 
Send {Insert} 
return
