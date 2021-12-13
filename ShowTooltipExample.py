from ahk import AHK
from ahk.window import Window

if __name__ == "__main__":
  ahk = AHK()
  win = Window.from_mouse_position(ahk)
  win_pos = win.get_pos()
  ahk.show_tooltip(str(win_pos), second=5, x=win_pos[2]/2, y=win_pos[3]/2)   