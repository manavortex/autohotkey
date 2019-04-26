#NoEnv

; ------------------------------------------------------------------
;				! is alt ^ is ctrl # is windows + is shift
; ------------------------------------------------------------------


; ------------------------------------------------------------------
; 				Conan
; ------------------------------------------------------------------
#IfWinActive, ahk_exe ConanSandbox.exe
    ^t::Click, 2 
    Home Up::ToggleButton("Shift")
    F9::ClickTimes(10)
#IfWinActive


; ------------------------------------------------------------------
; 				AC Unity
; ------------------------------------------------------------------
#IfWinActive, ahk_exe ACU.exe
    m::Tab
    ^e::Enter
    r::Enter
    Home::ToggleButton("w")
    End::ToggleButton("Shift")
#IfWinActive





; ------------------------------------------------------------------
  ; 			DA:I
; ------------------------------------------------------------------
#IfWinActive, ahk_exe DragonAgeInquisition.exe
	XButton2::f
	PgDn::Esc
	PgUp::V
  Home::Space
  ~m::SendInput, {w up}
  MButton::Esc
  ; e::f
	q::ToggleButton("w")
  End::stopRunningAndPress("m")
  ^y::PressButton("s", 50)
  ^+y::BuyAll()
  ~RButton::

    If (A_TimeSincePriorHotkey<400) and (A_TimeSincePriorHotkey<>-1)

     SendInput, { Esc }

    Return
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


; ------------------------------------------------------------------
; 			MHW
; ------------------------------------------------------------------
#IfWinActive, ahk_exe MonsterHunterWorld.exe
	PgUp::Enter
	PgDn::Space
#IfWinActive



; ------------------------------------------------------------------
; 				ESO
; ------------------------------------------------------------------
IfWinActive ahk_class EsoClientWndClass
{ 
	NumpadEnter::return
	; !+::
    !f4::!+^q        
}






; Games without auto-run button, so make XButton 1 toggle W
GroupAdd,				  AutoRun, 		    ahk_exe DragonAgeInquisition.exe
GroupAdd,				  AutoRun, 		    ahk_exe MassEffectAndromeda.exe
GroupAdd,				  AutoRun, 		    ahk_exe MassEffect3.exe
GroupAdd,				  AutoRun, 		    ahk_exe MonsterHunterWorld.exe
GroupAdd,				  AutoRun, 		    ahk_exe ShooterGame.exe


; Games without secondary key bindings, so make XButton 2 press E
GroupAdd,				  ButtonTwoE, 		ahk_exe MassEffectAndromeda.exe
GroupAdd,				  ButtonTwoE, 		ahk_exe MassEffect3.exe
GroupAdd,				  ButtonTwoE, 		ahk_exe MonsterHunterWorld.exe
GroupAdd,				  ButtonTwoE, 		ahk_exe eso64.exe
GroupAdd,				  ButtonTwoE, 		ahk_exe ShooterGame.exe


; ------------------------------------------------------------------------------------------
; Games: Make auto-run work 
; ------------------------------------------------------------------------------------------
#IfWinActive, ahk_group AutoRun
	XButton1::ToggleButton("w")
  ~s::SendInput, {w up}
  ~Esc::SendInput, {w up}
#IfWinActive

#IfWinActive, ahk_group ButtonTwoE
	XButton2::e
#IfWinActive



; ------------------------------------------------------------------
; ------------------------------------------------------------------
; 			Code
; ------------------------------------------------------------------
; ------------------------------------------------------------------

ToggleButton(Key){
 Sleep, 50
 if GetKeyState(Key)
 SendInput {%Key% up}
 else 
	SendInput {%Key% down}
}

ClickTimes(times){
  Loop, %times% {
    Click
    Sleep, 10
  } 
}

PressButton(key, times) {
  Loop %times%
  {
    SendInput, {%key% down}
    Sleep, 50
    SendInput, {%key% up}
    Sleep, 550
  }
}

BuyAll() { 
  Loop 20
  {
    PressButton("Space", 10)
    Sleep, 50
    _SendIt("s")
    Sleep, 250
  }
}

stopRunningAndPress(Key) {
  SendInput, {w up}
	Sleep, 50
  _SendIt(Key)
}

toggle_alternate() {
 static t
 t := !t
 Return, t
}

_SendIt(Key)
{  
	SendInput, {%key% down}
	Sleep, 50
	SendInput, {%key% up}
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
