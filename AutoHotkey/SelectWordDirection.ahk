; for those annoying programs who don't let you select stuff with ctrl+shift+arrow and instead move the window around or whatelse

^+Right::SelectWordRight()
^+Left::SelectWordLeft()

SelectWordLeft()
    {
        counter := 0
        Loop
        {
            If GetKeyState("F2","P")  ; terminate the loop whenever you want by pressing F2
                break    
            clipboard =           ; empty the clipboard (start off empty to allow ClipWait to detect when the text has arrived)
            ; Send, +^{Left}      ; select text by whole words to the left
            Send, +{Left}         ; select text by single characters to the left
            Send, ^c              ; copy selected text
            ClipWait              ; wait until the clipboard contains data
            StringLeft, OutputVar, clipboard, 1  ; save the first character from the left side of the clipboard in the variable OutputVar
            If (counter > 1)
            {
            If OutputVar = " "    ; if " " has been found, terminate the loop
                Send, +{Right}
                break             
            }
        }
        clipboard := ClipSaved    ;restore original clipboard
        return
    }
    SelectWordRight()
    {
        counter := 0
        Loop
        {
            counter = counter + 1
            If GetKeyState("F2","P")  ; terminate the loop whenever you want by pressing F2
                break    
            clipboard =           ; empty the clipboard (start off empty to allow ClipWait to detect when the text has arrived)
            
            Send, +{Right}        ; select text by single characters to the right
            Send, ^c              ; copy selected text
            ClipWait              ; wait until the clipboard contains data
            StringRight, OutputVar, clipboard, 1  ; save the first character from the right side of the clipboard in the variable OutputVar
            If (counter > 1)
            {
            If OutputVar = " "    ; if " " has been found, terminate the loop
                Send, +{Left}
                break
            }
        }
        clipboard := ClipSaved    ;restore original clipboard
        return
    }
