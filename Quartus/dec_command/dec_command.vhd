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
-- CREATED		"Mon Dec 24 14:13:59 2018"

LIBRARY ieee;
USE ieee.std_logic_1164.all; 

LIBRARY work;

ENTITY dec_command IS 
	PORT
	(
		CK :  IN  STD_LOGIC;
		DAV :  IN  STD_LOGIC;
		RESETn :  IN  STD_LOGIC;
		END_TX :  IN  STD_LOGIC;
		DOUT :  IN  STD_LOGIC_VECTOR(7 DOWNTO 0);
		RD :  OUT  STD_LOGIC;
		EN_COUNT_T_RND :  OUT  STD_LOGIC;
		SEL_LED :  OUT  STD_LOGIC_VECTOR(1 DOWNTO 0)
	);
END dec_command;

ARCHITECTURE bdf_type OF dec_command IS 

ATTRIBUTE black_box : BOOLEAN;
ATTRIBUTE noopt : BOOLEAN;

COMPONENT lpm_ff_2
	PORT(aclr : IN STD_LOGIC;
		 clock : IN STD_LOGIC;
		 enable : IN STD_LOGIC;
		 data : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
		 q : OUT STD_LOGIC_VECTOR(7 DOWNTO 0));
END COMPONENT;
ATTRIBUTE black_box OF lpm_ff_2: COMPONENT IS true;
ATTRIBUTE noopt OF lpm_ff_2: COMPONENT IS true;

COMPONENT lpm_ff_1
	PORT(aclr : IN STD_LOGIC;
		 clock : IN STD_LOGIC;
		 enable : IN STD_LOGIC;
		 data : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
		 q : OUT STD_LOGIC_VECTOR(7 DOWNTO 0));
END COMPONENT;
ATTRIBUTE black_box OF lpm_ff_1: COMPONENT IS true;
ATTRIBUTE noopt OF lpm_ff_1: COMPONENT IS true;

COMPONENT l_detect
	PORT(data_in : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
		 L_out : OUT STD_LOGIC
	);
END COMPONENT;

COMPONENT detect_1
	PORT(data_in : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
		 out_1 : OUT STD_LOGIC
	);
END COMPONENT;

COMPONENT detect_2
	PORT(data_in : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
		 out_2 : OUT STD_LOGIC
	);
END COMPONENT;

COMPONENT detect_3
	PORT(data_in : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
		 out_3 : OUT STD_LOGIC
	);
END COMPONENT;

COMPONENT detect_4
	PORT(data_in : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
		 out_4 : OUT STD_LOGIC
	);
END COMPONENT;

COMPONENT fsm_dec_command
	PORT(CK : IN STD_LOGIC;
		 DAV : IN STD_LOGIC;
		 L_correct : IN STD_LOGIC;
		 Detect_1 : IN STD_LOGIC;
		 Detect_2 : IN STD_LOGIC;
		 Detect_3 : IN STD_LOGIC;
		 Detect_4 : IN STD_LOGIC;
		 RESETn : IN STD_LOGIC;
		 END_TX : IN STD_LOGIC;
		 RD : OUT STD_LOGIC;
		 EN_COUNT_T : OUT STD_LOGIC;
		 Clear_reg : OUT STD_LOGIC;
		 En_reg : OUT STD_LOGIC;
		 SEL_LED : OUT STD_LOGIC_VECTOR(1 DOWNTO 0)
	);
END COMPONENT;

SIGNAL	SYNTHESIZED_WIRE_15 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_16 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_17 :  STD_LOGIC_VECTOR(7 DOWNTO 0);
SIGNAL	SYNTHESIZED_WIRE_5 :  STD_LOGIC_VECTOR(7 DOWNTO 0);
SIGNAL	SYNTHESIZED_WIRE_10 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_11 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_12 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_13 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_14 :  STD_LOGIC;


BEGIN 



b2v_inst11 : lpm_ff_2
PORT MAP(aclr => SYNTHESIZED_WIRE_15,
		 clock => CK,
		 enable => SYNTHESIZED_WIRE_16,
		 data => SYNTHESIZED_WIRE_17,
		 q => SYNTHESIZED_WIRE_5);


b2v_inst12 : lpm_ff_1
PORT MAP(aclr => SYNTHESIZED_WIRE_15,
		 clock => CK,
		 enable => SYNTHESIZED_WIRE_16,
		 data => DOUT,
		 q => SYNTHESIZED_WIRE_17);


b2v_inst2 : l_detect
PORT MAP(data_in => SYNTHESIZED_WIRE_5,
		 L_out => SYNTHESIZED_WIRE_10);


b2v_inst3 : detect_1
PORT MAP(data_in => SYNTHESIZED_WIRE_17,
		 out_1 => SYNTHESIZED_WIRE_11);


b2v_inst4 : detect_2
PORT MAP(data_in => SYNTHESIZED_WIRE_17,
		 out_2 => SYNTHESIZED_WIRE_12);


b2v_inst5 : detect_3
PORT MAP(data_in => SYNTHESIZED_WIRE_17,
		 out_3 => SYNTHESIZED_WIRE_13);


b2v_inst6 : detect_4
PORT MAP(data_in => SYNTHESIZED_WIRE_17,
		 out_4 => SYNTHESIZED_WIRE_14);


b2v_inst7 : fsm_dec_command
PORT MAP(CK => CK,
		 DAV => DAV,
		 L_correct => SYNTHESIZED_WIRE_10,
		 Detect_1 => SYNTHESIZED_WIRE_11,
		 Detect_2 => SYNTHESIZED_WIRE_12,
		 Detect_3 => SYNTHESIZED_WIRE_13,
		 Detect_4 => SYNTHESIZED_WIRE_14,
		 RESETn => RESETn,
		 END_TX => END_TX,
		 RD => RD,
		 EN_COUNT_T => EN_COUNT_T_RND,
		 Clear_reg => SYNTHESIZED_WIRE_15,
		 En_reg => SYNTHESIZED_WIRE_16,
		 SEL_LED => SEL_LED);


END bdf_type;