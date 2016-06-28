#NoEnv 
#SingleInstance, Force 
#Persistent 
#MaxThreadsPerHotkey 2

f7::
KeyWait, F7 ;<-- wait for key release
TRunning := !TRunning ;<-- flag turns timer on and off
If (!TRunning) ;<-- if the timer is turned off do nothing
return
Gosub TimerF7 ;<-- otherwise send the space and make a new timer interval
return

TimerF7:
If (TRunning)
{   Random, x, 5, 8 ;<-- gen random number between 5 and 8
x := (x * 30 * 1000) ; turn x into minutes	
;x := (x *  60 * 1000) ; turn x into seconds
Send, {Space} ; send the space
SetTimer, TimerF7, -%x% ;<-- set the timers new interval


}
return ;<-- and exit the timer routine