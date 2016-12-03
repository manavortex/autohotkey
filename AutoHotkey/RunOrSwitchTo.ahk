; courtesy of https://autohotkey.com/board/topic/7129-run-a-program-or-switch-to-an-already-running-instance/page-2
RunOrActivate(Target, WinTitle = "")
{
	wincheck = %ahk_exe%%WinTitle%
	if WinExist(wincheck)
	{
		WinActivate
		WinMaximize
	}
	else
	    Run Target
	return
}
