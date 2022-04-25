from io import BytesIO
import win32clipboard
from PIL import Image
import argparse
import glob


def send_to_clipboard(clip_type, data):
    win32clipboard.OpenClipboard()
    win32clipboard.EmptyClipboard()
    win32clipboard.SetClipboardData(clip_type, data)
    win32clipboard.CloseClipboard()

def load_image_file_to_clipboard(filepath):
    image = Image.open(filepath)

    with BytesIO() as output:
        image.convert("RGB").save(output, "BMP")
        data = output.getvalue()[14:]

    send_to_clipboard(win32clipboard.CF_DIB, data)

    
if __name__ == "__main__":
    parser = argparse.ArgumentParser()
    parser.add_argument("--picture", help = "The number of picture to copy.", default = '1')
    args = parser.parse_args()
    picture = args.picture
    
    file_match = r"C:\Users\collv\Pictures\PictureCache\Picture%s.*" % (picture)
    filepath = glob.glob(file_match).pop()
    load_image_file_to_clipboard(filepath)