import datetime
import json
import requests
import sys
import time

from bs4 import BeautifulSoup
from tkinter import Tk

def requestTranslationFromWord(word):
    url = f"https://examples1.spanishdict.com/explore?lang=es&q={word}&numExplorationSentences=100"
    response = requests.get(url, allow_redirects=True)
    soup = BeautifulSoup(response.content, 'html.parser')
    site_json = json.loads(soup.text)
    return '/'.join([entry['translation'] for entry in site_json['data']['translations']])

def appendTranslationToFile(text, filepath):
    curr_datetime = str(datetime.datetime.now())
    translations = requestTranslationFromWord(text)
    with open(filepath, "a") as f:
        f.write(f"{text}, {translations}, {curr_datetime}\n")

def appendFile(text, filepath):
    curr_datetime = str(datetime.datetime.now())
    with open(filepath, "a") as f:
        f.write(f"{text}, {curr_datetime}\n")

if __name__ == "__main__":
    if len(sys.argv) > 2:
        exit("Too many arguments")

    curr_datetime = str(datetime.datetime.now())
    dt_string = datetime.datetime.now().strftime("%Y_%m_%d")
    TEMP_FILEPATH = rf"C:\Users\collv\Documents\AutoHotKey\History\spanish_dictionary_history_{dt_string}.txt"
    utils = {}
    utils["appendTranslationToFile"] = appendTranslationToFile
    utils["appendFile"] = appendFile
    clipboard = Tk().clipboard_get()
    utilname = sys.argv[1]

    utils[utilname](clipboard, TEMP_FILEPATH)
