
LIBRARY ieee;
USE ieee.std_logic_1164.all; 

ENTITY TB_Progetto_completo IS 
END TB_Progetto_completo;

architecture structural of TB_Progetto_completo is
component Rilevatore_Riflessi_Completo IS 
	PORT
	(
		CLOCK :  IN  STD_LOGIC;
		TX_RDY :  IN  STD_LOGIC;
		RESET :  IN  STD_LOGIC;
		DAV :  IN  STD_LOGIC;
		Buttons :  IN  STD_LOGIC_VECTOR(3 DOWNTO 0);
		Command :  IN  STD_LOGIC_VECTOR(7 DOWNTO 0);
		WR :  OUT  STD_LOGIC;
		RD :  OUT  STD_LOGIC;
		Data_to_TX :  OUT  STD_LOGIC_VECTOR(7 DOWNTO 0);
		LEDS_OUT :  OUT  STD_LOGIC_VECTOR(3 DOWNTO 0)
	);
END  component;

  signal    t_CLOCK :     STD_LOGIC;
	signal 	t_TX_RDY :    STD_LOGIC;
signal 		t_RESET :    STD_LOGIC;
signal 		t_DAV :       STD_LOGIC;
signal 		t_Buttons :   STD_LOGIC_VECTOR(3 DOWNTO 0);
signal 		t_Command :   STD_LOGIC_VECTOR(7 DOWNTO 0);
signal 		t_WR :        STD_LOGIC;
signal 		t_RD :        STD_LOGIC;
signal 		t_Data_to_TX :    STD_LOGIC_VECTOR(7 DOWNTO 0);
signal 		t_LEDS_OUT :   STD_LOGIC_VECTOR(3 DOWNTO 0);

begin

U1: Rilevatore_riflessi_completo port map(


   clock=>   t_CLOCK ,
	tx_RDY=>	t_TX_RDY ,
	reset=>	t_RESET ,
	dav=>	t_DAV ,
	buttons=>	t_Buttons ,
	command=>	t_Command,
	wr=>	t_WR ,
	rd=>	t_RD ,
	data_to_tx=>	t_Data_to_TX ,
	leds_out=>	t_LEDS_OUT 


);

process
begin
t_clock<='1';
wait for 10ns;
t_clock<='0';
wait for 10ns;
end process;

t_tx_rdy<='1';
t_reset<='0';
t_dav<='1';
t_command<="00000000", "01001100" after 200 ns, "00110100" after 300 ns, "01001100" after 400 ns ;
t_buttons<="0000", "0010" after 1000ns,"1000" after 294 ms;
end structural;