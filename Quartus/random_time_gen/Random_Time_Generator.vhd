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
-- CREATED		"Fri Jan 18 11:20:08 2019"

LIBRARY ieee;
USE ieee.std_logic_1164.all; 

LIBRARY work;

ENTITY Random_Time_Generator IS 
	PORT
	(
		Inizio_Attesa :  IN  STD_LOGIC;
		CK_25MHz :  IN  STD_LOGIC;
		RESET :  IN  STD_LOGIC;
		Termine_Attesa :  OUT  STD_LOGIC;
		Inizio_attesa_in :  OUT  STD_LOGIC;
		Conteggio_finale :  OUT  STD_LOGIC_VECTOR(29 DOWNTO 0);
		Random_Number :  OUT  STD_LOGIC_VECTOR(7 DOWNTO 0)
	);
END Random_Time_Generator;

ARCHITECTURE bdf_type OF Random_Time_Generator IS 

COMPONENT tc_tempo_attesa
	PORT(numero_contato : IN STD_LOGIC_VECTOR(29 DOWNTO 0);
		 Fine_Conteggio : OUT STD_LOGIC
	);
END COMPONENT;

COMPONENT fsm_attesa
	PORT(reset : IN STD_LOGIC;
		 clk : IN STD_LOGIC;
		 inizio_attesa_fsm : IN STD_LOGIC;
		 tc : IN STD_LOGIC;
		 fine_attesa_fsm : OUT STD_LOGIC;
		 cnt_ld : OUT STD_LOGIC
	);
END COMPONENT;

COMPONENT lpm_shiftreg0_lfsr_random
	PORT(clock : IN STD_LOGIC;
		 shiftin : IN STD_LOGIC;
		 q : OUT STD_LOGIC_VECTOR(7 DOWNTO 0)
	);
END COMPONENT;

COMPONENT xor_lfsr
	PORT(Numero_LSFR : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
		 Shift_in_LSFR : OUT STD_LOGIC
	);
END COMPONENT;

COMPONENT lpm_mult0_random_number_gen
	PORT(dataa : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
		 result : OUT STD_LOGIC_VECTOR(29 DOWNTO 0)
	);
END COMPONENT;

COMPONENT contatore_tempo_random
	PORT(sclr : IN STD_LOGIC;
		 sload : IN STD_LOGIC;
		 clock : IN STD_LOGIC;
		 data : IN STD_LOGIC_VECTOR(29 DOWNTO 0);
		 q : OUT STD_LOGIC_VECTOR(29 DOWNTO 0)
	);
END COMPONENT;

SIGNAL	SYNTHESIZED_WIRE_0 :  STD_LOGIC_VECTOR(29 DOWNTO 0);
SIGNAL	SYNTHESIZED_WIRE_9 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_3 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_10 :  STD_LOGIC_VECTOR(7 DOWNTO 0);
SIGNAL	SYNTHESIZED_WIRE_6 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_7 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_8 :  STD_LOGIC_VECTOR(29 DOWNTO 0);


BEGIN 
Inizio_attesa_in <= Inizio_Attesa;
Conteggio_finale <= SYNTHESIZED_WIRE_0;
Random_Number <= SYNTHESIZED_WIRE_10;



b2v_inst : tc_tempo_attesa
PORT MAP(numero_contato => SYNTHESIZED_WIRE_0,
		 Fine_Conteggio => SYNTHESIZED_WIRE_9);


b2v_inst1 : fsm_attesa
PORT MAP(reset => RESET,
		 clk => CK_25MHz,
		 inizio_attesa_fsm => Inizio_Attesa,
		 tc => SYNTHESIZED_WIRE_9,
		 fine_attesa_fsm => Termine_Attesa,
		 cnt_ld => SYNTHESIZED_WIRE_7);


SYNTHESIZED_WIRE_6 <= RESET OR SYNTHESIZED_WIRE_9;


b2v_inst4 : lpm_shiftreg0_lfsr_random
PORT MAP(clock => CK_25MHz,
		 shiftin => SYNTHESIZED_WIRE_3,
		 q => SYNTHESIZED_WIRE_10);


b2v_inst5 : xor_lfsr
PORT MAP(Numero_LSFR => SYNTHESIZED_WIRE_10,
		 Shift_in_LSFR => SYNTHESIZED_WIRE_3);


b2v_inst6 : lpm_mult0_random_number_gen
PORT MAP(dataa => SYNTHESIZED_WIRE_10,
		 result => SYNTHESIZED_WIRE_8);


b2v_inst8 : contatore_tempo_random
PORT MAP(sclr => SYNTHESIZED_WIRE_6,
		 sload => SYNTHESIZED_WIRE_7,
		 clock => CK_25MHz,
		 data => SYNTHESIZED_WIRE_8,
		 q => SYNTHESIZED_WIRE_0);


END bdf_type;