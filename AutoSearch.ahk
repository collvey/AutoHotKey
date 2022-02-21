#Include RunCmd.ahk
; # Win (Windows logo key) 
; ! Alt 
; ^ Ctrl 
; + Shift 
; & An ampersand may be used between any two keys or mouse buttons to combine them into a custom hotkey. 


!g:: ; Copy and Search on Google
clipboard =
Send, ^c
ClipWait, 2
Run https://www.google.com/search?q=%clipboard%
return

!t:: ; Copy and Search on Google Translate
clipboard =
Send, ^c
ClipWait, 2
Run https://translate.google.com/?sl=es&tl=en&text=%clipboard%&op=translate
cmd := "python .\ClipboardUtils.py appendFile"
RunCmd(cmd)
return

!s:: ; Copy and Search on Spanish Dictionary
clipboard =
Send, ^c
ClipWait, 2
Run https://www.spanishdict.com/translate/%clipboard%
cmd := "python .\ClipboardUtils.py appendTranslationToFile"
RunCmd(cmd)
return

!r:: ; Copy and pop up in Tooltip
clipboard :=
Send, ^c
ClipWait, 2
quote := chr(34) clipboard chr(34)
; MsgBox, %quote%
cmd := "python .\ShowTooltipExample.py " quote
RunCmd(cmd)
return

!e:: ; Copy and send in email
clipboard :=
Send, ^c
ClipWait, 2
cmd := "python .\SendEmail.py " clipboard
RunCmd(cmd)
return

!u:: ; Copy and Search on Bing Translator
clipboard =
Send, ^c
ClipWait, 2
Run https://www.bing.com/translator?from=en&to=cn&text=%clipboard%
return

!d:: ; Take Screenshot
clipboard :=
Send, ^c
ClipWait, 2
Send, #{PrintScreen}
Sleep, 1000
cmd := "python .\SendEmail.py " clipboard
RunCmd(cmd)
Sleep, 5000
cmd := "python .\ProcessScreen.py"
RunCmd(cmd)
return