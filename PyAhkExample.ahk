#Include RunCmd.ahk

!e:: ; Copy and pop up in MsgBox
clipboard =
Send, ^c
ClipWait, 2
MsgBox, %clipboard%
RunCmd("python .\ShowTooltipExample.py")
return