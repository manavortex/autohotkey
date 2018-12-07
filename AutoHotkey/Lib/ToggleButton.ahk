
ToggleButton(Key){
  KeyIsDown := GetKeyState(Key)
  ; MsgBox, "Key is " %Key% ", down: " %KeyIsDown%
 if KeyIsDown
 {
	SendInput {%Key% up}
 }
 else 
 {
	SendInput {%Key% down}
 }
}
