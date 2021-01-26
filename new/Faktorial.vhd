library IEEE; use IEEE.STD_LOGIC_1164.ALL; 
use IEEE.NUMERIC_STD.ALL; 
use IEEE.math_real.all;

entity Faktorial is 
port(
	POW1		: IN STD_LOGIC_VECTOR(7 downto 0);
	POW2		: IN STD_LOGIC_VECTOR(7 downto 0);
	CLOCK		: IN STD_LOGIC;
	ResultPOW	: out STD_LOGIC_VECTOR(15 downto 0) );
end Faktorial;

architecture behave of Faktorial is 
Signal tempresult : STD_LOGIC_VECTOR (31 downto 0) 	:= "00000000000000000000000000000000";
Signal COMPARE		: STD_LOGIC_VECTOR(15 down to 0) 	:= "0000000000000000";
SIGNAL TEMP 		: STD_LOGIC_VECTOR(15 down to 0) 	:= "0000000000000000";

begin;

TEMP(7 downto 0) <= POW1;
	Process(POW2, CLOCK)
	BEGIN;
	IF(CLOCK'EVENT AND CLOCK = '1') THEN
		IF COMPARE <= FACT1 THEN
		TEMPRESULT <= TEMPRESULT(15 downto 0)*("00000000"&POW1);
		COMPARE <= COMPARE + '1';
		END IF;
		END IF;
end process;

RESULTPOW <= TEMPRESULT(15 downto 0);


end behave;