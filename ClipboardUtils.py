import datetime
import sys
from tkinter import Tk


def appendFile(text, filepath):
    curr_datetime = str(datetime.datetime.now())
    with open(filepath, "a") as f:
        f.write(f"{text},{curr_datetime}\n")

if __name__ == "__main__":
    if len(sys.argv) > 2:
        exit("Too many arguments")

    TEMP_FILEPATH = r"C:\Users\collv\Documents\AutoHotKey\History\spanish_dictionary_history.txt"
    utils = {}
    utils["appendFile"] = appendFile
    clipboard = Tk().clipboard_get()
    utilname = sys.argv[1]

    utils[utilname](clipboard, TEMP_FILEPATH)
