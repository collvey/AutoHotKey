from ahk import AHK
from ahk.window import Window

import sys

if __name__ == "__main__":
  ahk = AHK()
  win = Window.from_mouse_position(ahk)
  win_pos = win.get_pos()
  ahk.show_tooltip(sys.argv[1], second=1, x=win_pos[2]/2, y=win_pos[3]/2)   