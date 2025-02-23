; #NoEnv

; Games without dedicated auto-run (put it on Xbutton1)
GroupAdd("AutoRun", "ahk_exe MassEffectAndromeda.exe")
GroupAdd("AutoRun", "ahk_exe MassEffect3.exe")
GroupAdd("AutoRun", "ahk_exe ShooterGame.exe")
GroupAdd("AutoRun", "ahk_exe DragonAgeInquisition.exe")
GroupAdd("AutoRun", "ahk_exe NMS.exe")
GroupAdd("AutoRun", "ahk_exe IndianaEpicGameStore-Win64-Shipping.exe")
GroupAdd("AutoRun", "ahk_exe MonsterHunterWorld.exe")
GroupAdd("AutoRun", "ahk_exe DragonAgeInquisition.exe")
GroupAdd("AutoRun", "ahk_exe daorigins.exe")
GroupAdd("AutoRun", "ahk_exe DragonAge2.exe")
GroupAdd("AutoRun", "ahk_exe Subnautica.exe")
GroupAdd("AutoRun", "ahk_exe SubnauticaZero.exe")
GroupAdd("AutoRun", "ahk_exe Cyberpunk2077.exe")
GroupAdd("AutoRun", "ahk_exe eldenring.exe")
GroupAdd("AutoRun", "ahk_exe Avowed-Win64-Shipping.exe")

; Map Q to auto run 
GroupAdd("QAutoRun", "ahk_exe Avowed-Win64-Shipping.exe")


; Games without secondary key bindings, so make XButton 2 press E
GroupAdd("ButtonTwoE", "ahk_exe ShooterGame.exe")
GroupAdd("ButtonTwoE", "ahk_exe MassEffectAndromeda.exe")
GroupAdd("ButtonTwoE", "ahk_exe MassEffect3.exe")
GroupAdd("ButtonTwoE", "ahk_exe IndianaEpicGameStore-Win64-Shipping.exe")
GroupAdd("ButtonTwoE", "ahk_exe MonsterHunterWorld.exe")
GroupAdd("ButtonTwoE", "ahk_exe DragonAgeInquisition.exe")
GroupAdd("ButtonTwoE", "ahk_exe eso64.exe")
GroupAdd("ButtonTwoE", "ahk_exe NMS.exe")

; Games without secondary key bindings, so make XButton 2 press F
GroupAdd("ButtonTwoF", "ahk_exe Cyberpunk2077.exe")
GroupAdd("ButtonTwoF", "ahk_exe DragonAgeInquisition.exe")
GroupAdd("ButtonTwoF", "ahk_exe daorigins.exe")
GroupAdd("ButtonTwoF", "ahk_exe DragonAge2.exe")


; ------------------------------------------------------------------------------------------
; Group triggers
; ------------------------------------------------------------------------------------------
#HotIf WinActive("ahk_group AutoRun")
	XButton1::ToggleButton("w")
#HotIf

#HotIf WinActive("ahk_group QAutoRun")
	q::ToggleButton("w")
#HotIf

#HotIf WinActive("ahk_group ButtonTwoE")
	XButton2::e
#HotIf

#HotIf WinActive("ahk_group ButtonTwoF")
	XButton2::f
#HotIf

; ------------------------------------------------------------------------------------------

#HotIf WinActive("ahk_exe Cyberpunk2077.exe")
^::~
#HotIf

#HotIf WinActive("ahk_exe NMS.exe")
	^e::_SendIt("e", 50)
#HotIf

#HotIf WinActive("ahk_exe Subnautica.exe")
	XButton2::LButton
#HotIf

#HotIf WinActive("ahk_exe SubnauticaZero.exe")
	XButton2::LButton
#HotIf

#HotIf WinActive("ahk_exe MarsSteam.exe")
	^MButton::_SendIt("LButton", 20)
#HotIf

; ------------------------------------------------------------------

#HotIf WinActive("ahk_exe DragonAgeInquisition.exe")
	^f11::_SendIt("Enter", 20)
	+f12::+f11
	f12::+f11
	; Shift::Space 	
#HotIf

#HotIf WinActive("ahk_exe daorigins.exe")
	f11::_Click(1500)  
	;f12::Send,  #{PrintScreen} ;
	; Shift::Space 
#HotIf

#HotIf WinActive("ahk_exe DragonAge2.exe")
	f11::_Click(1500)  
	;f12::Send,  #{PrintScreen} ;
	; Shift::Space 
#HotIf

; ------------------------------------------------------------------

; Toggles a button state:
; If button is pressed, will release it
; If button is not pressed, will press it and keep it pressed
ToggleButton(Key)
{
  if GetKeyState(Key)
    Send "{" Key " up}"
  else 
    Send "{" Key " down}"
}

; Sends a number of clicks, waiting for a delay after every click. 
; Useful for buying/crafting a metric fucktonne of items.
_Click(Times:=1, SleepInterval:=50)
{
  Loop %Times%
  {
    Click
    Sleep( %SleepInterval% )
  }
  Return
}

; Presses a key X times, waiting for a delay after every keypress. 
; Useful for buying/crafting a metric fucktonne of items.
_SendIt(Key, Times := 1, SleepInterval := 50 )
{
  Loop(%Times%)
  {
    Send "{" Key " down}"
    Sleep( %SleepInterval% )
    Send  "{" Key " up}"
    Sleep( %SleepInterval% )
  }
}


^+f12::_Click(100)

; #InstallKeybdHook