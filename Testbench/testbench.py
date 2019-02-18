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
    
def write_command(msg):
    f_din=open("command_in.txt","w")
    for i in range(len(msg)):
        carattere="{0:08b}".format(ord(msg[i]))
        carattere=carattere[::-1] #inverto i bit del carattere
        f_din.write("0\n") #start bit
        for bit in carattere:
            f_din.write(bit)
            f_din.write('\n')
        f_din.write("1") #stop bit
        if i<len(msg)-1: f_din.write('\n')
    f_din.close()
    #return
    exit()
    
def output_decode():
    char_rx=[];
    for line in open("dout.txt","r"):
        char_rx.append(chr(int(line,2)))
    str_rx="".join(char_rx)
    return str_rx
    
write_command("L1")    
load_vhd()
run_simulation()
proc=subprocess.Popen(('vsim -do waveform.do').split())
exit()