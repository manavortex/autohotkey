cos_mousedrag_treshold := 20 ; pixels

    
#IfWinNotActive ahk_class ConsoleWindowClass

~lButton::
  MouseGetPos, cos_mousedrag_x, cos_mousedrag_y
  keywait lbutton
  mousegetpos, cos_mousedrag_x2, cos_mousedrag_y2
  if (abs(cos_mousedrag_x2 - cos_mousedrag_x) > cos_mousedrag_treshold
    or abs(cos_mousedrag_y2 - cos_mousedrag_y) > cos_mousedrag_treshold)
  {
    wingetclass cos_class, A
    if (cos_class == "Emacs")
      sendinput !w
    else
      sendinput ^c
  }
  return
  
~mbutton::
  WinGetClass cos_class, A
  if (cos_class == "Emacs")
    SendInput ^y
  else
    SendInput ^v
  return
  
#IfWinNotActive


;; clipx
^mbutton::
  sendinput ^+{insert}
  return