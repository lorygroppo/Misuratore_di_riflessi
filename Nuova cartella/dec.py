def output_decode():
    char_rx=[]
    bit_rx=[]
    line_read=0
    file_out=open("t_out.txt","r")
    for byte_iterator in range(5):
        for bit_iterator in range(10):
            bit_read=file_out.readline()[0] #elimina '\n'
            bit_rx.append(bit_read)
        byte_read="".join(bit_rx[1:9]) # LSB...MSB
        byte_reverse=byte_read[::-1]  # MSB...LSB
        char_rx.append(chr(int(byte_reverse,2))) #decodifico ascii
        bit_rx=[] #clear della lista
    file_out.close()
    char_rx="".join(char_rx)
    return char_rx
print(output_decode())