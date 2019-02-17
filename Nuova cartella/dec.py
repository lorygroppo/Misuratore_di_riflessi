def output_decode():
    char_rx=[];
    line_read=0;
    for line in open("t_outout.txt","r"):
        char_rx.append(chr(int(line,2)))
    str_rx="".join(char_rx)
    return str_rx