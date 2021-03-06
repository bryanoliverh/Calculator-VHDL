library IEEE; use IEEE.STD_LOGIC_1164.ALL; 
use IEEE.NUMERIC_STD.ALL; 
use IEEE.math_real.all;

entity div is 
port(
	DIV1		: IN STD_LOGIC_VECTOR(7 downto 0);
	DIV2		: IN STD_LOGIC_VECTOR(7 downto 0);
	ResultDiv		: out STD_LOGIC_VECTOR(7 downto 0) );
end div;

architecture behave of div is 
begin

ResultDiv <= STD_LOGIC_VECTOR(TO_Unsigned(TO_Integer(Unsigned(DIV1) / Unsigned (DIV2)),8));


end behave;