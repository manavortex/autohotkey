#NoEnv

#IfWinActive, ahk_exe ConanSandbox.exe
    toggle:=1
    ~Enter::toggle:=!toggle ; changes value of toggle from True to False or Vice Versa with each press of F12

    #If toggle     
     T::
        Click, 2
        Return
    #If
    
    #If !toggle
        ~LButton::
            toggle:=0 ; changes value of toggle from True to False or Vice Versa with each press of F12
            Return
        ~RButton::
            toggle:=0 ; changes value of toggle from True to False or Vice Versa with each press of F12
            Return

    #If

#IfWinActive
