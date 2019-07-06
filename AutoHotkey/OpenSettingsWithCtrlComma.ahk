; open settings menu with ctrl+, - has to be registered on an on program basis

#IfWinActive ahk_exe firefox.exe
  ^,::
    Send, ^{t}
    Send, ^{l}
    SendRaw, about:preferences
    Send, {Enter}
    return
#IfWinActive

#IfWinActive ahk_exe notepad++.exe
	^,::WinMenuSelectItem, A, , Settings, Preferences...
	^!,::WinMenuSelectItem, A, , Settings, Style Configurator...
	^+,::WinMenuSelectItem, A, , Settings, Shortcut Mapper...
#IfWinActive
