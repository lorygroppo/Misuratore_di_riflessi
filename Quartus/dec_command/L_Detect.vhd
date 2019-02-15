library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity L_Detect is
port(
		data_in: in std_logic_vector (7 downto 0);
		L_out: out std_logic);
end L_Detect ;

architecture behavioural of L_Detect is 
begin
	L_out <= not(data_in(7)) and data_in(6) and not(data_in(5)) and not(data_in(4)) and data_in(3) and data_in(2) and not(data_in(1)) and not(data_in(0));
end behavioural;
