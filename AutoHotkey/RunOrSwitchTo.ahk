; ===========================================================================
; Run a program or switch to it if already running.
; Courtesy of https://autohotkey.com/board/topic/7129-run-a-program-or-switch-to-an-already-running-instance/
;    Target - Program to run. E.g. Calc.exe or C:\Progs\Bobo.exe
;    WinTitle - Optional title of the window to SwitchTo.  Programs like
;       MS Outlook might have multiple windows open (main window and email
;       windows).  This parm allows activating a specific window.
; ===========================================================================

SetTitleMatchMode 2          ; Match title of windows by part of the name


GroupAdd, 				DontMinMax, ahk_exe Console.exe
GroupAdd, 				DontMinMax, ahk_exe Eclipse.exe


RunOrSwitchTo(Target="", WinTitle="", WinArgs="")
{  
  If WinTitle <>
	{
		SetTitleMatchMode, 2    
    If WinExist(WinTitle)
		{
      WinActivate, %WinTitle%
      WinWaitActive , %WinTitle%, , 1
      
      SetTimer, WinMax, 300
      Return
    }
	}
  
	; Get the filename without a path
	SplitPath, Target, TargetNameOnly

	Process, Exist, %TargetNameOnly%
	If ErrorLevel > 0
  {
		PID = %ErrorLevel% 
  }	
  Else { 
    Run, %Target%, , , PID    
  }

	; SwitchTo by title if given, otherwise use PID.
	If WinTitle <>
	{
		SetTitleMatchMode, 2
		WinActivate, %WinTitle%
	}
	Else
	{
		; TrayTip, , Activating PID %PID% (%TargetNameOnly%)
		WinActivate, ahk_pid %PID%
	}
  
	SetTimer, WinMax, 300
	; SetTimer, RunOrSwitchToTrayTipOff, 200
}

; Turn off the tray tip
RunOrSwitchToTrayTipOff:
	SetTimer, RunOrSwitchToTrayTipOff, off
	TrayTip
Return

; Turn off the tray tip
WinMax:
	SetTimer, WinMax, off
  If WinActive("ahk_exe ConEmu64.exe")
  {
    WinActivate, Cmder    
  }
   If WinActive("ahk_group DontMinMax") 
      return

  WinGet MMX, MinMax, A
  IfEqual MMX,-1, WinMaximize, A
    
Return
