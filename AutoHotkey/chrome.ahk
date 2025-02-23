#IfWinActive, ahk_exe chrome.exe
{
	^i::SurroundWithTags("<i>", "</i>")
	^b::SurroundWithTags("<b>", "</b>")
	^+b::
	{
		SetTitleMatchMode, RegEx
		IfWinActive, Editing.*Wiki
		{			
			SurroundWithTags("", "<br />")
		}	
		IfWinActive, Archive of Our Own
		{
			SurroundWithTags("<blockquote", "</blockquote>")
		}
		SetTitleMatchMode, 2
	}
}
#IfWinActive

global text_selected := false

SurroundWithTags(openingTag, closingTag) {
	ClipSaved := ClipboardAll       	;save clipboard
	clipboard := ""  					; empty clipboard
	Send, ^c    						; copy the selected file
	ClipWait, 1						; wait for the clipboard to contain data	

	if (!ErrorLevel)    				; if NOT ErrorLevel clipwait found data on the clipboard
	{
		If (text_selected)
			clipboard = %openingTag%%clipboard%%closingTag%
		else
			clipboard = %openingTag%%closingTag%
	}
	Send, ^v
	Sleep, 50
	clipboard := ClipSaved       	; restore original clipboard
	ClipSaved := ""   				;  free the memory in case the clipboard was very large.
	return
}

OnClipboardChange:
	text_selected := (A_EventInfo=1)			
	return
