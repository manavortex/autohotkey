#NoEnv 
#SingleInstance, Force 
#Persistent 
#MaxThreadsPerHotkey 2

f8::
KeyWait, F8 ;<-- wait for key release
TRunning := !TRunning ;<-- flag turns timer on and off
If (!TRunning) ;<-- if the timer is turned off do nothing
    return
Gosub TimerF8 ;<-- otherwise send the space and make a new timer interval
return

TimerF8:
If (TRunning)
{   
	Random, x, 5, 8 ;<-- g                              
	;x := (x * 1000) ; turn x into seconds
	WinGet, winList, List, 
	Loop % winList
		controlsend,,{0 down}{0 up}, WARFRAME
    		controlsend,,{0 down}{0 up}, WARFRAME
    
	return
	SetTimer, TimerF8, -%x% ;<-- set the timers new interval
 
   
}
return ;<-- and exit the timer routine

