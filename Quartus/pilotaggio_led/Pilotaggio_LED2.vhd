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
-- VERSION		"Version 11.1 Build 173 11/01/2011 SJ Web Edition"
-- CREATED		"Mon Dec 31 12:04:18 2018"

LIBRARY ieee;
USE ieee.std_logic_1164.all; 

LIBRARY work;

ENTITY Pilotaggio_LED2 IS 
	PORT
	(
		Enable_LEDS :  IN  STD_LOGIC;
		reset :  IN  STD_LOGIC;
		clock :  IN  STD_LOGIC;
		Buttons :  IN  STD_LOGIC_VECTOR(3 DOWNTO 0);
		SEL_LEDS_in :  IN  STD_LOGIC_VECTOR(1 DOWNTO 0);
		start_tx :  OUT  STD_LOGIC;
		enable_count_time :  OUT  STD_LOGIC;
		leds_out :  OUT  STD_LOGIC_VECTOR(3 DOWNTO 0)
	);
END Pilotaggio_LED2;

ARCHITECTURE bdf_type OF Pilotaggio_LED2 IS 

COMPONENT fsm_pilotaggio_led
	PORT(reset : IN STD_LOGIC;
		 clk : IN STD_LOGIC;
		 enable_accensione : IN STD_LOGIC;
		 buttons : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
		 sel_LED : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
		 enable_count : OUT STD_LOGIC;
		 start_time_tx : OUT STD_LOGIC;
		 LEDS_out : OUT STD_LOGIC_VECTOR(3 DOWNTO 0)
	);
END COMPONENT;

COMPONENT lpm_decoder_leds_pilot
	PORT(data : IN STD_LOGIC_VECTOR(1 DOWNTO 0);
		 eq0 : OUT STD_LOGIC;
		 eq1 : OUT STD_LOGIC;
		 eq2 : OUT STD_LOGIC;
		 eq3 : OUT STD_LOGIC
	);
END COMPONENT;

SIGNAL	sel_LEDS_bus :  STD_LOGIC_VECTOR(3 DOWNTO 0);


BEGIN 



b2v_inst : fsm_pilotaggio_led
PORT MAP(reset => reset,
		 clk => clock,
		 enable_accensione => Enable_LEDS,
		 buttons => Buttons,
		 sel_LED => sel_LEDS_bus,
		 enable_count => enable_count_time,
		 start_time_tx => start_tx,
		 LEDS_out => leds_out);


b2v_inst4 : lpm_decoder_leds_pilot
PORT MAP(data => SEL_LEDS_in,
		 eq0 => sel_LEDS_bus(0),
		 eq1 => sel_LEDS_bus(1),
		 eq2 => sel_LEDS_bus(2),
		 eq3 => sel_LEDS_bus(3));


END bdf_type;