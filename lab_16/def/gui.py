from tkinter import *
import requests
import json

distribute_url = "http://localhost:3004/distribute"

def distribute():
    resp = requests.get(distribute_url)
    print(resp.text)
    json_resp = json.loads(resp.text)
    print(json_resp)
    list_box.delete(0, "end")
    pairs = json_resp["distribution"]
    for i in range(len(pairs)):
        pair = pairs[i]
        list_box.insert(i + 1, f"{pair[0]} -- {pair[1]}")


window = Tk()

window.geometry("300x250")

list_box = Listbox(window, fg="black", bg="white")
list_box.pack(padx=5)

create_button = Button(window, text="distribute", command=distribute, bd=2)
create_button.pack(padx=5)

window.mainloop()