from ahk import AHK

if __name__ == "__main__":
    ahk = AHK()
    data_communication = """#Persistent
data := "Hello Data!"
FileAppend, %data%, * ; send data var to stdout
ExitApp"""
    result = ahk.run_script(data_communication, decode=False)
    print(result.stdout)