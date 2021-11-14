SetTitleMatchMode 2 ; A window's title can contain WinTitle anywhere inside it to be a match.

; # Win (Windows logo key)
; ! Alt
; ^ Ctrl
; + Shift
; & An ampersand may be used between any two keys or mouse buttons to combine them into a custom hotkey.

; Message box example when Ctrl+Shift+Alt+1
^+!1:: 
MsgBox, Hello World
return

; Non-VS Code hotkeys and hotstrings
; #IfWinActive
; #IfWinExist
#IfWinNotActive Visual Studio Code
q & e::
MsgBox, You pressed q+e not in VS Code.
return
:*:ftw::Free the whales ;
#IfWinActive

; Sending KeyStrokes
; !a sends Alt + A
; ^a sends Ctrl + A
; +abC sends "AbC"
; !+a sends Alt + Shift + A
; ^!a sends Ctrl + Alt + A
; ^{Home} sends Ctrl + Home
; #e sends Win + e
; Special keys in https://www.autohotkey.com/docs/commands/Send.htm

; Repeating or Holding Down a Key
; Send {DEL 4}  ; Presses the Delete key 4 times.
; Send {S 30}   ; Sends 30 uppercase S characters.
; Send +{TAB 4}  ; Presses Shift-Tab 4 times.

#`:: ; Press Win + ` to send ` 5 times
Loop 5
{
    Send ``
}
return

:*:*t1:: ; *t1
MsgBox,
(
Line 1
Line 2
Line 3
Line 4
Line 5
)
return

; Running Programs & Websites
:*:*t2:: ; *t2
Run, https://www.google.com
return

; Open "My Documents" folder
:*:*t3:: ; *t3
Run, %A_MyDocuments%
return