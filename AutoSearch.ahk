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
return

!s:: ; Copy and Search on Spanish Dictionary
clipboard =
Send, ^c
ClipWait, 2
Run https://www.spanishdict.com/translate/%clipboard%
return

!r:: ; Copy and pop up in Tooltip
clipboard :=
Send, ^c
ClipWait, 2
quote_clip := "" clipboard ""
MsgBox, %quote_clip%
cmd := "python .\ShowTooltipExample.py " quote_clip
RunCmd(cmd)
return

!e:: ; Copy and send in email
clipboard :=
Send, ^c
ClipWait, 2
cmd := "python .\SendEmail.py " clipboard
RunCmd(cmd)
return