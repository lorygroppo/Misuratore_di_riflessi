
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity FSM_attesa is
  Port (
  reset, clk:  in std_logic;
  inizio_attesa_fsm: in std_logic;
  tc: in std_logic;
  fine_attesa_fsm: out std_logic;
   cnt_ld: out std_logic
   );
end FSM_attesa;

architecture Behavioral of FSM_attesa is

type states is (reset_state,wait_start,wait_start2,wait_start3, wait_tc, fine_attesa);

signal state: states:=reset_state;
signal next_state:states;
begin

process(state, next_state,reset,inizio_attesa_fsm,tc)
begin
case state is
when reset_state =>
		 fine_attesa_fsm<='0';
		 cnt_ld<='0';
		 next_state <= wait_start;
when wait_start =>
			 fine_attesa_fsm<='0';
			 		 cnt_ld<='0';

			 if inizio_attesa_fsm ='0' then
			 next_state <= wait_start2;
			 else
			 next_state <= wait_start;
			 end if;		 
when wait_start2 =>
			 fine_attesa_fsm<='0';
			 		 cnt_ld<='0';

			 if inizio_attesa_fsm ='1' then
			 next_state <= wait_start3;
			 else
			 next_state <= wait_start2;
			 end if;

	 when wait_start3 =>
	 fine_attesa_fsm<='0';
	 cnt_ld<='1';

	 next_state <= wait_tc;

when wait_tc=>
			 cnt_ld<='0';
			 fine_attesa_fsm<='0';		 
		if tc='1' then	next_state <= fine_attesa;
		else next_state <= wait_tc;
		end if;
		
		when fine_attesa=>
					 fine_attesa_fsm<='1';	
				next_state <= reset_state;

		when others => 
		fine_attesa_fsm<='0';	
		next_state <= reset_state;
		end case;
		end process;
		
		
process(clk)
begin
if clk'event and clk='1' then
    if reset='1' then
      state<= reset_state;
  else
      state<= next_state;
end if;
end if;
end process;

end behavioral;

		

		