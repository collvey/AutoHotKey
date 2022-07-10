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

::\t1:: ; Take Screenshot for Picture 1
Loop, read, C:\Users\collv\Pictures\PictureCache\Test1.txt
{
    MsgBox, "Test1" %A_LoopReadLine%
}
Return

::\p1:: ; Take Screenshot for Picture 1
Send, #{PrintScreen}
Sleep, 1000
Folder = C:\Users\collv\Pictures\Screenshots ; change this to the actual folder
Loop, Files, %Folder%\*
{
     FileGetTime, Time, %A_LoopFileFullPath%,
     If (Time > Time_Orig)
     {
          Time_Orig := Time
          File := A_LoopFileName
     }
}
FileCopy, C:\Users\collv\Pictures\Screenshots\%File%, C:\Users\collv\Pictures\PictureCache\Picture1.png, 1
; MsgBox, %cmd%
return

::\p2:: ; Take Screenshot for Picture 2
Send, #{PrintScreen}
Sleep, 1000
Folder = C:\Users\collv\Pictures\Screenshots ; change this to the actual folder
Loop, Files, %Folder%\*
{
     FileGetTime, Time, %A_LoopFileFullPath%,
     If (Time > Time_Orig)
     {
          Time_Orig := Time
          File := A_LoopFileName
     }
}
FileCopy, C:\Users\collv\Pictures\Screenshots\%File%, C:\Users\collv\Pictures\PictureCache\Picture2.png, 1
; MsgBox, %cmd%
return

::\p3:: ; Take Screenshot for Picture 3
Send, #{PrintScreen}
Sleep, 1000
Folder = C:\Users\collv\Pictures\Screenshots ; change this to the actual folder
Loop, Files, %Folder%\*
{
     FileGetTime, Time, %A_LoopFileFullPath%,
     If (Time > Time_Orig)
     {
          Time_Orig := Time
          File := A_LoopFileName
     }
}
FileCopy, C:\Users\collv\Pictures\Screenshots\%File%, C:\Users\collv\Pictures\PictureCache\Picture3.png, 1
; MsgBox, %cmd%
return


::/p1:: ; Load Picture 1 into clipboard
cmd := "python .\Imageutils.py --picture 1"
RunCmd(cmd)
Sleep, 200
Send, ^v
return

::/p2:: ; Load Picture 2 into clipboard
cmd := "python .\Imageutils.py --picture 2"
RunCmd(cmd)
Sleep, 200
Send, ^v
return

::/p3:: ; Load Picture 3 into clipboard
cmd := "python .\Imageutils.py --picture 3"
RunCmd(cmd)
Sleep, 200
Send, ^v
return