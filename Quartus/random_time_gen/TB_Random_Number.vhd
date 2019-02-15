library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity TB_Random_Number is

end TB_Random_Number;

architecture structural of TB_Random_Number is 

component Random_Time_Generator IS 
	PORT
	(
		CK_50MHz :  IN  STD_LOGIC;
		Inizio_Attesa :  IN  STD_LOGIC;
		Termine_Attesa :  OUT  STD_LOGIC;
		Conteggio_finale :  OUT  STD_LOGIC_VECTOR(28 DOWNTO 0);
		Random_Number :  OUT  STD_LOGIC_VECTOR(7 DOWNTO 0)
	);
END component;

signal ck_t: std_logic;
signal number: std_logic_vector (7 downto 0);
signal inizio_attesa_t: std_logic;
signal termine_attesa_t: std_logic;
signal Conteggio_t: std_logic_vector (28 downto 0);

begin
U1: Random_Time_Generator port map(
ck_50MHz=> ck_t,
Random_Number=>number,
conteggio_finale => conteggio_t,
termine_attesa=> termine_attesa_t,
inizio_attesa=> inizio_attesa_t
);

process
begin
ck_t<='0';
wait for 2 ps;
ck_t<='1';
wait for 2 ps;
end process;

inizio_attesa_t<='0', '1' after 10ns, '0' after 11 ns;

end structural;