; ==========================================================================================
; Autorun part
; ==========================================================================================

; Matchwindow titles by regex
SetTitleMatchMode, 2

SetNumlockState, 		  AlwaysOn
SetCapsLockState, 		AlwaysOff
DetectHiddenWindows, 	On

; where should the windows explorer open by default?
explorerpath:= "explorer /select," userFolder

; automatically overwrite this script upon launching
#SingleInstance force
#NoEnv 			    ; Recommended for performance and compatibility with future AutoHotkey releases.
SendMode Input 	; Recommended for new scripts due to its superior speed and reliability.

; ==========================================================================================
; Groups
; ==========================================================================================

; Send Alt+F4 upon Ctrl+W in those applications:
GroupAdd, 				CloseWithCtrlW, Greenshot
GroupAdd, 				CloseWithCtrlW, ahk_exe 	  explorer.exe
GroupAdd, 				CloseWithCtrlW, ahk_exe 	  notepad.exe			; notepad
GroupAdd, 				CloseWithCtrlW, ahk_exe 	  regedit.exe			; regedit
GroupAdd, 				CloseWithCtrlW, ahk_class 	FM				      ; 7zip
GroupAdd,				  CloseWithCtrlW, ahk_class 	TfcSearchForm		; FreeCommander search form		
GroupAdd,				  CloseWithCtrlW, ahk_exe     fontview.exe		;
GroupAdd,				  CloseWithCtrlW, ahk_exe     Monosnap.exe		;

; These apps can be used to edit *.ahk-files, reload on ctrl+y:
GroupAdd, 				EditAhkFile,    ahk_class 		Notepad++				
GroupAdd, 				EditAhkFile,    ahk_class 		Notepad		
GroupAdd, 				EditAhkFile,    ahk_exe 		  SciTE.exe


#Include %A_ScriptDir%\Autohotkey\00_gaming.ahk

; ==========================================================================================
; RunOrSwitchTo, can't live without
; ==========================================================================================

#Include %A_ScriptDir%\Autohotkey\RunOrSwitchTo.ahk

#n::RunOrSwitchTo("C:\Program Files (x86)\Notepad++\notepad++.exe", "ahk_exe notepad++.exe")
#e::RunOrSwitchTo("C:\Program Files\FreeCommander XE\FreeCommander.exe", "ahk_exe FreeCommander.exe")
#f::RunOrSwitchTo("C:\Program Files\Firefox Developer Edition\firefox.exe", "Firefox Developer Edition")
#^c::RunOrSwitchTo("C:\01_apps\Console2\Console.exe")
#c::RunOrSwitchTo("C:\01_apps\Console2\Console.exe" -t bash)
!^+n::RunOrSwitchTo("C:\Program Files (x86)\Evernote\Evernote\Evernote.exe")



; ------------------------------------------------------------------
;				! is alt ^ is ctrl # is windows + is shift
; ------------------------------------------------------------------

#m::WinMaximize, A 	; Windows-M will maximize current window
!h::WinMinimize, A 	; Alt-H will minimize current window

Insert::Delete      ; disable annoying delete
Capslock::<         ; Make capslock serve as <> key
+Capslock::>        ; Make capslock serve as <> key
+Alt::              ; Disable input language switch
#Space::            ; Disable language switch
!+::                ; Disable Screen Magnifier

^!#n::#+e		        ; evernote


; ------------------------------------------------------------------
; 			Notepad ++
; ------------------------------------------------------------------
#IfWinActive, ahk_class Notepad++
	F10::^s
	F11::return
	F12::return
	^e::return
	F1::return
	+esc::return
#IfWinActive

; ------------------------------------------------------------------------------------------
; close with ctrl-w
; ------------------------------------------------------------------------------------------
#IfWinActive, ahk_group CloseWithCtrlW
	; ^w::Send !{F4}  
	^w::WinClose A
#IfWinActive
 

; ------------------------------------------------------------------------------------------
; when editing an *.ahk: Ctrl+Shift+R: Reload - requires first line SetTitleMatchMode, 2
; ------------------------------------------------------------------------------------------

ReloadThis() 
{				
	SetTitleMatchMode, 2
	#IfWinActive, ahk
	TrayTip, Reloading..., Autohotkey-Script reloading, 20, 170
	Sleep, 200
	TrayTip
	Reload
	#IfWinActive
}
SetTitleMatchMode, 2 	



#IfWinActive, ahk_group EditAhkFile	
	^+y::ReloadThis()
	^!y::ReloadThis()
	^!r::ReloadThis()
	^+r::ReloadThis()
#IfWinActive

; ------------------------------------------------------------------------------------------
; uncomment for debug - alt-Y for key history
; ------------------------------------------------------------------------------------------
;#InstallKeybdHook
;!y::KeyHistory 


return
