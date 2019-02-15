-- Copyright (C) 1991-2011 Altera Corporation
-- Your use of Altera Corporation's design tools, logic functions 
-- and other software and tools, and its AMPP partner logic 
-- functions, and any output files from any of the foregoing 
-- (including device programming or simulation files), and any 
-- associated documentation or information are expressly subject 
-- to the terms and conditions of the Altera Program License 
-- Subscription Agreement, Altera MegaCore Function License 
-- Agreement, or other applicable license agreement, including, 
-- without limitation, that your use is for the sole purpose of 
-- programming logic devices manufactured by Altera and sold by 
-- Altera or its authorized distributors.  Please refer to the 
-- applicable agreement for further details.

-- PROGRAM		"Quartus II 32-bit"
-- VERSION		"Version 11.1 Build 259 01/25/2012 Service Pack 2 SJ Web Edition"
-- CREATED		"Fri Jan 18 09:36:57 2019"

LIBRARY ieee;
USE ieee.std_logic_1164.all; 

LIBRARY work;

ENTITY output_encoder IS 
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
END output_encoder;

ARCHITECTURE bdf_type OF output_encoder IS 

ATTRIBUTE black_box : BOOLEAN;
ATTRIBUTE noopt : BOOLEAN;

COMPONENT lpm_rom_0
	PORT(inclock : IN STD_LOGIC;
		 address : IN STD_LOGIC_VECTOR(4 DOWNTO 0);
		 q : OUT STD_LOGIC_VECTOR(7 DOWNTO 0));
END COMPONENT;
ATTRIBUTE black_box OF lpm_rom_0: COMPONENT IS true;
ATTRIBUTE noopt OF lpm_rom_0: COMPONENT IS true;

COMPONENT out_gen_lpm_mux0
	PORT(data0x : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
		 data1x : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
		 data2x : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
		 data3x : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
		 sel : IN STD_LOGIC_VECTOR(1 DOWNTO 0);
		 result : OUT STD_LOGIC_VECTOR(3 DOWNTO 0)
	);
END COMPONENT;

COMPONENT fsm_out_enc
	PORT(clk : IN STD_LOGIC;
		 rst : IN STD_LOGIC;
		 TC : IN STD_LOGIC;
		 start_TX : IN STD_LOGIC;
		 TX_ready : IN STD_LOGIC;
		 send_ASCII_T : OUT STD_LOGIC;
		 end_TX : OUT STD_LOGIC;
		 WR : OUT STD_LOGIC;
		 clear : OUT STD_LOGIC;
		 cnt_en : OUT STD_LOGIC
	);
END COMPONENT;

COMPONENT out_gen_lpm_counter0
	PORT(sclr : IN STD_LOGIC;
		 clock : IN STD_LOGIC;
		 clk_en : IN STD_LOGIC;
		 cnt_en : IN STD_LOGIC;
		 q : OUT STD_LOGIC_VECTOR(2 DOWNTO 0)
	);
END COMPONENT;

COMPONENT lpm_mux_addr
	PORT(sel : IN STD_LOGIC;
		 data0x : IN STD_LOGIC_VECTOR(4 DOWNTO 0);
		 data1x : IN STD_LOGIC_VECTOR(4 DOWNTO 0);
		 result : OUT STD_LOGIC_VECTOR(4 DOWNTO 0)
	);
END COMPONENT;

COMPONENT const
	PORT(		 ones : OUT STD_LOGIC_VECTOR(4 DOWNTO 0)
	);
END COMPONENT;

SIGNAL	addr :  STD_LOGIC_VECTOR(4 DOWNTO 0);
SIGNAL	counter :  STD_LOGIC_VECTOR(2 DOWNTO 0);
SIGNAL	SYNTHESIZED_WIRE_0 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_1 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_2 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_3 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_4 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_5 :  STD_LOGIC_VECTOR(4 DOWNTO 0);
SIGNAL	SYNTHESIZED_WIRE_6 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_7 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_8 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_9 :  STD_LOGIC_VECTOR(4 DOWNTO 0);


BEGIN 
SYNTHESIZED_WIRE_3 <= '1';



b2v_inst : out_gen_lpm_mux0
PORT MAP(data0x => Timer(15 DOWNTO 12),
		 data1x => Timer(11 DOWNTO 8),
		 data2x => Timer(7 DOWNTO 4),
		 data3x => Timer(3 DOWNTO 0),
		 sel => counter(1 DOWNTO 0),
		 result => addr(3 DOWNTO 0));


b2v_inst10 : fsm_out_enc
PORT MAP(clk => clk,
		 rst => RST,
		 TC => SYNTHESIZED_WIRE_0,
		 start_TX => Start_TX,
		 TX_ready => TX_Ready,
		 send_ASCII_T => SYNTHESIZED_WIRE_8,
		 end_TX => End_TX,
		 WR => WR,
		 clear => SYNTHESIZED_WIRE_1,
		 cnt_en => SYNTHESIZED_WIRE_4);


SYNTHESIZED_WIRE_2 <= RST OR SYNTHESIZED_WIRE_1;


b2v_inst12 : out_gen_lpm_counter0
PORT MAP(sclr => SYNTHESIZED_WIRE_2,
		 clock => clk,
		 clk_en => SYNTHESIZED_WIRE_3,
		 cnt_en => SYNTHESIZED_WIRE_4,
		 q => counter);


b2v_inst13 : lpm_rom_0
PORT MAP(inclock => clk,
		 address => SYNTHESIZED_WIRE_5,
		 q => D_Out);


SYNTHESIZED_WIRE_0 <= counter(2) AND SYNTHESIZED_WIRE_6 AND SYNTHESIZED_WIRE_7;


SYNTHESIZED_WIRE_6 <= NOT(counter(1));



SYNTHESIZED_WIRE_7 <= NOT(counter(0));



b2v_inst5 : lpm_mux_addr
PORT MAP(sel => SYNTHESIZED_WIRE_8,
		 data0x => addr,
		 data1x => SYNTHESIZED_WIRE_9,
		 result => SYNTHESIZED_WIRE_5);


b2v_inst7 : const
PORT MAP(		 ones => SYNTHESIZED_WIRE_9);




addr(4) <= '0';
END bdf_type;