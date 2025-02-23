; ===========================================================================
; Run a program or switch to it if already running.
; Courtesy of https://autohotkey.com/board/topic/7129-run-a-program-or-switch-to-an-already-running-instance/
;    Target - Program to run. E.g. Calc.exe or C:\Progs\Bobo.exe
;    WinTitle - Optional title of the window to SwitchTo.  Programs like
;       MS Outlook might have multiple windows open (main window and email
;       windows).  This parm allows activating a specific window.
; ===========================================================================

SetTitleMatchMode 2          ; Match title of windows by part of the name

LaunchProgramIfNotRunning(Target, WinTitle, Args)
{
	if (WinExist(WinTitle))
	return

	; Process returns the PID of a matching process exists, or 0 otherwise
	ErrorLevel := WinWait(WinTitle, , 3)

    OutputDebug("[" A_ScriptName "] RunOrSwitchTo: " Target ", " WinTitle)

	ClassID := ''

	; Get the PID and the class if the process is already running
	if (ErrorLevel > 0)
	{
		PID := ErrorLevel
		ClassID := WinGetClass("ahk_pid " PID)
	}
	; Run the program if the process is not already running
	Else
	{
		if (Args = "")
		{
			RunWait("`"" Target "`"", , , &PID)
		}
		else
		{
			RunWait("`"" Target "`" `"" Args "`"", , , &PID)
		}
	}
	Return PID
}


RunOrSwitchTo(Target, WinTitle := "", Args := "")
{
	; Get the filename without a path
	SplitPath(Target, &TargetNameOnly)

	if (WinTitle == "")
	{
		WinTitle := "ahk_exe " TargetNameOnly
	}

	ClassID := LaunchProgramIfNotRunning(Target, WinTitle, Args)

	; Activate by title if it exists
	SetTitleMatchMode(2)
	if (WinActive(WinTitle))
	{
		WinActivateBottom(WinTitle)
	}
	Else
	{
		; Window isn't active. Let's wait for 5 seconds, maybe the app was launching
		Try {
			WinWait(WinTitle, , 5000)
			WinActivate(WinTitle)
		}
	}

	if WinActive("ahk_exe ConEmu64.exe")
	{
		SetControlDelay -1
		ControlClick "x155 y177", "Cmder"
	}

	if WinActive("ahk_group DontMaximizeMe")
	return


	; maximize window
	WinState := WinGetMinMax("A")

	if ( WinState = 0) {
		WinMaximize("A")
		return
	}
    ; WinRestore, A
}
