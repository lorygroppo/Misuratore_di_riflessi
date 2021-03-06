LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_signed.all;

ENTITY FSM_dec_command IS
PORT(		
		CK,DAV,L_correct,Detect_1,Detect_2,Detect_3,Detect_4,RESETn,END_TX: IN std_logic;
		RD,EN_COUNT_T,Clear_reg,En_reg: OUT std_logic;
		SEL_LED: OUT std_logic_vector(1 downto 0));
END FSM_dec_command;

ARCHITECTURE Behavioural OF FSM_dec_command IS

TYPE state IS (Reset, Wait_L, Wait_led, L_command, Led_command,Decode_command,Led_1,Led_2,Led_3,Led_4);
SIGNAL present_state, next_state : state;

BEGIN
PROCESS(CK,RESETn)
BEGIN
	IF(RESETn = '0') THEN
		present_state <= Reset;
	ELSIF (CK'event AND CK='1') THEN
		present_state <= next_state;	
	END IF;
END PROCESS;

PROCESS(present_state,DAV,L_correct,Detect_1,Detect_2,Detect_3,Detect_4,END_TX)
BEGIN
CASE present_state IS

	WHEN Reset => 
		Clear_reg <= '1';
		RD <= '0';
		En_reg <= '1';
		EN_COUNT_T <= '0';
		SEL_LED <= "00";
		
		next_state <= Wait_L;
		
	WHEN Wait_L => 
		Clear_reg <= '0';
		RD <= '0';
		En_reg <= '0';
		EN_COUNT_T <= '0';
		SEL_LED <= "00";
		
		IF (DAV = '1') THEN
		next_state <= L_command;
		ELSE
		next_state <= Wait_L;
		END IF;	
	WHEN L_command => 
		Clear_reg <= '0';
		RD <= '1';
		En_reg <= '1';
		EN_COUNT_T <= '0';
		SEL_LED <= "00";	
		
		next_state <= Wait_led;
	WHEN Wait_led => 
		Clear_reg <= '0';
		RD <= '0';
		En_reg <= '0';
		EN_COUNT_T <= '0';
		SEL_LED <= "00";	
		
		IF (DAV = '1') THEN
		next_state <= Led_command;
		ELSE
		next_state <= Wait_led;
		END IF;
	WHEN Led_command => 
		Clear_reg <= '0';
		RD <= '1';
		En_reg <= '1';
		EN_COUNT_T <= '0';
		SEL_LED <= "00";	
		
		next_state <= Decode_command;
	WHEN Decode_command => 
		Clear_reg <= '0';
		RD <= '1';
		En_reg <= '0';
		EN_COUNT_T <= '0';
		SEL_LED <= "00";	
		
		IF (L_correct = '1') THEN
			IF(Detect_1 = '1') THEN
				next_state <= Led_1;
			ELSIF(Detect_2 = '1') THEN
				next_state <= Led_2;
			ELSIF(Detect_3 = '1') THEN
				next_state <= Led_3;
			ELSIF(Detect_4 = '1') THEN
				next_state <= Led_4;
			END IF;
		ELSE
		next_state <= reset;
		END IF;
	WHEN Led_1 =>
		Clear_reg <= '0';
		RD <= '1';
		En_reg <= '0';
		EN_COUNT_T <= '1';
		SEL_LED <= "00";
		
		IF (END_TX = '1') THEN
		next_state <= reset;
		ELSE
		next_state <= Led_1;
		END IF;
	WHEN Led_2 =>
		Clear_reg <= '0';
		RD <= '1';
		En_reg <= '0';
		EN_COUNT_T <= '1';
		SEL_LED <= "01";
		
		IF (END_TX = '1') THEN
		next_state <= reset;
		ELSE
		next_state <= Led_2;
		END IF;
	WHEN Led_3 =>
		Clear_reg <= '0';
		RD <= '1';
		En_reg <= '0';
		EN_COUNT_T <= '1';
		SEL_LED <= "10";
		
		IF (END_TX = '1') THEN
		next_state <= reset;
		ELSE
		next_state <= Led_3;
		END IF;
	WHEN Led_4 =>
		Clear_reg <= '0';
		RD <= '1';
		En_reg <= '0';
		EN_COUNT_T <= '1';
		SEL_LED <= "11";
		
		IF (END_TX = '1') THEN
		next_state <= reset;
		ELSE
		next_state <= Led_4;
		END IF;
	END CASE;
		
END PROCESS;
END Behavioural;