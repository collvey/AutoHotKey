import datetime
import os
import smtplib

from tkinter import Tk

from pathlib import Path
from os.path import basename
from email.mime.application import MIMEApplication
from email.mime.base import MIMEBase
from email.mime.multipart import MIMEMultipart
from email.mime.text import MIMEText
from email.utils import COMMASPACE, formatdate
from email import encoders

def send_email(user, pwd, recipient, subject, body, dir=None):
    FROM = user
    TO = recipient
    SUBJECT = subject
    TEXT = body

    # Prepare actual message
    # message = """From: %s\nTo: %s\nSubject: %s\n\n%s
    # """ % (FROM, ", ".join(TO), SUBJECT, TEXT)
    msg = MIMEMultipart()
    msg['From'] = FROM
    msg['To'] = recipient
    msg['Date'] = formatdate(localtime=True)
    msg['Subject'] = SUBJECT

    msg.attach(MIMEText(TEXT))

    for path in os.listdir(dir):
        part = MIMEBase('application', "octet-stream")
        with open(os.path.join(dir, path), 'rb') as file:
            part.set_payload(file.read())
        encoders.encode_base64(part)
        part.add_header('Content-Disposition',
                        'attachment; filename={}'.format(Path(path).name))
        msg.attach(part)

    try:
        server = smtplib.SMTP("smtp.gmail.com", 587)
        server.ehlo()
        server.starttls()
        server.login(user, pwd)
        server.sendmail(FROM, TO, msg.as_string())
        server.close()
        print('successfully sent the mail')
    except Exception as e:
        raise(e)
        print("failed to send mail")

if __name__ == "__main__":
    body = Tk().clipboard_get()
    now = datetime.datetime.now()
    cur = now.strftime("%Y-%m-%d %H:%M:%S")
    send_email("jd.book.006@gmail.com", 
        'CBh}D"8n', 
        'collvey.veritas@gmail.com', 
        'Copied Text at ' + cur, 
        body,
        r"C:\Users\collv\Pictures\Screenshots")