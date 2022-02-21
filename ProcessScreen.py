import os

if __name__ == "__main__":
    screen_dir = r"C:\Users\collv\Pictures\Screenshots"
    for f in os.listdir(screen_dir):
        os.remove(os.path.join(screen_dir, f))