#NoEnv

ToggleButton(Key){
 if GetKeyState(Key)
 SendInput {%Key% up}
 else 
	SendInput {%Key% down}
}

; Games without auto-run button, so make XButton 1 toggle W
GroupAdd,				  AutoRun, 		    ahk_exe MassEffectAndromeda.exe
GroupAdd,				  AutoRun, 		    ahk_exe MassEffect3.exe
GroupAdd,				  AutoRun, 		    ahk_exe ShooterGame.exe
GroupAdd,				  AutoRun, 		    ahk_exe DragonAgeInquisition.exe
GroupAdd,				  AutoRun, 		    ahk_exe MonsterHunterWorld.exe


; Games without secondary key bindings, so make XButton 2 press E
GroupAdd,				  ButtonTwoE, 		ahk_exe ShooterGame.exe
GroupAdd,				  ButtonTwoE, 		ahk_exe MassEffectAndromeda.exe
GroupAdd,				  ButtonTwoE, 		ahk_exe MassEffect3.exe
GroupAdd,				  ButtonTwoE, 		ahk_exe MonsterHunterWorld.exe
GroupAdd,				  ButtonTwoE, 		ahk_exe DragonAgeInquisition.exe
GroupAdd,				  ButtonTwoE, 		ahk_exe eso64.exe


; ------------------------------------------------------------------------------------------
; Games: Make auto-run work 
; ------------------------------------------------------------------------------------------
#IfWinActive, ahk_group AutoRun
	XButton1::ToggleButton("w")
#IfWinActive

#IfWinActive, ahk_group ButtonTwoE
	XButton2::e
#IfWinActive


; ------------------------------------------------------------------
; 			Andromeda
; ------------------------------------------------------------------
(
#IfWinActive, (ahk_exe MassEffectAndromeda.exe) or 
(ahk_exe MassEffect3.exe)
)
	q::ToggleButton("w")
	F13::AlternateKeypress("m", "Tab")
	F14::h
#IfWinActive

toggle_alternate() {
 static t
 t := !t
 Return, t
}

_SendIt(Key)
{  
	Send, {%key% down}
	Sleep, 50
	Send, {%key% up}
	Sleep, 50
	Return
}

AlternateKeypress(Key1, Key2)
{
   if (toggle_alternate())
   {
	 _SendIt(Key1)
   }
	else
	{
	_SendIt(Key2)
	}	
}
