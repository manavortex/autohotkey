; Toggles microphone mute via svcl.exe and displays a notification
; Requires https://www.nirsoft.net/utils/sound_volume_command_line.html
micMuted := false

; Set up the hotkey
^+m::
{
    global micMuted
    ; Toggle microphone mute/unmute
    micMuted := !micMuted

    ; Run SoundVolumeView command to mute/unmute microphone by name (adjust as needed)
    if (micMuted) {    
        Run(A_ComSpec " /c svcl.exe /Unmute Microphone", , "Hide")
        TrayTip "Microphone unmuted",, "Mute"
        SetTimer () => TrayTip(), -2000
    }
    else {
        Run(A_ComSpec " /c svcl.exe /Mute Microphone", , "Hide")
        TrayTip "Microphone muted",, "Mute"
        SetTimer () => TrayTip(), -2000
    }
}
