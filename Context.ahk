; SetTitleMatchMode
;
; Sets the matching behavior of the WinTitle parameter in commands such as WinWait.
; SetTitleMatchMode, MatchMode
; SetTitleMatchMode, Speed
;
; MatchMode
; Specify one of the following digits or the word RegEx:
; 1 = A window's title must start with the specified WinTitle to be a match.
; 2 = A window's title can contain WinTitle anywhere inside it to be a match.
; 3 = A window's title must exactly match WinTitle to be a match
; RegEx = Changes WinTitle, WinText, ExcludeTitle, and ExcludeText to accept regular expressions.

SetTitleMatchMode 2 ; A window's title can contain WinTitle anywhere inside it to be a match.

; Context-sensitive hotkeys and hotstrings
#IfWinNotActive Visual Studio Code
#Space::
MsgBox, You pressed WIN+SPACE not in VS Code.
return
#1::
MsgBox, You pressed WIN+1 not in VS Code.
return