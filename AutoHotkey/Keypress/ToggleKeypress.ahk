#NoEnv

toggle_keypress() {
 static t
 t := !t
 Return, t
}

ToggleButton(Key){
 if toggle_keypress() 
 {
	HoldButton(Key)
 }
 else 
 {
	SendInput {w up}
 }
}

HoldButton(Key){
    SendInput {%Key% up}{%Key% down}
    Loop
    {
        Sleep 100
        GetKeyState state, %Key%
        if state = u
            return
    }
}
