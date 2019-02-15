library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity XOR_LFSR is
port(
Numero_LSFR: in std_logic_vector (7 downto 0);
Shift_in_LSFR: out std_logic
);
end XOR_LFSR;

architecture behavioural of XOR_LFSR is 
begin

shift_in_LSFR <= (Numero_LSFR(0)xnor Numero_LSFR(1)) xnor (Numero_LSFR(2) xnor Numero_LSFR(3));

end behavioural;