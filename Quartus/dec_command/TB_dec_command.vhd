library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity TB_dec_command is
--  Port ( );
end TB_dec_command;

architecture Structural of TB_dec_command is

component dec_command is
  Port (
			RESETn, CK, DAV, END_TX:  in std_logic;
			DOUT: in std_logic_vector (7 downto 0);
			RD,EN_COUNT_T_RND: out std_logic;
			SEL_LED: out std_logic_vector(1 downto 0));
end  component;

signal tb_resetn,tb_ck,tb_dav,tb_en_count_t_rnd,tb_end_tx,tb_rd: std_logic;
signal tb_sel_led: std_logic_vector(1 downto 0);
signal tb_dout: std_logic_vector(7 downto 0);

begin

U1: dec_command port map(
								RESETn => tb_resetn,
								CK => tb_ck,
								DAV => tb_dav,
								END_TX => tb_end_tx,
								DOUT => tb_dout,
								RD => tb_rd,
								EN_COUNT_T_RND => tb_en_count_t_rnd,
								SEL_LED => tb_sel_led);

process
begin
tb_ck<='0' ;
wait for 10ns;
tb_ck<='1';
wait for 10ns;
end process;

tb_resetn <= '0', '1' after 100 ns;
tb_dav <='0', '1' after 200 ns, '0' after 230 ns, '1' after 300 ns, '0' after 330 ns, '1' after 400 ns, '0' after 430 ns ;
tb_dout <="00000000", "01001100" after 200 ns, "00110100" after 300 ns, "01001100" after 400 ns ;
tb_end_tx <='0', '1' after 500 ns,'0' after 515 ns ;
end Structural;
