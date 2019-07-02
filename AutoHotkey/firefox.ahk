; make firefox open settings menu with ctrl+,
#IfWinActive, ahk_exe firefox.exe
^,::
  Send, ^{t}
  Send, ^{l}
  SendRaw, about:preferences
  Send, {Enter}
  return
#IfWinActive
