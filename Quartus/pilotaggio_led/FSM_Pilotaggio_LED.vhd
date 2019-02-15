
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity FSM_Pilotaggio_LED is
  Port (
  reset, clk:  in std_logic;
  buttons: in std_logic_vector (3 downto 0);
  sel_LED: in std_logic_vector (3 downto 0);
  enable_count: out std_logic;
  enable_accensione: in std_logic;
  start_time_tx: out std_logic;
  LEDS_out: out std_logic_vector (3 downto 0)
   );
end FSM_Pilotaggio_LED;

architecture Behavioral of FSM_Pilotaggio_LED is

type states is (Wait_Enable_LED, Accensione_LED,Wait_for_BUTTON,Bottone_Premuto);

signal state: states:=Wait_Enable_LED;
signal next_state:states;
signal LEDS: std_logic_vector (3 downto 0);
begin
LEDS<=not (buttons);
--process(sel_LED_in,sel_LED)
--begin
--case sel_LED_in is
--    when "00" => sel_LED <="0001";
--    when "01" => sel_LED <="0010";
--    when "10" => sel_LED <="0100";
--    when "11" => sel_LED <="1000";
--    when others=> sel_LED<="0000";
--end case;
--end process;

process(state, next_state,LEDS, enable_accensione)
begin
  
case state is

        when Wait_Enable_LED =>
            LEDS_out<="0000";
            enable_count<='0';
            start_time_tx<='0';
            
            if enable_accensione ='1' then
                next_state <= Accensione_LED;
            else
                next_state<= state;
            end if;
        
        when Accensione_LED =>
            LEDS_out<= sel_LED;
            enable_count<='1';
            start_time_tx<='0';    
        
            next_state<= Wait_for_BUTTON;
        
        
        when Wait_for_BUTTON =>
            LEDS_out<=sel_LED;
            enable_count<='1';
            start_time_tx<='0';
            
            if LEDS = sel_LED then
                next_state <= Bottone_Premuto;
            else
                next_state<= state;
            end if;

        when Bottone_Premuto =>
            enable_count<='0';
            start_time_tx<='1';
            LEDS_out<="0000";
            
            next_state<= Wait_Enable_LED;
         
         when others=>   
            enable_count<='0';
            start_time_tx<='0';
            LEDS_out<="0000";
            next_state<= Wait_Enable_LED;

         
end case;
end process;


process(clk)
begin
if clk'event and clk='1' then
    if reset='1' then
      state<= Wait_Enable_LED;
  else
      state<= next_state;
end if;
end if;
end process;

end Behavioral;