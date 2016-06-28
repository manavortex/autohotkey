~Shift & WheelUp::  ; Scroll left
  ControlGetFocus, fcontrol, A
  Loop 2  ; <-- Increase this value to scroll faster.
    SendMessage, 0x114, 0, 0, %fcontrol%, A  ; 0x114=WM_HSCROLL; 0=SB_LINELEFT
return

~Shift & WheelDown::  ; Scroll right
  ControlGetFocus, fcontrol, A
  Loop 2  ; <-- Increase this value to scroll faster.
    SendMessage, 0x114, 1, 0, %fcontrol%, A  ; 0x114=WM_HSCROLL; 1=SB_LINERIGHT
return