library IEEE;
use IEEE.Std_logic_1164.all;
use IEEE.Numeric_Std.all;

entity output_encoder_tb is
end;

architecture bench of output_encoder_tb is

  component output_encoder 
  	PORT
  	(
  		clk :  IN  STD_LOGIC;
  		Start_TX :  IN  STD_LOGIC;
  		TX_Ready :  IN  STD_LOGIC;
  		RST :  IN  STD_LOGIC;
  		Timer :  IN  STD_LOGIC_VECTOR(15 DOWNTO 0);
  		WR :  OUT  STD_LOGIC;
  		End_TX :  OUT  STD_LOGIC;
  		D_Out :  OUT  STD_LOGIC_VECTOR(7 DOWNTO 0)
  	);
  end component;

  signal clk: STD_LOGIC;
  signal Start_TX: STD_LOGIC;
  signal TX_Ready: STD_LOGIC;
  signal RST: STD_LOGIC;
  signal Timer: STD_LOGIC_VECTOR(15 DOWNTO 0);
  signal WR: STD_LOGIC;
  signal End_TX: STD_LOGIC;
  signal D_Out: STD_LOGIC_VECTOR(7 DOWNTO 0) ;

  constant clock_period: time := 10 ps;
  signal stop_the_clock: boolean;

begin

  uut: output_encoder port map ( clk      => clk,
                                 Start_TX => Start_TX,
                                 TX_Ready => TX_Ready,
                                 RST      => RST,
                                 Timer    => Timer,
                                 WR       => WR,
                                 End_TX   => End_TX,
                                 D_Out    => D_Out );

  stimulus: process
  begin
  
    -- Put initialisation code here
        Start_TX<='0';
        Timer<=(others=>'0');
        TX_Ready<='0';
    
    
        RST <= '1';
        wait for 2*clock_period;
        RST <= '0';
        wait for clock_period;
		    Start_TX<='1';
        wait for clock_period;
		    Start_TX<='0';
		    wait for 2*clock_period;
		    Timer<="0011001010001111";
		    wait for 5*clock_period;
		    TX_Ready<='1';
		    wait for 6*clock_period;
        TX_Ready<='0';
		    wait for 2*clock_period;
		    TX_Ready<='1';
		    wait for 7*clock_period;
        TX_Ready<='0';
		    wait for 1*clock_period;
		    TX_Ready<='1';
		    wait for 3*clock_period;
        TX_Ready<='0';
		    wait for 2*clock_period;
		    TX_Ready<='1';
		    wait for 6*clock_period;
        TX_Ready<='0';
		    wait for 2*clock_period;
    -- Put test bench stimulus code here

    stop_the_clock <= false;
    wait;
  end process;

  clocking: process
  begin
    while not stop_the_clock loop
      clk <= '0', '1' after clock_period / 2;
      wait for clock_period;
    end loop;
    wait;
  end process;

end;




configuration cfg_output_encoder_tb of output_encoder_tb is
  for bench
    for uut: output_encoder
      -- Default configuration
    end for;
  end for;
end cfg_output_encoder_tb;

configuration cfg_output_encoder_tb_bdf_type of output_encoder_tb is
  for bench
    for uut: output_encoder
      use entity work.output_encoder(bdf_type);
    end for;
  end for;
end cfg_output_encoder_tb_bdf_type;