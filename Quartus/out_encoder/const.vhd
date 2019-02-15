library ieee;
use ieee.std_logic_1164.all ;

entity const is
port ( ones:out std_logic_vector(4 downto 0));
end const;

architecture gate of const is

begin
ones<="11111";
end gate;