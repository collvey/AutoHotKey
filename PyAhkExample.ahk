#Include RunCmd.ahk

!e:: ; Copy and pop up in MsgBox
clipboard :=
Send, ^c
ClipWait, 2
cmd := "python .\ShowTooltipExample.py " clipboard
; MsgBox, %cmd%
RunCmd(cmd)
return