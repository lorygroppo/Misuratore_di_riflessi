'''
    TestBench Misuratore di Riflessi
'''

import subprocess
import os
from tkinter import *
from tkinter import ttk


def find_vhd():
    trovati=[]
    for root, dirs, files in os.walk("..\Quartus"):
        for file in files:
            if file.endswith(".vhd"):
                 trovati.append((os.path.join(root, file)).replace('\\',"/"))
    return trovati

def print_path(lista):
    for i in lista:
        print("vcom",i)

#print_path(find_vhd())

def load_vhd():
    try:
        subprocess.run(("vsim -c -do load_vhd_files.do").split())   
    except:
        exit("ERRORE nel caricamento dei files .vhd")
    else:
        return 
def run_simulation():
    try:
        subprocess.run(("vsim -c -do run_tb.do").split())  
    except:
        exit("ERRORE nella simulazione")
    else:
        return
load_vhd()
run_simulation()