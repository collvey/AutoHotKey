SetTitleMatchMode 2 ; A window's title can contain WinTitle anywhere inside it to be a match.

; # Win (Windows logo key)
; ! Alt
; ^ Ctrl
; + Shift
; & An ampersand may be used between any two keys or mouse buttons to combine them into a custom hotkey.

; Send "My First Script" when Ctrl+Shift+Alt+w
^+!0::
Send, My First Script
return
; Message box example when Ctrl+Shift+Alt+1
^+!1:: 
MsgBox, Hello World
return
; Press Numpad1 while holding Numpad0
Numpad0 & Numpad1::
MsgBox, You pressed Numpad1 while holding down Numpad0.
return

; Non-VS Code hotkeys and hotstrings
; #IfWinActive
; #IfWinExist
#IfWinNotActive Visual Studio Code
q & e::
MsgBox, You pressed q+e not in VS Code.
return
:*:ftw::Free the whales ;