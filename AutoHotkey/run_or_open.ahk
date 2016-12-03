´RunOrActivate(Target, WinTitle = "")
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
