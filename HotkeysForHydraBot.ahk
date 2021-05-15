;For Hydra Bot on Discord https://hydra.bot/

; Global variables
global break_g = 0
global pathToDiscord = path

;Funtions
OpenDiscord() {
    try {
        Run %pathToDiscord%
    } catch e {
        MsgBox, An exception was thrown!`nSpecifically: %e%
        Exit
    }
}

;Skip to next title
^!n::
    OpenDiscord()
    Sleep 500

    ;Skip tracks for given number
    InputBox , numberOfSkips , Wie oft soll geskipt werden?, Anzahl:, notHide, 175, 125, X, Y, Locale, Timeout, 1

    Loop %numberOfSkips% {
        SendInput , @hydra next {Enter}
        Sleep 100
    }
return

;Pause current title
^!p::
    OpenDiscord()
    Sleep 500
    SendInput , @hydra pause {Enter}
return

;Resume current title
^!r::
    OpenDiscord()
    Sleep 500
    SendInput , @hydra resume {Enter}
return

;Input link to play with bot
^!l::
    InputBox , link , Link fuer Song, Link:, notHide, 50, 125, X, Y, Locale, Timeout

    ;Catch if no link is given
    If (link != "") {
        OpenDiscord()
        Sleep 500
        SendInput , @hydra play %link% {Enter}
    } else {
        MsgBox, Kein Link eingegeben!
        Exit
    }
return
