library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity Detect_2 is
port(
		data_in: in std_logic_vector (7 downto 0);
		out_2: out std_logic);
end Detect_2 ;

architecture behavioural of Detect_2 is 
begin
	out_2 <= not(data_in(7)) and not(data_in(6)) and data_in(5) and data_in(4) and not(data_in(3)) and not(data_in(2)) and data_in(1) and not(data_in(0));
end behavioural;