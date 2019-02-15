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
-- CREATED		"Fri Jan 18 10:31:14 2019"

LIBRARY ieee;
USE ieee.std_logic_1164.all; 

LIBRARY work;

ENTITY Rilevatore_Riflessi_Completo IS 
	PORT
	(
		CLOCK :  IN  STD_LOGIC;
		TX_RDY :  IN  STD_LOGIC;
		RESET :  IN  STD_LOGIC;
		DAV :  IN  STD_LOGIC;
		Buttons :  IN  STD_LOGIC_VECTOR(3 DOWNTO 0);
		Command :  IN  STD_LOGIC_VECTOR(7 DOWNTO 0);
		WR :  OUT  STD_LOGIC;
		RD :  OUT  STD_LOGIC;
		Inizio_attesa_jtag :  OUT  STD_LOGIC;
		Data_to_TX :  OUT  STD_LOGIC_VECTOR(7 DOWNTO 0);
		LED_deb :  OUT  STD_LOGIC_VECTOR(1 DOWNTO 0);
		LEDS_OUT :  OUT  STD_LOGIC_VECTOR(3 DOWNTO 0)
	);
END Rilevatore_Riflessi_Completo;

ARCHITECTURE bdf_type OF Rilevatore_Riflessi_Completo IS 

COMPONENT output_encoder
	PORT(RST : IN STD_LOGIC;
		 clk : IN STD_LOGIC;
		 TX_Ready : IN STD_LOGIC;
		 Start_TX : IN STD_LOGIC;
		 Timer : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
		 End_TX : OUT STD_LOGIC;
		 WR : OUT STD_LOGIC;
		 D_Out : OUT STD_LOGIC_VECTOR(7 DOWNTO 0)
	);
END COMPONENT;

COMPONENT lpm_counter_ms
	PORT(sclr : IN STD_LOGIC;
		 clock : IN STD_LOGIC;
		 cnt_en : IN STD_LOGIC;
		 aclr : IN STD_LOGIC;
		 q : OUT STD_LOGIC_VECTOR(14 DOWNTO 0)
	);
END COMPONENT;

COMPONENT ms_detect
	PORT(data_in : IN STD_LOGIC_VECTOR(14 DOWNTO 0);
		 ms_out : OUT STD_LOGIC
	);
END COMPONENT;

COMPONENT pilotaggio_led2
	PORT(reset : IN STD_LOGIC;
		 clock : IN STD_LOGIC;
		 Enable_LEDS : IN STD_LOGIC;
		 Buttons : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
		 SEL_LEDS_in : IN STD_LOGIC_VECTOR(1 DOWNTO 0);
		 enable_count_time : OUT STD_LOGIC;
		 start_tx : OUT STD_LOGIC;
		 leds_out : OUT STD_LOGIC_VECTOR(3 DOWNTO 0)
	);
END COMPONENT;

COMPONENT dec_command
	PORT(CK : IN STD_LOGIC;
		 DAV : IN STD_LOGIC;
		 RESETn : IN STD_LOGIC;
		 END_TX : IN STD_LOGIC;
		 DOUT : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
		 RD : OUT STD_LOGIC;
		 EN_COUNT_T_RND : OUT STD_LOGIC;
		 SEL_LED : OUT STD_LOGIC_VECTOR(1 DOWNTO 0)
	);
END COMPONENT;

COMPONENT random_time_generator
	PORT(RESET : IN STD_LOGIC;
		 Inizio_Attesa : IN STD_LOGIC;
		 CK_25MHz : IN STD_LOGIC;
		 Inizio_attesa_in : OUT STD_LOGIC;
		 Termine_Attesa : OUT STD_LOGIC
	);
END COMPONENT;

COMPONENT counter_tempo_riflessi
	PORT(sclr : IN STD_LOGIC;
		 clock : IN STD_LOGIC;
		 cnt_en : IN STD_LOGIC;
		 aclr : IN STD_LOGIC;
		 q : OUT STD_LOGIC_VECTOR(15 DOWNTO 0)
	);
END COMPONENT;

SIGNAL	SYNTHESIZED_WIRE_19 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_1 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_2 :  STD_LOGIC_VECTOR(15 DOWNTO 0);
SIGNAL	SYNTHESIZED_WIRE_20 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_4 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_6 :  STD_LOGIC_VECTOR(14 DOWNTO 0);
SIGNAL	SYNTHESIZED_WIRE_8 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_9 :  STD_LOGIC_VECTOR(1 DOWNTO 0);
SIGNAL	SYNTHESIZED_WIRE_10 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_21 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_13 :  STD_LOGIC;


BEGIN 
LED_deb <= SYNTHESIZED_WIRE_9;



b2v_inst : output_encoder
PORT MAP(RST => SYNTHESIZED_WIRE_19,
		 clk => CLOCK,
		 TX_Ready => TX_RDY,
		 Start_TX => SYNTHESIZED_WIRE_1,
		 Timer => SYNTHESIZED_WIRE_2,
		 End_TX => SYNTHESIZED_WIRE_21,
		 WR => WR,
		 D_Out => Data_to_TX);


b2v_inst1 : lpm_counter_ms
PORT MAP(sclr => SYNTHESIZED_WIRE_20,
		 clock => CLOCK,
		 cnt_en => SYNTHESIZED_WIRE_4,
		 aclr => SYNTHESIZED_WIRE_19,
		 q => SYNTHESIZED_WIRE_6);


b2v_inst2 : ms_detect
PORT MAP(data_in => SYNTHESIZED_WIRE_6,
		 ms_out => SYNTHESIZED_WIRE_20);


b2v_inst3 : pilotaggio_led2
PORT MAP(reset => SYNTHESIZED_WIRE_19,
		 clock => CLOCK,
		 Enable_LEDS => SYNTHESIZED_WIRE_8,
		 Buttons => Buttons,
		 SEL_LEDS_in => SYNTHESIZED_WIRE_9,
		 enable_count_time => SYNTHESIZED_WIRE_4,
		 start_tx => SYNTHESIZED_WIRE_1,
		 leds_out => LEDS_OUT);


b2v_inst4 : dec_command
PORT MAP(CK => CLOCK,
		 DAV => DAV,
		 RESETn => SYNTHESIZED_WIRE_10,
		 END_TX => SYNTHESIZED_WIRE_21,
		 DOUT => Command,
		 RD => RD,
		 EN_COUNT_T_RND => SYNTHESIZED_WIRE_13,
		 SEL_LED => SYNTHESIZED_WIRE_9);


b2v_inst5 : random_time_generator
PORT MAP(RESET => SYNTHESIZED_WIRE_19,
		 Inizio_Attesa => SYNTHESIZED_WIRE_13,
		 CK_25MHz => CLOCK,
		 Inizio_attesa_in => Inizio_attesa_jtag,
		 Termine_Attesa => SYNTHESIZED_WIRE_8);


SYNTHESIZED_WIRE_10 <= NOT(SYNTHESIZED_WIRE_19);



b2v_inst7 : counter_tempo_riflessi
PORT MAP(sclr => SYNTHESIZED_WIRE_21,
		 clock => CLOCK,
		 cnt_en => SYNTHESIZED_WIRE_20,
		 aclr => SYNTHESIZED_WIRE_19,
		 q => SYNTHESIZED_WIRE_2);


SYNTHESIZED_WIRE_19 <= SYNTHESIZED_WIRE_21 OR RESET;


END bdf_type;