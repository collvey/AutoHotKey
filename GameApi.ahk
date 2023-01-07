#NoEnv
#UseHook
SetBatchLines -1
active:=1

^!Z::active:=active ? 0 : 1
^!F::GetColor()
^!A::Reload
^!X::ExitApp

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; Movement
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

w::
a::
s::
d::
if(active)
    Drag("w","a","s","d")
else
    Send % A_ThisHotkey
return

z::
if(active) {
    ; Move(0, 0)
    ; Move(1, 0)
    ; Move(2, 0)
    ; Move(3, 0)
    ; Move(4, 0)
    ; Move(5, 0)
    ; Move(6, 0)
    ; Move(7, 0)
    ; Move(8, 0)
    ; Move(9, 0)
    ; Move(10, 0)
    ; Move(11, 0)
    Move(0, 0)
    Move(0, 1)
    Move(0, 2)
    Move(0, 3)
    Move(0, 4)
    Move(0, 5)
    Move(0, 6)
    Move(0, 7)
    Move(0, 8)
    Move(0, 9)
    Move(0, 10)
}
else
    Send % A_ThisHotkey
return

;;;;;;;;;;;;;;
;;; Others
;;;;;;;;;;;;;;

Drag(Up,Left,Down,Right){
    static D:=65, X:=0, Y:=0, Xc:=370, Yc:=675
    BlockInput, MouseMove
        MouseMove, Xc , Yc
        Send, {LButton Down}
        Loop {
            MouseMove, X := GetKeyState(Left,"P") ? Xc-D : GetKeyState(Right,"P") ? Xc+D : Xc
                    ,  Y := GetKeyState(Up,  "P") ? Yc-D : GetKeyState(Down, "P") ? Yc+D : Yc
            Sleep 16
        } until (X=Xc && Y=Yc) 
        Send, {LButton up}
    BlockInput, MouseMoveOff
}

GetColor(){
    MouseGetPos, MouseX, MouseY
    PixelGetColor, color_get, MouseX, MouseY
    FileAppend, "The color at "%MouseX%" "%MouseY%" cursor position is "%color_get%`n, C:\Users\collv\Documents\Temp\color.txt
}

Move(Xi,Yi){
    static XTileWidth:=87.08, YTileWidth:=87.09, X0:=454.54, Y0=113.54
    BlockInput, MouseMove
        MouseMove, X0+XTileWidth*Xi , Y0+YTileWidth*Yi
        Send, {LButton Down}
        Send, {LButton up}
        Sleep 16
    BlockInput, MouseMoveOff
}