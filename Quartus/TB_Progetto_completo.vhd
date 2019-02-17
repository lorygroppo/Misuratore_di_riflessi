
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
		Out_inizio_attesa :  OUT  STD_LOGIC;
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
signal		t_wait : std_logic;

file file_command : text;

begin

U1: UartProgetto_comp port map(
    ck		=>	t_CLOCK ,
	tx_out	=>	t_TX ,
	reset	=>	t_RESET ,
	buttons_in => t_Buttons ,
	RX_in	=>	t_RX,
	-----------------------------
	Out_inizio_attesa => t_wait,
	leds_output =>	t_LEDS_OUT 
);

--wait report
process
begin
	wait until t_wait = '1';
	report "Inizio attesa";
end process;

--clock generation
process
begin
t_clock<='1';
wait for 10ns;
t_clock<='0';
wait for 10ns;
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

--leds report
process (t_LEDS_OUT)
	variable dec : integer;
begin
	if t_LEDS_OUT'event then
		dec := to_integer(unsigned(t_LEDS_OUT));
		report "LED: " & integer'image(dec);
	end if;
end process;

--report time
process
begin
	wait for 100us;
	report "Tempo: " & time'image(now);
end process;
	
end structural;