#Persistent
SetTimer, checkForWindow, 250
return

; Will check every 250ms if a window exist. If that's the case, it'll activate it and send Enter, then exit.


checkForWindow:
	IfWinExist, "AppName"
	{
		WinActivate, 
		Send {Enter}
		ExitApp
	}
	return
