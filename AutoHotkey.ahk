; ==========================================================================================
; Autorun part
; ==========================================================================================

; Matchwindow titles by regex
SetTitleMatchMode,  2
SetTitleMatchMode,  slow
SetControlDelay     -1

; where should the windows explorer open by default?
explorerpath:= "explorer /select," userFolder


; Send Alt+F4 upon Ctrl+W in those applications:
GroupAdd, 				CloseWithCtrlW, Greenshot
GroupAdd, 				CloseWithCtrlW, ahk_exe 	taskmgr.exe
GroupAdd, 				CloseWithCtrlW, ahk_exe 	explorer.exe
GroupAdd, 				CloseWithCtrlW, ahk_exe 	notepad.exe			; notepad
GroupAdd, 				CloseWithCtrlW, ahk_exe 	regedit.exe			; regedit
GroupAdd, 				CloseWithCtrlW, ahk_class 	FM				    ; 7zip
GroupAdd,				CloseWithCtrlW, ahk_class 	TfcSearchForm		; FreeCommander search form
GroupAdd,				CloseWithCtrlW, ahk_class   IMWindowClass       ; LYNC chat window
GroupAdd,				CloseWithCtrlW, ahk_exe     WinMergeU.exe       ; WinMerge
GroupAdd,				CloseWithCtrlW, ahk_exe     cmd.exe


GroupAdd, 				EditAhkFile, ahk_class 		Notepad++				
GroupAdd, 				EditAhkFile, ahk_class 		Notepad		


GroupAdd, 				FreeCommander, ahk_exe          FreeCommander.exe

GroupAdd, 				Outlook, ahk_exe                OUTLOOK.EXE

SetNumlockState,        AlwaysOn
SetCapsLockState,       AlwaysOff
DetectHiddenWindows,    On


; ==========================================================================================
; Autorun part end
return 
; ==========================================================================================

; automatically overwrite this script upon launching
#SingleInstance force

PleasantNotify("AutoHotkey reloaded", "" , 330, 80, "b r", "2")

; Include Eclipse hotkeys
#Include C:\Users\wnksbxb\Documents\02_scripts\AutoHotkey\Eclipse.ahk
#Include C:\Users\wnksbxb\Documents\02_scripts\AutoHotkey\EclipseWindow.ahk

; Include OneNote hotkeys
#Include C:\Users\wnksbxb\Documents\02_scripts\AutoHotkey\OneNote.ahk
#Include C:\Users\wnksbxb\Documents\02_scripts\AutoHotkey\SwitchKeyboardLanguage.ahk
#Include C:\Users\wnksbxb\Documents\02_scripts\AutoHotkey\NppToggleSearchPane.ahk

#NoEnv 				; Recommended for performance and compatibility with future AHK releases
SendMode Input 		; Recommended for new scripts due to its superior speed and reliability 

; ------------------------------------------------------------------------------------------
; --------------------- ! is alt ^ is ctrl # is windows + is shift  ------------------------
; ------------------------------------------------------------------------------------------

MinMax()
{
     WinGet, WinState, MinMax, A
    if ( WinState = 0) {
        WinMaximize, A
        return
    }
    WinRestore, A    
}

; ------------------------------------------------------------------------------------------
; Windows-H will minimize, Windows-M will maximize current window
; ------------------------------------------------------------------------------------------
#m::MinMax()
#h::WinMinimize, A
#IfWinNotActive, ahk_exe eclipse.exe
    !h::WinMinimize, A
#IfWinNotActive
; ------------------------------------------------------------------------------------------
; FreeCommander: If more than one open window, close with ctrl-W
; ------------------------------------------------------------------------------------------
#IfWinActive, ahk_group FreeCommander
^w::
	WinGet, c, Count, FreeCommander
	if c >= 2
	{
    		WinClose A
		RunOrSwitchTo("C:\Program Files (x86)\FreeCommander XE\FreeCommander.exe", "FreeCommander")
	}
	 ^l::!d
#IfWinActive

#IfWinActive, ahk_exe explorer.exe
	 !d::send {f4}^{end}^+{home}
	 ^l::!d
#IfWinActive

#IfWinActive, ahk_exe firefox.exe
	^j::Click 1371, 99
#IfWinActive

; ------------------------------------------------------------------------------------------
; Outlook: If more than one open window, close with ctrl-W
; ------------------------------------------------------------------------------------------
#IfWinActive, ahk_group Outlook
^w::
	If WinActive("Posteingang")
	{
		Return
	}
 	WinClose A
	RunOrSwitchTo("C:\Program Files (x86)\Microsoft Office\Office14\OUTLOOK.EXE")
#IfWinActive

Capslock::<
+Capslock::>

; ------------------------------------------------------------------------------------------
; Disable insert, keep num lock and caps lock state
; ------------------------------------------------------------------------------------------
Insert::Delete
+Numpad0::Delete
SetNumlockState, 	AlwaysOn
SetCapsLockState, 	AlwaysOff
#SC01B::return                                                                               ; disable screen magnifier  because I hate it
!Shift::return                                                                               ; disable input lang switch because I hate it
#Shift::return                                                                               ; disable input lang switch because I hate it
~LAlt Up:: return                                                                            ; don't go to window menu thingy with alt

#d::SetDefaultKeyboard(0x407)


focusZeuss()
{
    
    if WinExist("ahk_exe Zeuss.exe")
        WinActivate
        Return
    if WinExist("ahk_exe javaw.exe") and WinExist("ahk_class SWT_Window0")
        WinActivate
        Return
    RunOrSwitchTo("D:\ewa\Applications\Zeuss\Zeuss.exe")
}

focusLync()
{
     if WinExist("ahk_exe lync.exe")
        WinActivate
}
; ------------------------------------------------------------------------------------------
; windows+key opens program
; requires RunOrSwitchTo.ahk to be loaded
; ------------------------------------------------------------------------------------------
#Include C:\Users\wnksbxb\Documents\02_scripts\AutoHotkey\RunOrSwitchTo.ahk

#n::RunOrSwitchTo("C:\Users\wnksbxb\Applications\Notepad++\notepad++.exe")                                        ; win+n         notepad++
#i::RunOrSwitchTo("C:\Program Files (x86)\Integrity\IntegrityClient11_SWE\bin\integrityg.exe")                          ; win+i         integrity
#!n::RunOrSwitchTo("C:\Program Files (x86)\Microsoft Office\Office14\ONENOTE.EXE")                                      ; win+alt+n     onenote
#c::RunOrSwitchTo("C:\Users\wnksbxb\Applications\Console2\Console.exe", "Console", " -t Console")                                 ; win+c         console
#f::RunOrSwitchTo("C:\Users\wnksbxb\AppData\Local\Firefox Developer Edition\firefox.exe", "Firefox Developer Edition")  ; win+f         firefox
#+e::RunOrSwitchTo("C:\Users\wnksbxb\Applications\eclipse\eclipse.exe")                                                 ; win+shift+e   eclipse
#+x::RunOrSwitchTo("C:\Program Files (x86)\Microsoft Office\Office14\EXCEL.exe")                                        ; win+shift+x   excel
#e::RunOrSwitchTo("C:\Program Files (x86)\FreeCommander XE\FreeCommander.exe", "FreeCommander")                         ; win+e         freecommander
#+r::RunOrSwitchTo("C:\Users\wnksbxb\Applications\riot\Riot.exe")                                                                 ; win+shift+r   riot                            
#o::RunOrSwitchTo("C:\Program Files (x86)\Microsoft Office\Office14\OUTLOOK.EXE")                                       ; win+o         outlook
#+p::RunOrSwitchTo("C:\Users\wnksbxb\Applications\ProcessExplorer\procexp64.exe")                                                 ; win+shift+p   sysinternals process explorer

#+z::focusZeuss()                                                                                                       ; win+shift+z   zeuss
#g::                                                                                                                    ; win+g         disable game bar, do nothing
#q::focusLync()


; ------------------------------------------------------------------------------------------
; alt-shift-d opens download folder
; opens explorer on c drive
; ------------------------------------------------------------------------------------------
; !+d::Run, explore "C:\Users\wnksbxb\Downloads"
#+d::Run, explore "C:\Users\wnksbxb\Downloads"
#^d::Run, explore "C:\Users\wnksbxb\Documents"
#+g::Run, explore "C:\Users\wnksbxb\git"
#+w::Run, explore "d:\_ws"

; ------------------------------------------------------------------------------------------
; Notepad++
; ------------------------------------------------------------------------------------------
#IfWinActive, ahk_exe notepad++.exe
	F10::
	F11::
	F12::
	F1::
	+Escape::
	!Up::Send ^+{Up}
	!Down::Send ^+{Down}
    ~^!f::FindAllOpen()
#IfWinActive
   

; ------------------------------------------------------------------------------------------
; close with ctrl-w
; ------------------------------------------------------------------------------------------
#IfWinActive ,ahk_group CloseWithCtrlW
	^w::Send, !{F4}
#IfWinActive

#IfWinActive, ahk_exe cmd.exe
    esc::Send, !{F4}
#IfWinActive

; Same hotkeys in VisualMerge and WinMerge
#IfWinActive Visual Merge
	!Down::F8
	!Up::F7
#IfWinActive 

#IfWinActive, ahk_exe WinMergeU.exe
    !^+Right::ControlClick, x528 y10, A,, M
    !^+Left::ControlClick, x528 y14, A,, M
    +Tab::F6
#IfWinActive


; ------------------------------------------------------------------------------------------
; Send a sequence of key presses. Call like SendWithSleeps( "h-Down-Down-Down-Enter" )
; ------------------------------------------------------------------------------------------
; Required for Eclipse.ahk
SendWithSleeps( string, delay=100 ) {
	pos := 0
	Loop, Parse, string, -, 
	{
		Send, { %A_LoopField% }
		Sleep %delay%
	}
}


; ------------------------------------------------------------------------------------------
; Integrity++
; ------------------------------------------------------------------------------------------
#IfWinActive, ahk_exe IntegrityClient.exe
	^,::
	{
		Click 26, 37 
		Send, { Down }
		Send, { Enter }
	}
	return
#IfWinActive


; ------------------------------------------------------------------------------------------
; reload with ctrl+(alt/shift)+(y/r) in notepad and notepad++
; ------------------------------------------------------------------------------------------

#IfWinActive, ahk_group EditAhkFile 
; ------------------------------------------------------------------------------------------
ReloadThis() 
{	
	Reload
	Sleep 1000 ; If successful, the reload will close this instance during the Sleep, so the line below will never be reached.
	MsgBox, 4,, The script could not be reloaded. Would you like to open it for editing?
	IfMsgBox, Yes, Edit
	return	
}
;	^+y::ReloadThis()
;	^!y::ReloadThis()
	^!r::ReloadThis()
	^+r::ReloadThis()
#IfWinActive

; ------------------------------------------------------------------------------------------
; Map paint.net like photoshop
; ------------------------------------------------------------------------------------------

SetTitleMatchMode, 2 ; match start of the title
#IfWinActive, paint.net
	g::f
	m::s
	w::s
    ^v::^+v
#IfWinActive

; ------------------------------------------------------------------------------------------
; enable extra mouse buttons in 7zip
; ------------------------------------------------------------------------------------------
#IfWinActive ahk_class FM
	XButton1::Backspace
	XButton2::Enter
#IfWinActive

; ------------------------------------------------------------------------------------------
; winmerge: replace with ctrl+r
; ------------------------------------------------------------------------------------------
#IfWinActive ahk_exe WinMergeU.exe
	^r::^h
#IfWinActive

; ------------------------------------------------------------------------------------------
; Firefox
; ------------------------------------------------------------------------------------------
#IfWinActive ahk_exe firefox.exe
	^y::^+h
#IfWinActive


; ------------------------------------------------------------------------------------------
; OneNote
; ------------------------------------------------------------------------------------------
 #IfWinActive ahk_exe ONENOTE.EXE
	^+f::Send, ^{ e }
 #IfWinActive

; ------------------------------------------------------------------------------------------
; Explorer
; ------------------------------------------------------------------------------------------
#IfWinActive ahk_exe explorer.exe
	!g::
    ControlFocus, ToolbarWindow322
    send {space}
#IfWinActive


; ------------------------------------------------------------------------------------------
; paste to console with ctrl+v
; ------------------------------------------------------------------------------------------
#IfWinActive ahk_class ConsoleWindowClass
	^v::SendInput {Raw}%clipboard%
#IfWinActive

SendToControl() {
    WinGet, Items, ControlList, A
    lastItem:=
    Loop, Parse, Items, `n
    {
        ControlGetText, theText, %A_LoopField%
        IfInString, theText, Console
        {  
            lastItem:=A_LoopField
        }
    }
    ControlClick, %lastItem%, A,, M
}
#IfWinActive, ahk_exe Console.exe
    SetTitleMatchMode, RegEx
    IfWinActive, ^Console$
    {
        ^v::SendToControl()
    }  
    SetTitleMatchMode, 2
#IfWinActive

FindAllOpen() {
    Send, ^{f}
    Send, !{o}
    Sleep, 150
    ControlFocus, Scintilla3
}


SetDefaultKeyboard(LocaleID){
	Global
	SPI_SETDEFAULTINPUTLANG := 0x005A
	SPIF_SENDWININICHANGE := 2
	Lan := DllCall("LoadKeyboardLayout", "Str", Format("{:08x}", LocaleID), "Int", 0)
	VarSetCapacity(Lan%LocaleID%, 4, 0)
	NumPut(LocaleID, Lan%LocaleID%)
	DllCall("SystemParametersInfo", "UInt", SPI_SETDEFAULTINPUTLANG, "UInt", 0, "UPtr", &Lan%LocaleID%, "UInt", SPIF_SENDWININICHANGE)
	WinGet, windows, List
	Loop %windows% {
		PostMessage 0x50, 0, %Lan%, , % "ahk_id " windows%A_Index%
	}
}
return


; ------------------------------------------------------------------------------------------
; Debugging: - alt-Y for key history or window title
; ------------------------------------------------------------------------------------------
;#InstallKeybdHook
;^!+y::KeyHistory 

;!y::
;WinGetTitle, Title, A
;MsgBox, The active window is "%Title%".
    
; !y::
    ; DetectHiddenText, On
    ; WinGetText, text
    ; MsgBox, The text is: %text%
    ; return

return
