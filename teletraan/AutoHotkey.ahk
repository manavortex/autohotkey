; ==========================================================================================
; Autorun part
; ==========================================================================================
; automatically overwrite this script upon launching
#SingleInstance force
#NoEnv 			    ; Recommended for performance and compatibility with future AutoHotkey releases.
SendMode Input 	; Recommended for new scripts due to its superior speed and reliability.
; Match window titles by regex
SetTitleMatchMode, 2
DetectHiddenWindows, 	On
; where should the windows explorer open by default?
explorerpath:= "explorer /select," userFolder
; set the default state of the lock keys
SetCapsLockState, off
SetNumLockState, on
SetScrollLockState, off
; disable them
$NumLock::Return
$ScrollLock::Return
$CapsLock::Return
; ==========================================================================================
; Groups
; ==========================================================================================
; Send Alt+F4 upon Ctrl+W in those applications:
GroupAdd, 				CloseWithCtrlW, Greenshot
GroupAdd, 				CloseWithCtrlW, ahk_exe 	  explorer.exe
GroupAdd, 				CloseWithCtrlW, ahk_exe 	  notepad.exe			                 ; notepad
GroupAdd, 				CloseWithCtrlW, ahk_exe 	  regedit.exe			                 ; regedit
GroupAdd, 				CloseWithCtrlW, ahk_class 	FM				                       ; 7zip
GroupAdd,				  CloseWithCtrlW, ahk_class 	TfcSearchForm		                 ; FreeCommander search form		
GroupAdd,				  CloseWithCtrlW, ahk_exe     fontview.exe		                 ;
GroupAdd,				  CloseWithCtrlW, ahk_exe     Monosnap.exe		                 ;
GroupAdd,				  CloseWithCtrlW, ahk_exe     ROCCAT_Swarm.exe                 ; mouse driver
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
#^c::RunOrSwitchTo("C:\01_apps\Console2\Console.exe", "Console2")
#c::RunOrSwitchTo("C:\01_apps\Console2\Console.exe")
!^+n::RunOrSwitchTo("C:\Program Files (x86)\Evernote\Evernote\Evernote.exe")
; ------------------------------------------------------------------
;				! is alt ^ is ctrl # is windows + is shift
; ------------------------------------------------------------------
#m::WinMaximize, A 	; Windows-M will maximize current window
!h::WinMinimize, A 	; Alt-H will minimize current window
Capslock::<         ; Make capslock serve as <> key
+Capslock::>        ; Make capslock serve as <> key
+Alt::              ; Disable input language switch
!+::                ; Disable Screen Magnifier 
!Shift::            ; Disable language switch
#Space::            ; Disable language switch
^!#n::#+e		        ; evernote
#IfWinNotActive, ahk_exe ConanSandbox.exe
  Insert::Delete      ; disable annoying delete
#IfWinNotActive
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
  ^y::^+z
  ^!f::
    send, ^f 
    sleep 200
    send, !d
    return
  
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
	#IfWinActive, ahk
	TrayTip, Reloading..., Autohotkey-Script reloading, 20, 170
	Sleep, 200
	TrayTip
	Reload
	#IfWinActive
}
#IfWinActive, ahk_group EditAhkFile	
	^+y::ReloadThis()
	^!y::ReloadThis()
	^!r::ReloadThis()
	^+r::ReloadThis()
#IfWinActive

; ------------------------------------------------------------------------------------------
; alt key up
; ------------------------------------------------------------------------------------------
~LAlt Up::  
  if (A_PriorKey = "Alt")
    Send, {Esc}
    
    
; ------------------------------------------------------------------------------------------
; uncomment for debug - alt-Y for key history
; ------------------------------------------------------------------------------------------
;#InstallKeybdHook
;!y::KeyHistory 
return
