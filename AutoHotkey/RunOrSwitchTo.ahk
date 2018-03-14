; ===========================================================================
; Run a program or switch to it if already running.
; Courtesy of https://autohotkey.com/board/topic/7129-run-a-program-or-switch-to-an-already-running-instance/
;    Target - Program to run. E.g. Calc.exe or C:\Progs\Bobo.exe
;    WinTitle - Optional title of the window to activate.  Programs like
;       MS Outlook might have multiple windows open (main window and email
;       windows).  This parm allows activating a specific window.
; ===========================================================================
RunOrSwitchTo(Target, WinTitle = "")
{
	; Get the filename without a path
	SplitPath, Target, TargetNameOnly

	Process, Exist, %TargetNameOnly%
	If ErrorLevel > 0
		PID = %ErrorLevel%
	Else
		Run, %Target%, , , PID

	; Activate by title if given, otherwise use PID.
	If WinTitle <>
	{
		SetTitleMatchMode, 2
		TrayTip, , Activating Window Title "%WinTitle%" (%TargetNameOnly%)
		WinActivate, %WinTitle%
	}
	Else
	{
		TrayTip, , Activating PID %PID% (%TargetNameOnly%)
		WinActivate, ahk_pid %PID%
	}
	SetTimer, RunOrActivateTrayTipOff, 200
}

; Turn off the tray tip
RunOrActivateTrayTipOff:
	SetTimer, RunOrActivateTrayTipOff, off
	TrayTip
Return
