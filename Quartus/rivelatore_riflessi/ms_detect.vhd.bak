library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity ms_detect is
port(
		data_in: in std_logic_vector (14 downto 0);
		ms_out: out std_logic);
end ms_detect ;

architecture behavioural of ms_detect is 
begin
	ms_out <= data_in(14) and data_in(13) and not(data_in(12)) and not(data_in(11)) and not(data_in(10)) and not(data_in(9)) and data_in(8) and data_in(7) and not(data_in(6)) and data_in(5) and not(data_in(4)) and not(data_in(3)) and data_in(2) and data_in(1) and data_in(0);
end behavioural;
