#NoEnv 
#SingleInstance, Force 
#Persistent 
#MaxThreadsPerHotkey 2

f7::
SplashTextOff  						;<-- turn off notification. Will be turned on again if the timer is running.
KeyWait, F7 						;<-- wait for key release
TRunning := !TRunning 					;<-- flag turns timer on and off
If (!TRunning) 						;<-- if the timer is turned off do nothing
return	
Gosub TimerF7 						;<-- otherwise send the space and make a new timer interval
return

TimerF7:
If (TRunning) {   
	
	Random, x, 5, 8 				;<-- gen random number between 5 and 8
	y := (x * 30 * 1000) 				; turn x into minutes	
	;y := (x *  60 * 1000) 				; turn x into seconds 
	
	title = Jump script running			;<-- initialise overlay window title
	text = Sending a spacebar`n interval: %x% min	;<-- initialise overlay window text
	SplashTextOn, 200, 50, %title%, %text%
	Send, {Space} 					; send the space
	SetTimer, TimerF7, -%y% 			;<-- set the timers new interval
}
	
return 							;<-- and exit the timer routine
