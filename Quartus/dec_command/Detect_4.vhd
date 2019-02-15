library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity Detect_4 is
port(
		data_in: in std_logic_vector (7 downto 0);
		out_4: out std_logic);
end Detect_4 ;

architecture behavioural of Detect_4 is 
begin
	out_4 <= not(data_in(7)) and not(data_in(6)) and data_in(5) and data_in(4) and not(data_in(3)) and data_in(2) and not(data_in(1)) and not(data_in(0));
end behavioural;