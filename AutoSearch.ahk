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

!m:: ; Copy and Search meaning on Google
clipboard =
Send, ^c
ClipWait, 2
Run https://www.google.com/search?q=%clipboard%+meaning
return

!c:: ; Copy and Search on Google for French verb conjugation
clipboard =
Send, ^c
ClipWait, 2
Run https://www.google.com/search?q=%clipboard%+conjugaison
return

!t:: ; Copy and Search on Google Translate
clipboard =
Send, ^c
ClipWait, 2
Run https://translate.google.com/?sl=auto&tl=en&text=%clipboard%&op=translate
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

!f:: ; Copy and Search on French dictionary
clipboard =
Send, ^c
ClipWait, 2
Run https://dictionary.cambridge.org/es-LA/dictionary/french-english/%clipboard%
return

!r:: ; Copy and Search on frdic.com
clipboard =
Send, ^c
ClipWait, 2
Run https://www.frdic.com/dicts/fr/%clipboard%
return

; !r:: ; Copy and pop up in Tooltip
; clipboard :=
; Send, ^c
; ClipWait, 2
; quote := chr(34) clipboard chr(34)
; ; MsgBox, %quote%
; cmd := "python .\ShowTooltipExample.py " quote
; RunCmd(cmd)
; return

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

; !d:: ; Take Screenshot
; clipboard :=
; Send, ^c
; ClipWait, 2
; Send, #{PrintScreen}
; Sleep, 1000
; cmd := "python .\SendEmail.py " clipboard
; RunCmd(cmd)
; Sleep, 5000
; cmd := "python .\ProcessScreen.py"
; RunCmd(cmd)
; return

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

; Install yt-dlp with "pip install yt-dlp"
; (Optional) Install ffmpeg from https://ffmpeg.org/download.html#build-windows
; Set Windows environment PATH variable to yt-dlp and ffmpeg binaries
!d:: ; Download video
clipboard =
Send, ^c
ClipWait, 2
cmd = yt-dlp %clipboard% -P C:\Users\collv\Documents\DownloadedVideos\
RunCmd(cmd)
return

^+e:: ; Convert Spanish text to speech
clipboard =
Send, ^c
ClipWait, 2
tts_cmd = tts --text "%clipboard%" --model_name "tts_models/es/mai/tacotron2-DDC" --out_path C:\Users\collv\Documents\DownloadedVideos\%A_Now%.wav

#NoEnv
#Warn
#SingleInstance, Force
SetWorkingDir %A_ScriptDir%
SetBatchLines -1
Menu, Tray, Icon, %A_Comspec%
Process, Priority,,High

Gui, Destroy
Gui, Margin, 15, 15
Gui, Font, s9, Consolas
Gui, Add, Text,, Output
Gui, Add, Edit, y+3 -Wrap +HScroll R20 HwndhEdit1, % Format("{:81}", "")
ControlGetPos,,,W,,,ahk_id %hEdit1%
Gui, Add, Text,, Command Line
Gui, Add, Edit, y+3 -WantReturn -Wrap HwndhEdit2 w%W%, %tts_cmd%
Gui, Add, Button, x+0 w0 h0 Default gRunCMD, <F2> RunCMD
GuiControl,, Edit1
Gui, Show,, RunCMD() - Realtime per line streaming demo 

SB_SetText("", 3)
GuiControlGet, Cmd,, %hEdit2%
GuiControl, Disable, Button1
ExitCode := RunCMD(A_Comspec . " /c " . Cmd)
SB_SetText("`tExitCode : " ErrorLevel, 3)
GuiControl, Enable, Button1
Edit_Append(hEdit2,"")
GuiControl, Focus,Edit2
Return

#q:: ; Usages in https://www.autohotkey.com/boards/viewtopic.php?t=74647
; The following function code fetches the IP address of autohotkey.com. 
; It ignores the first line, pre-process' the second line and immediately cancels RunCMD().
MsgBox % RunCmd("ping autohotkey.com -n 1",,,"pingHelper") ; 104.18.44.93

pingHelper(Line, LineNum) {
  If (LineNum=2)
    {
      A_Args.RunCMD.PID := 0 ; Cancel RunCMD()
      Return StrSplit(Line, ["[","]"]).2
    }  
}
return


#w:: ; Usages in https://www.autohotkey.com/boards/viewtopic.php?t=74647
; A wrapper function that uses RunCMD() for retrieving External IP address. 
; This function skips 5 lines and pre-process' only the last/6th line.
MsgBox % "My External IP`n" . ExternalIP()

ExternalIP(P*) {
If P.Count()=2
  Return P[2]=6 ? StrSplit(P[1], ["Address:  ","`r`n"]).2 : ""  
Return RunCmd("nslookup myip.opendns.com. resolver1.opendns.com",,,A_ThisFunc)
}
return

#a:: ; Usages in https://www.autohotkey.com/boards/viewtopic.php?t=74647
; GUI Example: Realtime per line streaming to edit control.
clipboard =
Send, ^c
ClipWait, 2    
dl_cmd = yt-dlp %clipboard% -P C:\Users\collv\Documents\DownloadedVideos\ --write-subs --write-auto-subs --sub-langs "cn*,es*,fr*,en" -k

#NoEnv
#Warn
#SingleInstance, Force
SetWorkingDir %A_ScriptDir%
SetBatchLines -1
Menu, Tray, Icon, %A_Comspec%
Process, Priority,,High

Gui, Destroy
Gui, Margin, 15, 15
Gui, Font, s9, Consolas
Gui, Add, Text,, Output
Gui, Add, Edit, y+3 -Wrap +HScroll R20 HwndhEdit1, % Format("{:81}", "")
ControlGetPos,,,W,,,ahk_id %hEdit1%
Gui, Add, Text,, Command Line
Gui, Add, Edit, y+3 -WantReturn HwndhEdit2 w%W%, %dl_cmd%
Gui, Add, Button, x+0 w0 h0 Default gRunCMD, <F2> RunCMD
GuiControl,, Edit1
Gui, Show,, RunCMD() - Realtime per line streaming demo 

SB_SetText("", 3)
GuiControlGet, Cmd,, %hEdit2%
GuiControl, Disable, Button1
ExitCode := RunCMD(A_Comspec . " /c " . Cmd)
SB_SetText("`tExitCode : " ErrorLevel, 3)
GuiControl, Enable, Button1
Edit_Append(hEdit2,"")
GuiControl, Focus,Edit2
Return

#IfWinActive RunCMD() ahk_class AutoHotkeyGUI
  Esc::
    GuiControl, Focus,Edit2
    Edit_Append(hEdit2,"")
    If (A_Args.RunCMD.PID)
      {
        A_Args.RunCMD.PID := 0
        Return
      }  
    SB_SetText("", 3)
    GuiControl,,Edit1
    GuiControl,,Edit2
  Return
#IfWinActive

RunCmd_Output(Line, LineNum) {
Global 
  If ( SubStr(Line,-1)!="`r`n" )
    Line .= "`r`n"
  Edit_Append(hEdit1, Line)
}


Edit_Append(hEdit, Txt) { ; Modified version by SKAN
Local        ; Original by TheGood on 09-Apr-2010 @ autohotkey.com/board/topic/52441-/?p=328342
  L := DllCall("SendMessage", "Ptr",hEdit, "UInt",0x0E, "Ptr",0 , "Ptr",0)   ; WM_GETTEXTLENGTH
       DllCall("SendMessage", "Ptr",hEdit, "UInt",0xB1, "Ptr",L , "Ptr",L)   ; EM_SETSEL
       DllCall("SendMessage", "Ptr",hEdit, "UInt",0xC2, "Ptr",0 , "Str",Txt) ; EM_REPLACESEL
}

#s:: ; Continuously updates and displays the name and position of the control currently under the mouse cursor.
; Example from https://www.autohotkey.com/docs/commands/ControlGetPos.htm#ExBasic
Loop
{
    Sleep, 100
    MouseGetPos, , , WhichWindow, WhichControl
    ControlGetPos, x, y, w, h, %WhichControl%, ahk_id %WhichWindow%
    ToolTip, %WhichControl%`nX%X%`tY%Y%`nW%W%`t%H%
}
Return