
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE STD.textio.all;
USE ieee.std_logic_textio.all;
USE IEEE.numeric_std.all;

ENTITY TB_Progetto_completo IS 
END TB_Progetto_completo;


architecture structural of TB_Progetto_completo is
component UartProgetto_comp IS 
	PORT
	(
		Reset :  IN  STD_LOGIC;
		CK :  IN  STD_LOGIC;
		RX_in :  IN  STD_LOGIC;
		buttons_in :  IN  STD_LOGIC_VECTOR(3 DOWNTO 0);
		tx_out :  OUT  STD_LOGIC;
		--------------------------------
		--Out_inizio_attesa :  OUT  STD_LOGIC;
		--led_deb :  OUT  STD_LOGIC_VECTOR(1 DOWNTO 0);
		LEDS_output :  OUT  STD_LOGIC_VECTOR(3 DOWNTO 0)
	);
END component;

signal    	t_CLOCK :   STD_LOGIC;
signal		t_RX :		STD_LOGIC;
signal	 	t_TX :	    STD_LOGIC;
signal 		t_RESET :    STD_LOGIC;
signal 		t_Buttons :   STD_LOGIC_VECTOR(3 DOWNTO 0);
signal 		t_LEDS_OUT :   STD_LOGIC_VECTOR(3 DOWNTO 0);
-----------------------------------
--signal		t_wait : std_logic;

file file_command : text;
file file_tx : text;

begin

U1: UartProgetto_comp port map(
    ck		=>	t_CLOCK ,
	tx_out	=>	t_TX ,
	reset	=>	t_RESET ,
	buttons_in => t_Buttons ,
	RX_in	=>	t_RX,
	-----------------------------
	--Out_inizio_attesa => t_wait,
	leds_output =>	t_LEDS_OUT 
);

--clock generation 25 MHz
process
begin
t_clock<='1';
wait for 20ns;
t_clock<='0';
wait for 20ns;
end process;

--reset
t_reset <= '0', '1' after 1us;

--lettura comando da file
process
	variable v_BIT_LINE : line;
	variable v_BIT		: std_logic;
begin
	t_RX <= '1';
    wait for 5us;
	file_open(file_command, "command_in.txt", read_mode);
	while not endfile(file_command) loop
		--leggo bit in ricezione
		readline(file_command, v_BIT_LINE);
		read(v_BIT_LINE, v_BIT);
		report "Lettura" & std_logic'image(v_BIT);
		t_RX <= v_BIT;
		wait for 8.6806 us; --baud rate 115200
    end loop;
	file_close(file_command);    
	wait;
end process;

--button press
process
begin
	t_Buttons <= "1111";
	wait until t_LEDS_OUT/="0000";
	wait for 42 us; --attesa pressione pulsanti
	t_Buttons <= not t_LEDS_OUT;
	wait for 60 us;
	t_Buttons <= "1111";
	wait;
end process;

--report time
process
begin
	wait for 100us;
	--report "Tempo: " & time'image(now);
end process;

----Scrivo TX su di un file
file_open(file_tx,"t_out.txt",write_mode);
process
	variable v_TX	: line;
begin
	for j in 0 to 5 loop -- campiono 5 bytes
		wait until t_TX = '0'; --aspetta start bit
		wait for 4.3403 us; --campiono a metà bit
		for i in 0 to 9 loop --campiono 10 bit
			write(v_TX, t_TX, right, 1);
		    writeline(file_tx, v_TX);
		    report "Scrittura " & integer'image(j) & "." & integer'image(i);
		    if i<9 then
		    	wait for 8.6806 us; --baud rate 115200
		    end if;
		end loop;
	end loop;
	wait;
end process;
file_close(file_tx);
	
end structural;