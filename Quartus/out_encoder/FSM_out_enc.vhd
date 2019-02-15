library ieee;
use ieee.std_logic_1164.all;

entity FSM_out_enc is
port (
	
	clk,rst,TC,start_TX,TX_ready:in std_logic;
	send_ASCII_T,end_TX,WR,clear,cnt_en:out std_logic);
end FSM_out_enc;

architecture FSM of FSM_out_enc is

type state is (Reset,Wait_Start,Send_T,Wait_TX,Count_up,wrt,TC_ctrl,Done);
signal present_state:state;

begin

state_flow:process(clk,rst)
begin
	if rst ='1' then
		present_state<=Reset;
		
	else
		if rising_edge(clk) then
			case(present_state) is 
				when Reset =>
					present_state<=Wait_Start;
				when Wait_Start=>
					if start_TX='1' then
						present_state<=Send_T;
					else
						present_state<=present_state;
					end if;
				when send_T =>
					present_state<=wait_TX;
				when wait_TX =>
					if TX_ready='1' then
						present_state<=Count_up;
					else
						present_state<=present_state;
					end if;
				when Count_up =>
					present_state<=wrt;
				when wrt =>
					present_state<=TC_ctrl;
				when TC_ctrl =>
					if TC = '1' then
						present_state<=Done;
					else
						present_state<=wait_TX;
					end if;
				when Done =>
					present_state<=reset;
			end case;
		end if;
	end if;

end process;
state_signal:process(present_state)
begin
			case(present_state) is 
				when Reset =>
					clear<='1';
					send_ASCII_T<='0';
					end_TX<='0';
					wr<='0';
					cnt_en<='0';
				when Wait_Start=>
					clear<='0';
					send_ASCII_T<='1';
					end_TX<='0';
					wr<='0';
					cnt_en<='0';
				when send_T =>
					clear<='0';
					send_ASCII_T<='1';
					end_TX<='0';
					wr<='1';
					cnt_en<='0';
				when wait_TX =>
					clear<='0';
					send_ASCII_T<='0';
					end_TX<='0';
					wr<='0';
					cnt_en<='0';
				when Count_up =>
					clear<='0';
					send_ASCII_T<='0';
					end_TX<='0';
					wr<='0';
					cnt_en<='1';
				when wrt=>
					clear<='0';
					send_ASCII_T<='0';
					end_TX<='0';
					wr<='1';
					cnt_en<='0';
				when TC_ctrl =>
					clear<='0';
					send_ASCII_T<='0';
					end_TX<='0';
					wr<='0';
					cnt_en<='0';
				when Done =>
					clear<='0';
					send_ASCII_T<='0';
					end_TX<='1';
					wr<='0';
					cnt_en<='0';
			end case;

end process;

end FSM;