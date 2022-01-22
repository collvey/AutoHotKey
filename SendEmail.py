import datetime
from tkinter import Tk

def send_email(user, pwd, recipient, subject, body):
    import smtplib

    FROM = user
    TO = recipient if isinstance(recipient, list) else [recipient]
    SUBJECT = subject
    TEXT = body

    # Prepare actual message
    message = """From: %s\nTo: %s\nSubject: %s\n\n%s
    """ % (FROM, ", ".join(TO), SUBJECT, TEXT)
    try:
        server = smtplib.SMTP("smtp.gmail.com", 587)
        server.ehlo()
        server.starttls()
        server.login(user, pwd)
        server.sendmail(FROM, TO, message)
        server.close()
        print('successfully sent the mail')
    except Exception as e:
        raise(e)
        print("failed to send mail")

if __name__ == "__main__":
    body = Tk().clipboard_get()
    now = datetime.datetime.now()
    cur = now.strftime("%Y-%m-%d %H:%M:%S")
    send_email("jd.book.006@gmail.com", 'CBh}D"8n', 'collvey.veritas@gmail.com', 'Copied Text at ' + cur, body)