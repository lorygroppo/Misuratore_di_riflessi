'''
    TestBench Misuratore di Riflessi
'''

import subprocess
import os

def print_log(stringa):
    separatore=[]
    for i in range(len(stringa)+8): separatore.append("#")
    print('\n')
    print("".join(separatore))
    print("###", stringa, "###")
    print("".join(separatore))
    print('\n')
    #exit()
    return

def load_vhd():
    print_log("CARICAMENTO FILE .VHD")
    try:
        subprocess.run(("vsim -c -do load_vhd_files.do").split())   
    except:
        exit("ERRORE nel caricamento dei files .vhd")
    else:
        print_log("*** CARICAMENTO FILE .VHD COMPLETATO ***")
        return 
def run_simulation():
    print_log("AVVIO DELLA SIMULAZIONE")
    try:
        subprocess.run(("vsim -c -do run_tb.do").split())  
    except:
        exit("ERRORE nella simulazione")
    else:
        print_log("SIMULAZIONE TERMINATA")
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
    log_msg="INVIO COMANDO: "+msg
    print_log(log_msg)
    return
    
def output_decode():
    print_log("DECODIFICA OUTPUT")
    char_rx=[]
    bit_rx=[]
    line_read=0
    file_out=open("t_out.txt","r")
    for byte_iterator in range(5):
        for bit_iterator in range(10):
            try:
                bit_read=file_out.readline()[0] #elimina '\n'
            except:
                exit(" --- NESSUN OUTPUT GENERATO --- ")
            else:
                bit_rx.append(bit_read)
        byte_read="".join(bit_rx[1:9]) # LSB...MSB
        byte_reverse=byte_read[::-1]  # MSB...LSB
        char_rx.append(chr(int(byte_reverse,2))) #decodifico ascii
        bit_rx=[] #clear della lista
    file_out.close()
    char_rx="".join(char_rx)
    log_msg="RICEVUTO: "+char_rx
    print_log(log_msg)
    return char_rx

#os.remove("t_out.txt")
comando=input("\n Comando da inviare: ")
write_command(comando)    
load_vhd()
run_simulation()
stringa_ricevuta=output_decode()
print("Tempo di reazione imposto al testbench: 42 us")
print("Tempo di reazione ricevuto: ",int(stringa_ricevuta[1:5],16),"us")
#proc=subprocess.run(('vsim -do waveform.do').split())
exit()