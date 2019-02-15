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
-- CREATED		"Fri Jan 18 09:38:04 2019"

LIBRARY ieee;
USE ieee.std_logic_1164.all; 

LIBRARY work;

ENTITY UartProgetto_comp IS 
	PORT
	(
		Reset :  IN  STD_LOGIC;
		CK :  IN  STD_LOGIC;
		RX_in :  IN  STD_LOGIC;
		buttons_in :  IN  STD_LOGIC_VECTOR(3 DOWNTO 0);
		tx_out :  OUT  STD_LOGIC;
		Out_inizio_attesa :  OUT  STD_LOGIC;
		led_deb :  OUT  STD_LOGIC_VECTOR(1 DOWNTO 0);
		LEDS_output :  OUT  STD_LOGIC_VECTOR(3 DOWNTO 0)
	);
END UartProgetto_comp;

ARCHITECTURE bdf_type OF UartProgetto_comp IS 

COMPONENT uart
	PORT(WR : IN STD_LOGIC;
		 CK : IN STD_LOGIC;
		 RX_UART : IN STD_LOGIC;
		 RD : IN STD_LOGIC;
		 RESETn : IN STD_LOGIC;
		 DIN : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
		 TX_UART : OUT STD_LOGIC;
		 TXRDY : OUT STD_LOGIC;
		 DAV : OUT STD_LOGIC;
		 DOUT : OUT STD_LOGIC_VECTOR(7 DOWNTO 0)
	);
END COMPONENT;

COMPONENT rilevatore_riflessi_completo
	PORT(CLOCK : IN STD_LOGIC;
		 RESET : IN STD_LOGIC;
		 DAV : IN STD_LOGIC;
		 TX_RDY : IN STD_LOGIC;
		 Buttons : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
		 Command : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
		 Inizio_attesa_jtag : OUT STD_LOGIC;
		 RD : OUT STD_LOGIC;
		 WR : OUT STD_LOGIC;
		 Data_to_TX : OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
		 LED_deb : OUT STD_LOGIC_VECTOR(1 DOWNTO 0);
		 LEDS_OUT : OUT STD_LOGIC_VECTOR(3 DOWNTO 0)
	);
END COMPONENT;

COMPONENT altpll_progetto_comp
	PORT(inclk0 : IN STD_LOGIC;
		 c0 : OUT STD_LOGIC
	);
END COMPONENT;

SIGNAL	SYNTHESIZED_WIRE_0 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_9 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_2 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_3 :  STD_LOGIC_VECTOR(7 DOWNTO 0);
SIGNAL	SYNTHESIZED_WIRE_5 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_6 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_7 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_8 :  STD_LOGIC_VECTOR(7 DOWNTO 0);


BEGIN 



b2v_inst : uart
PORT MAP(WR => SYNTHESIZED_WIRE_0,
		 CK => SYNTHESIZED_WIRE_9,
		 RX_UART => RX_in,
		 RD => SYNTHESIZED_WIRE_2,
		 RESETn => Reset,
		 DIN => SYNTHESIZED_WIRE_3,
		 TX_UART => tx_out,
		 TXRDY => SYNTHESIZED_WIRE_7,
		 DAV => SYNTHESIZED_WIRE_6,
		 DOUT => SYNTHESIZED_WIRE_8);


b2v_inst2 : rilevatore_riflessi_completo
PORT MAP(CLOCK => SYNTHESIZED_WIRE_9,
		 RESET => SYNTHESIZED_WIRE_5,
		 DAV => SYNTHESIZED_WIRE_6,
		 TX_RDY => SYNTHESIZED_WIRE_7,
		 Buttons => buttons_in,
		 Command => SYNTHESIZED_WIRE_8,
		 Inizio_attesa_jtag => Out_inizio_attesa,
		 RD => SYNTHESIZED_WIRE_2,
		 WR => SYNTHESIZED_WIRE_0,
		 Data_to_TX => SYNTHESIZED_WIRE_3,
		 LED_deb => led_deb,
		 LEDS_OUT => LEDS_output);


SYNTHESIZED_WIRE_5 <= NOT(Reset);



b2v_inst5 : altpll_progetto_comp
PORT MAP(inclk0 => CK,
		 c0 => SYNTHESIZED_WIRE_9);


END bdf_type;