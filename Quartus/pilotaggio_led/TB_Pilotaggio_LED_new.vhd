
LIBRARY ieee;
USE ieee.std_logic_1164.all;



ENTITY TB_LED IS 
END TB_LED;

architecture structural of TB_LED is
component Pilotaggio_LED2 IS 
	PORT
	(
		Enable_LEDS :  IN  STD_LOGIC;
		reset :  IN  STD_LOGIC;
		clock :  IN  STD_LOGIC;
		Buttons :  IN  STD_LOGIC_VECTOR(3 DOWNTO 0);
		SEL_LEDS_in :  IN  STD_LOGIC_VECTOR(1 DOWNTO 0);
		start_tx :  OUT  STD_LOGIC;
		enable_count_time :  OUT  STD_LOGIC;
		leds_out :  OUT  STD_LOGIC_VECTOR(3 DOWNTO 0)
	);
END  component;

signal enable_leds_t, reset_t, clock_t, start_tx_t, enable_count_time_t : std_logic;
signal buttons_t, leds_out_t : std_logic_vector (3 downto 0);
signal sel_leds_in_t : std_logic_vector(1 downto 0);

begin

U1: Pilotaggio_LED2 port map(
enable_leds=>Enable_LEDS_t, 
reset=>		reset_t ,
clock=>		clock_t  , 
buttons=>		Buttons_t ,  
sel_leds_in=>		SEL_LEDS_in_t   ,
start_tx=>		start_tx_t ,
enable_count_time=>		enable_count_time_t, 
leds_out=>		leds_out_t 

);

process
begin
clock_t<='1';
wait for 1ns;
clock_t<='0';
wait for 1ns;
end process;

reset_t<='0';
buttons_t<="0000", "0001" after 100 ns, "0100" after 200 ns;
sel_leds_in_t <= "10";
enable_leds_t <='0', '1' after 50 ns,'0' after 62ns;



end structural;