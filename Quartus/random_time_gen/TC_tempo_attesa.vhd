library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity TC_tempo_attesa is
port(
numero_contato: in std_logic_vector (29 downto 0);
Fine_Conteggio: out std_logic
);
end TC_tempo_attesa ;

architecture behavioural of TC_tempo_attesa  is 
begin
process(numero_contato)
begin
	-- 20 sec
	--if numero_contato < "011101110011010110010011111111" then
	-- 500 us
	if numero_contato < "000000000000000011000011010100" then
	fine_Conteggio<='0' ;
	else
	fine_Conteggio<='1';
	end if;
end process;
end behavioural;
