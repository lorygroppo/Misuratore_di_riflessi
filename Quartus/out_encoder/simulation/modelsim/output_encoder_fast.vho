-- Copyright (C) 1991-2013 Altera Corporation
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

-- VENDOR "Altera"
-- PROGRAM "Quartus II 64-Bit"
-- VERSION "Version 13.0.1 Build 232 06/12/2013 Service Pack 1 SJ Web Edition"

-- DATE "12/27/2018 12:02:27"

-- 
-- Device: Altera EP2C5T144C6 Package TQFP144
-- 

-- 
-- This VHDL file should be used for ModelSim-Altera (VHDL) only
-- 

LIBRARY CYCLONEII;
LIBRARY IEEE;
USE CYCLONEII.CYCLONEII_COMPONENTS.ALL;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY 	output_encoder IS
    PORT (
	WR : OUT std_logic;
	RST : IN std_logic;
	Start_TX : IN std_logic;
	clk : IN std_logic;
	TX_Ready : IN std_logic;
	End_TX : OUT std_logic;
	D_Out : OUT std_logic_vector(7 DOWNTO 0);
	\Time\ : IN std_logic_vector(15 DOWNTO 0)
	);
END output_encoder;

-- Design Ports Information
-- WR	=>  Location: PIN_126,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- End_TX	=>  Location: PIN_52,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- D_Out[7]	=>  Location: PIN_47,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- D_Out[6]	=>  Location: PIN_53,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- D_Out[5]	=>  Location: PIN_48,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- D_Out[4]	=>  Location: PIN_51,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- D_Out[3]	=>  Location: PIN_55,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- D_Out[2]	=>  Location: PIN_134,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- D_Out[1]	=>  Location: PIN_133,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- D_Out[0]	=>  Location: PIN_132,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- TX_Ready	=>  Location: PIN_125,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- Start_TX	=>  Location: PIN_129,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- clk	=>  Location: PIN_17,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- RST	=>  Location: PIN_18,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- Time[8]	=>  Location: PIN_59,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- Time[4]	=>  Location: PIN_63,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- Time[12]	=>  Location: PIN_26,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- Time[0]	=>  Location: PIN_121,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- Time[5]	=>  Location: PIN_25,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- Time[9]	=>  Location: PIN_88,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- Time[13]	=>  Location: PIN_89,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- Time[1]	=>  Location: PIN_90,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- Time[10]	=>  Location: PIN_91,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- Time[6]	=>  Location: PIN_65,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- Time[14]	=>  Location: PIN_24,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- Time[2]	=>  Location: PIN_60,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- Time[7]	=>  Location: PIN_57,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- Time[11]	=>  Location: PIN_27,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- Time[15]	=>  Location: PIN_87,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- Time[3]	=>  Location: PIN_58,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default


ARCHITECTURE structure OF output_encoder IS
SIGNAL gnd : std_logic := '0';
SIGNAL vcc : std_logic := '1';
SIGNAL unknown : std_logic := 'X';
SIGNAL devoe : std_logic := '1';
SIGNAL devclrn : std_logic := '1';
SIGNAL devpor : std_logic := '1';
SIGNAL ww_devoe : std_logic;
SIGNAL ww_devclrn : std_logic;
SIGNAL ww_devpor : std_logic;
SIGNAL ww_WR : std_logic;
SIGNAL ww_RST : std_logic;
SIGNAL ww_Start_TX : std_logic;
SIGNAL ww_clk : std_logic;
SIGNAL ww_TX_Ready : std_logic;
SIGNAL ww_End_TX : std_logic;
SIGNAL ww_D_Out : std_logic_vector(7 DOWNTO 0);
SIGNAL \ww_Time\ : std_logic_vector(15 DOWNTO 0);
SIGNAL \inst13|srom|rom_block|auto_generated|ram_block1a0_PORTAADDR_bus\ : std_logic_vector(3 DOWNTO 0);
SIGNAL \inst13|srom|rom_block|auto_generated|ram_block1a0_PORTADATAOUT_bus\ : std_logic_vector(7 DOWNTO 0);
SIGNAL \RST~clkctrl_INCLK_bus\ : std_logic_vector(3 DOWNTO 0);
SIGNAL \clk~clkctrl_INCLK_bus\ : std_logic_vector(3 DOWNTO 0);
SIGNAL \TX_Ready~combout\ : std_logic;
SIGNAL \inst15~feeder_combout\ : std_logic;
SIGNAL \RST~combout\ : std_logic;
SIGNAL \RST~clkctrl_outclk\ : std_logic;
SIGNAL \inst15~regout\ : std_logic;
SIGNAL \inst12|LPM_COUNTER_component|auto_generated|counter_comb_bita0~combout\ : std_logic;
SIGNAL \~GND~combout\ : std_logic;
SIGNAL \inst12|LPM_COUNTER_component|auto_generated|counter_comb_bita0~COUT\ : std_logic;
SIGNAL \inst12|LPM_COUNTER_component|auto_generated|counter_comb_bita1~combout\ : std_logic;
SIGNAL \inst12|LPM_COUNTER_component|auto_generated|counter_reg_bit1a[1]~0_combout\ : std_logic;
SIGNAL \inst20~combout\ : std_logic;
SIGNAL \inst19~combout\ : std_logic;
SIGNAL \inst21~regout\ : std_logic;
SIGNAL \Start_TX~combout\ : std_logic;
SIGNAL \inst14~0_combout\ : std_logic;
SIGNAL \inst14~regout\ : std_logic;
SIGNAL \inst18~0_combout\ : std_logic;
SIGNAL \clk~combout\ : std_logic;
SIGNAL \clk~clkctrl_outclk\ : std_logic;
SIGNAL \inst|LPM_MUX_component|auto_generated|result_node[0]~0_combout\ : std_logic;
SIGNAL \inst|LPM_MUX_component|auto_generated|result_node[0]~1_combout\ : std_logic;
SIGNAL \inst|LPM_MUX_component|auto_generated|result_node[1]~2_combout\ : std_logic;
SIGNAL \inst|LPM_MUX_component|auto_generated|result_node[1]~3_combout\ : std_logic;
SIGNAL \inst|LPM_MUX_component|auto_generated|result_node[2]~4_combout\ : std_logic;
SIGNAL \inst|LPM_MUX_component|auto_generated|result_node[2]~5_combout\ : std_logic;
SIGNAL \inst|LPM_MUX_component|auto_generated|result_node[3]~6_combout\ : std_logic;
SIGNAL \inst|LPM_MUX_component|auto_generated|result_node[3]~7_combout\ : std_logic;
SIGNAL \inst13|srom|rom_block|auto_generated|q_a\ : std_logic_vector(7 DOWNTO 0);
SIGNAL \Time~combout\ : std_logic_vector(15 DOWNTO 0);
SIGNAL \inst12|LPM_COUNTER_component|auto_generated|safe_q\ : std_logic_vector(1 DOWNTO 0);
SIGNAL \ALT_INV_RST~clkctrl_outclk\ : std_logic;

BEGIN

WR <= ww_WR;
ww_RST <= RST;
ww_Start_TX <= Start_TX;
ww_clk <= clk;
ww_TX_Ready <= TX_Ready;
End_TX <= ww_End_TX;
D_Out <= ww_D_Out;
\ww_Time\ <= \Time\;
ww_devoe <= devoe;
ww_devclrn <= devclrn;
ww_devpor <= devpor;

\inst13|srom|rom_block|auto_generated|ram_block1a0_PORTAADDR_bus\ <= (\inst|LPM_MUX_component|auto_generated|result_node[3]~7_combout\ & \inst|LPM_MUX_component|auto_generated|result_node[2]~5_combout\ & 
\inst|LPM_MUX_component|auto_generated|result_node[1]~3_combout\ & \inst|LPM_MUX_component|auto_generated|result_node[0]~1_combout\);

\inst13|srom|rom_block|auto_generated|q_a\(0) <= \inst13|srom|rom_block|auto_generated|ram_block1a0_PORTADATAOUT_bus\(0);
\inst13|srom|rom_block|auto_generated|q_a\(1) <= \inst13|srom|rom_block|auto_generated|ram_block1a0_PORTADATAOUT_bus\(1);
\inst13|srom|rom_block|auto_generated|q_a\(2) <= \inst13|srom|rom_block|auto_generated|ram_block1a0_PORTADATAOUT_bus\(2);
\inst13|srom|rom_block|auto_generated|q_a\(3) <= \inst13|srom|rom_block|auto_generated|ram_block1a0_PORTADATAOUT_bus\(3);
\inst13|srom|rom_block|auto_generated|q_a\(4) <= \inst13|srom|rom_block|auto_generated|ram_block1a0_PORTADATAOUT_bus\(4);
\inst13|srom|rom_block|auto_generated|q_a\(5) <= \inst13|srom|rom_block|auto_generated|ram_block1a0_PORTADATAOUT_bus\(5);
\inst13|srom|rom_block|auto_generated|q_a\(6) <= \inst13|srom|rom_block|auto_generated|ram_block1a0_PORTADATAOUT_bus\(6);
\inst13|srom|rom_block|auto_generated|q_a\(7) <= \inst13|srom|rom_block|auto_generated|ram_block1a0_PORTADATAOUT_bus\(7);

\RST~clkctrl_INCLK_bus\ <= (gnd & gnd & gnd & \RST~combout\);

\clk~clkctrl_INCLK_bus\ <= (gnd & gnd & gnd & \clk~combout\);
\ALT_INV_RST~clkctrl_outclk\ <= NOT \RST~clkctrl_outclk\;

-- Location: PIN_59,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\Time[8]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "input",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => GND,
	padio => \ww_Time\(8),
	combout => \Time~combout\(8));

-- Location: PIN_63,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\Time[4]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "input",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => GND,
	padio => \ww_Time\(4),
	combout => \Time~combout\(4));

-- Location: PIN_25,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\Time[5]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "input",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => GND,
	padio => \ww_Time\(5),
	combout => \Time~combout\(5));

-- Location: PIN_88,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\Time[9]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "input",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => GND,
	padio => \ww_Time\(9),
	combout => \Time~combout\(9));

-- Location: PIN_91,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\Time[10]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "input",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => GND,
	padio => \ww_Time\(10),
	combout => \Time~combout\(10));

-- Location: PIN_65,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\Time[6]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "input",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => GND,
	padio => \ww_Time\(6),
	combout => \Time~combout\(6));

-- Location: PIN_57,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\Time[7]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "input",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => GND,
	padio => \ww_Time\(7),
	combout => \Time~combout\(7));

-- Location: PIN_27,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\Time[11]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "input",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => GND,
	padio => \ww_Time\(11),
	combout => \Time~combout\(11));

-- Location: PIN_125,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\TX_Ready~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "input",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => GND,
	padio => ww_TX_Ready,
	combout => \TX_Ready~combout\);

-- Location: LCCOMB_X12_Y6_N2
\inst15~feeder\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst15~feeder_combout\ = \TX_Ready~combout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \TX_Ready~combout\,
	combout => \inst15~feeder_combout\);

-- Location: PIN_18,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\RST~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "input",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => GND,
	padio => ww_RST,
	combout => \RST~combout\);

-- Location: CLKCTRL_G1
\RST~clkctrl\ : cycloneii_clkctrl
-- pragma translate_off
GENERIC MAP (
	clock_type => "global clock",
	ena_register_mode => "none")
-- pragma translate_on
PORT MAP (
	inclk => \RST~clkctrl_INCLK_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	outclk => \RST~clkctrl_outclk\);

-- Location: LCFF_X12_Y6_N3
inst15 : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \inst15~feeder_combout\,
	aclr => \ALT_INV_RST~clkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \inst15~regout\);

-- Location: LCCOMB_X12_Y6_N22
\inst12|LPM_COUNTER_component|auto_generated|counter_comb_bita0\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst12|LPM_COUNTER_component|auto_generated|counter_comb_bita0~combout\ = \inst12|LPM_COUNTER_component|auto_generated|safe_q\(0) $ (VCC)
-- \inst12|LPM_COUNTER_component|auto_generated|counter_comb_bita0~COUT\ = CARRY(\inst12|LPM_COUNTER_component|auto_generated|safe_q\(0))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101010110101010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \inst12|LPM_COUNTER_component|auto_generated|safe_q\(0),
	datad => VCC,
	combout => \inst12|LPM_COUNTER_component|auto_generated|counter_comb_bita0~combout\,
	cout => \inst12|LPM_COUNTER_component|auto_generated|counter_comb_bita0~COUT\);

-- Location: LCCOMB_X13_Y6_N8
\~GND\ : cycloneii_lcell_comb
-- Equation(s):
-- \~GND~combout\ = GND

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	combout => \~GND~combout\);

-- Location: LCCOMB_X12_Y6_N24
\inst12|LPM_COUNTER_component|auto_generated|counter_comb_bita1\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst12|LPM_COUNTER_component|auto_generated|counter_comb_bita1~combout\ = \inst12|LPM_COUNTER_component|auto_generated|counter_comb_bita0~COUT\ $ (\inst12|LPM_COUNTER_component|auto_generated|safe_q\(1))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111111110000",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datad => \inst12|LPM_COUNTER_component|auto_generated|safe_q\(1),
	cin => \inst12|LPM_COUNTER_component|auto_generated|counter_comb_bita0~COUT\,
	combout => \inst12|LPM_COUNTER_component|auto_generated|counter_comb_bita1~combout\);

-- Location: LCCOMB_X12_Y6_N14
\inst12|LPM_COUNTER_component|auto_generated|counter_reg_bit1a[1]~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst12|LPM_COUNTER_component|auto_generated|counter_reg_bit1a[1]~0_combout\ = (\inst14~regout\ & ((\inst20~combout\) # ((\TX_Ready~combout\ & !\inst15~regout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000000100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \TX_Ready~combout\,
	datab => \inst15~regout\,
	datac => \inst14~regout\,
	datad => \inst20~combout\,
	combout => \inst12|LPM_COUNTER_component|auto_generated|counter_reg_bit1a[1]~0_combout\);

-- Location: LCFF_X12_Y6_N25
\inst12|LPM_COUNTER_component|auto_generated|counter_reg_bit1a[1]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \inst12|LPM_COUNTER_component|auto_generated|counter_comb_bita1~combout\,
	sdata => \~GND~combout\,
	sload => \inst20~combout\,
	ena => \inst12|LPM_COUNTER_component|auto_generated|counter_reg_bit1a[1]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \inst12|LPM_COUNTER_component|auto_generated|safe_q\(1));

-- Location: LCCOMB_X12_Y6_N0
inst20 : cycloneii_lcell_comb
-- Equation(s):
-- \inst20~combout\ = (\RST~combout\) # ((\inst12|LPM_COUNTER_component|auto_generated|safe_q\(1) & \inst12|LPM_COUNTER_component|auto_generated|safe_q\(0)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111110011001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \RST~combout\,
	datac => \inst12|LPM_COUNTER_component|auto_generated|safe_q\(1),
	datad => \inst12|LPM_COUNTER_component|auto_generated|safe_q\(0),
	combout => \inst20~combout\);

-- Location: LCFF_X12_Y6_N23
\inst12|LPM_COUNTER_component|auto_generated|counter_reg_bit1a[0]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \inst12|LPM_COUNTER_component|auto_generated|counter_comb_bita0~combout\,
	sdata => \~GND~combout\,
	sload => \inst20~combout\,
	ena => \inst12|LPM_COUNTER_component|auto_generated|counter_reg_bit1a[1]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \inst12|LPM_COUNTER_component|auto_generated|safe_q\(0));

-- Location: LCCOMB_X12_Y6_N18
inst19 : cycloneii_lcell_comb
-- Equation(s):
-- \inst19~combout\ = (\inst12|LPM_COUNTER_component|auto_generated|safe_q\(0) & \inst12|LPM_COUNTER_component|auto_generated|safe_q\(1))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \inst12|LPM_COUNTER_component|auto_generated|safe_q\(0),
	datad => \inst12|LPM_COUNTER_component|auto_generated|safe_q\(1),
	combout => \inst19~combout\);

-- Location: LCFF_X12_Y6_N19
inst21 : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \inst19~combout\,
	aclr => \ALT_INV_RST~clkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \inst21~regout\);

-- Location: PIN_129,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\Start_TX~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "input",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => GND,
	padio => ww_Start_TX,
	combout => \Start_TX~combout\);

-- Location: LCCOMB_X12_Y6_N16
\inst14~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst14~0_combout\ = (\inst14~regout\ & (!\inst21~regout\)) # (!\inst14~regout\ & ((\Start_TX~combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011111100110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \inst21~regout\,
	datac => \inst14~regout\,
	datad => \Start_TX~combout\,
	combout => \inst14~0_combout\);

-- Location: LCFF_X12_Y6_N17
inst14 : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \inst14~0_combout\,
	aclr => \ALT_INV_RST~clkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \inst14~regout\);

-- Location: LCCOMB_X12_Y6_N8
\inst18~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst18~0_combout\ = (!\inst15~regout\ & (\inst14~regout\ & \TX_Ready~combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \inst15~regout\,
	datac => \inst14~regout\,
	datad => \TX_Ready~combout\,
	combout => \inst18~0_combout\);

-- Location: PIN_17,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\clk~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "input",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => GND,
	padio => ww_clk,
	combout => \clk~combout\);

-- Location: CLKCTRL_G2
\clk~clkctrl\ : cycloneii_clkctrl
-- pragma translate_off
GENERIC MAP (
	clock_type => "global clock",
	ena_register_mode => "none")
-- pragma translate_on
PORT MAP (
	inclk => \clk~clkctrl_INCLK_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	outclk => \clk~clkctrl_outclk\);

-- Location: PIN_121,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\Time[0]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "input",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => GND,
	padio => \ww_Time\(0),
	combout => \Time~combout\(0));

-- Location: PIN_26,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\Time[12]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "input",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => GND,
	padio => \ww_Time\(12),
	combout => \Time~combout\(12));

-- Location: LCCOMB_X12_Y6_N12
\inst|LPM_MUX_component|auto_generated|result_node[0]~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst|LPM_MUX_component|auto_generated|result_node[0]~0_combout\ = (\inst12|LPM_COUNTER_component|auto_generated|safe_q\(1) & ((\Time~combout\(4)) # ((\inst12|LPM_COUNTER_component|auto_generated|safe_q\(0))))) # 
-- (!\inst12|LPM_COUNTER_component|auto_generated|safe_q\(1) & (((\Time~combout\(12) & !\inst12|LPM_COUNTER_component|auto_generated|safe_q\(0)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000010101100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Time~combout\(4),
	datab => \Time~combout\(12),
	datac => \inst12|LPM_COUNTER_component|auto_generated|safe_q\(1),
	datad => \inst12|LPM_COUNTER_component|auto_generated|safe_q\(0),
	combout => \inst|LPM_MUX_component|auto_generated|result_node[0]~0_combout\);

-- Location: LCCOMB_X12_Y6_N6
\inst|LPM_MUX_component|auto_generated|result_node[0]~1\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst|LPM_MUX_component|auto_generated|result_node[0]~1_combout\ = (\inst12|LPM_COUNTER_component|auto_generated|safe_q\(0) & ((\inst|LPM_MUX_component|auto_generated|result_node[0]~0_combout\ & ((\Time~combout\(0)))) # 
-- (!\inst|LPM_MUX_component|auto_generated|result_node[0]~0_combout\ & (\Time~combout\(8))))) # (!\inst12|LPM_COUNTER_component|auto_generated|safe_q\(0) & (((\inst|LPM_MUX_component|auto_generated|result_node[0]~0_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100111110100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Time~combout\(8),
	datab => \Time~combout\(0),
	datac => \inst12|LPM_COUNTER_component|auto_generated|safe_q\(0),
	datad => \inst|LPM_MUX_component|auto_generated|result_node[0]~0_combout\,
	combout => \inst|LPM_MUX_component|auto_generated|result_node[0]~1_combout\);

-- Location: PIN_90,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\Time[1]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "input",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => GND,
	padio => \ww_Time\(1),
	combout => \Time~combout\(1));

-- Location: PIN_89,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\Time[13]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "input",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => GND,
	padio => \ww_Time\(13),
	combout => \Time~combout\(13));

-- Location: LCCOMB_X12_Y6_N4
\inst|LPM_MUX_component|auto_generated|result_node[1]~2\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst|LPM_MUX_component|auto_generated|result_node[1]~2_combout\ = (\inst12|LPM_COUNTER_component|auto_generated|safe_q\(1) & (((\inst12|LPM_COUNTER_component|auto_generated|safe_q\(0))))) # (!\inst12|LPM_COUNTER_component|auto_generated|safe_q\(1) & 
-- ((\inst12|LPM_COUNTER_component|auto_generated|safe_q\(0) & (\Time~combout\(9))) # (!\inst12|LPM_COUNTER_component|auto_generated|safe_q\(0) & ((\Time~combout\(13))))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111101000001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Time~combout\(9),
	datab => \Time~combout\(13),
	datac => \inst12|LPM_COUNTER_component|auto_generated|safe_q\(1),
	datad => \inst12|LPM_COUNTER_component|auto_generated|safe_q\(0),
	combout => \inst|LPM_MUX_component|auto_generated|result_node[1]~2_combout\);

-- Location: LCCOMB_X12_Y6_N30
\inst|LPM_MUX_component|auto_generated|result_node[1]~3\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst|LPM_MUX_component|auto_generated|result_node[1]~3_combout\ = (\inst|LPM_MUX_component|auto_generated|result_node[1]~2_combout\ & (((\Time~combout\(1)) # (!\inst12|LPM_COUNTER_component|auto_generated|safe_q\(1))))) # 
-- (!\inst|LPM_MUX_component|auto_generated|result_node[1]~2_combout\ & (\Time~combout\(5) & ((\inst12|LPM_COUNTER_component|auto_generated|safe_q\(1)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100101011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Time~combout\(5),
	datab => \Time~combout\(1),
	datac => \inst|LPM_MUX_component|auto_generated|result_node[1]~2_combout\,
	datad => \inst12|LPM_COUNTER_component|auto_generated|safe_q\(1),
	combout => \inst|LPM_MUX_component|auto_generated|result_node[1]~3_combout\);

-- Location: PIN_60,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\Time[2]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "input",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => GND,
	padio => \ww_Time\(2),
	combout => \Time~combout\(2));

-- Location: PIN_24,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\Time[14]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "input",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => GND,
	padio => \ww_Time\(14),
	combout => \Time~combout\(14));

-- Location: LCCOMB_X12_Y6_N28
\inst|LPM_MUX_component|auto_generated|result_node[2]~4\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst|LPM_MUX_component|auto_generated|result_node[2]~4_combout\ = (\inst12|LPM_COUNTER_component|auto_generated|safe_q\(1) & ((\Time~combout\(6)) # ((\inst12|LPM_COUNTER_component|auto_generated|safe_q\(0))))) # 
-- (!\inst12|LPM_COUNTER_component|auto_generated|safe_q\(1) & (((\Time~combout\(14) & !\inst12|LPM_COUNTER_component|auto_generated|safe_q\(0)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000010101100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Time~combout\(6),
	datab => \Time~combout\(14),
	datac => \inst12|LPM_COUNTER_component|auto_generated|safe_q\(1),
	datad => \inst12|LPM_COUNTER_component|auto_generated|safe_q\(0),
	combout => \inst|LPM_MUX_component|auto_generated|result_node[2]~4_combout\);

-- Location: LCCOMB_X12_Y6_N26
\inst|LPM_MUX_component|auto_generated|result_node[2]~5\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst|LPM_MUX_component|auto_generated|result_node[2]~5_combout\ = (\inst12|LPM_COUNTER_component|auto_generated|safe_q\(0) & ((\inst|LPM_MUX_component|auto_generated|result_node[2]~4_combout\ & ((\Time~combout\(2)))) # 
-- (!\inst|LPM_MUX_component|auto_generated|result_node[2]~4_combout\ & (\Time~combout\(10))))) # (!\inst12|LPM_COUNTER_component|auto_generated|safe_q\(0) & (((\inst|LPM_MUX_component|auto_generated|result_node[2]~4_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100111110100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Time~combout\(10),
	datab => \Time~combout\(2),
	datac => \inst12|LPM_COUNTER_component|auto_generated|safe_q\(0),
	datad => \inst|LPM_MUX_component|auto_generated|result_node[2]~4_combout\,
	combout => \inst|LPM_MUX_component|auto_generated|result_node[2]~5_combout\);

-- Location: PIN_58,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\Time[3]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "input",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => GND,
	padio => \ww_Time\(3),
	combout => \Time~combout\(3));

-- Location: PIN_87,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\Time[15]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "input",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => GND,
	padio => \ww_Time\(15),
	combout => \Time~combout\(15));

-- Location: LCCOMB_X12_Y6_N20
\inst|LPM_MUX_component|auto_generated|result_node[3]~6\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst|LPM_MUX_component|auto_generated|result_node[3]~6_combout\ = (\inst12|LPM_COUNTER_component|auto_generated|safe_q\(1) & (((\inst12|LPM_COUNTER_component|auto_generated|safe_q\(0))))) # (!\inst12|LPM_COUNTER_component|auto_generated|safe_q\(1) & 
-- ((\inst12|LPM_COUNTER_component|auto_generated|safe_q\(0) & (\Time~combout\(11))) # (!\inst12|LPM_COUNTER_component|auto_generated|safe_q\(0) & ((\Time~combout\(15))))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111101000001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Time~combout\(11),
	datab => \Time~combout\(15),
	datac => \inst12|LPM_COUNTER_component|auto_generated|safe_q\(1),
	datad => \inst12|LPM_COUNTER_component|auto_generated|safe_q\(0),
	combout => \inst|LPM_MUX_component|auto_generated|result_node[3]~6_combout\);

-- Location: LCCOMB_X12_Y6_N10
\inst|LPM_MUX_component|auto_generated|result_node[3]~7\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst|LPM_MUX_component|auto_generated|result_node[3]~7_combout\ = (\inst|LPM_MUX_component|auto_generated|result_node[3]~6_combout\ & (((\Time~combout\(3)) # (!\inst12|LPM_COUNTER_component|auto_generated|safe_q\(1))))) # 
-- (!\inst|LPM_MUX_component|auto_generated|result_node[3]~6_combout\ & (\Time~combout\(7) & ((\inst12|LPM_COUNTER_component|auto_generated|safe_q\(1)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100101011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Time~combout\(7),
	datab => \Time~combout\(3),
	datac => \inst|LPM_MUX_component|auto_generated|result_node[3]~6_combout\,
	datad => \inst12|LPM_COUNTER_component|auto_generated|safe_q\(1),
	combout => \inst|LPM_MUX_component|auto_generated|result_node[3]~7_combout\);

-- Location: M4K_X11_Y6
\inst13|srom|rom_block|auto_generated|ram_block1a0\ : cycloneii_ram_block
-- pragma translate_off
GENERIC MAP (
	mem_init0 => X"46454443424139383736353433323130",
	data_interleave_offset_in_bits => 1,
	data_interleave_width_in_bits => 1,
	init_file => "C:/Users/crist/Documents/Quartus/Rilevatore Riflessi/HEX2ASCII.hex",
	init_file_layout => "port_a",
	logical_ram_name => "lpm_rom:inst13|altrom:srom|altsyncram:rom_block|altsyncram_0g51:auto_generated|ALTSYNCRAM",
	operation_mode => "rom",
	port_a_address_clear => "none",
	port_a_address_width => 4,
	port_a_byte_enable_clear => "none",
	port_a_byte_enable_clock => "none",
	port_a_data_in_clear => "none",
	port_a_data_out_clear => "none",
	port_a_data_out_clock => "none",
	port_a_data_width => 8,
	port_a_first_address => 0,
	port_a_first_bit_number => 0,
	port_a_last_address => 15,
	port_a_logical_ram_depth => 16,
	port_a_logical_ram_width => 8,
	port_a_write_enable_clear => "none",
	port_a_write_enable_clock => "none",
	port_b_address_width => 4,
	port_b_data_width => 8,
	ram_block_type => "M4K",
	safe_write => "err_on_2clk")
-- pragma translate_on
PORT MAP (
	clk0 => \clk~clkctrl_outclk\,
	portaaddr => \inst13|srom|rom_block|auto_generated|ram_block1a0_PORTAADDR_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	portadataout => \inst13|srom|rom_block|auto_generated|ram_block1a0_PORTADATAOUT_bus\);

-- Location: PIN_126,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\WR~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \inst18~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_WR);

-- Location: PIN_52,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\End_TX~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \inst19~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_End_TX);

-- Location: PIN_47,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\D_Out[7]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \inst13|srom|rom_block|auto_generated|q_a\(7),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_D_Out(7));

-- Location: PIN_53,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\D_Out[6]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \inst13|srom|rom_block|auto_generated|q_a\(6),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_D_Out(6));

-- Location: PIN_48,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\D_Out[5]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \inst13|srom|rom_block|auto_generated|q_a\(5),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_D_Out(5));

-- Location: PIN_51,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\D_Out[4]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \inst13|srom|rom_block|auto_generated|q_a\(4),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_D_Out(4));

-- Location: PIN_55,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\D_Out[3]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \inst13|srom|rom_block|auto_generated|q_a\(3),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_D_Out(3));

-- Location: PIN_134,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\D_Out[2]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \inst13|srom|rom_block|auto_generated|q_a\(2),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_D_Out(2));

-- Location: PIN_133,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\D_Out[1]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \inst13|srom|rom_block|auto_generated|q_a\(1),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_D_Out(1));

-- Location: PIN_132,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\D_Out[0]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \inst13|srom|rom_block|auto_generated|q_a\(0),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_D_Out(0));
END structure;


