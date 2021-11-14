; # Win (Windows logo key)
; ! Alt
; ^ Ctrl
; + Shift
; & An ampersand may be used between any two keys or mouse buttons to combine them into a custom hotkey.
^+!0:: ; Send "My First Script" when Ctrl+Shift+Alt+w
Send, My First Script
return
^+!1:: ; Message box example when Ctrl+Shift+Alt+1
MsgBox, Hello World
return
Numpad0 & Numpad1::
MsgBox, You pressed Numpad1 while holding down Numpad0.
return
:*:ftw::Free the whales ; Replace ftw immediately with Free the whales