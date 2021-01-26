library IEEE; use IEEE.STD_LOGIC_1164.ALL; 
use IEEE.NUMERIC_STD.ALL; 
use IEEE.math_real.all;

entity Faktorial is 
port(
function  sqrt  ( d : UNSIGNED ) return UNSIGNED is
variable a : unsigned(31 downto 0):=d;  --original input.
variable q : unsigned(15 downto 0):=(others => '0');  --result.
variable left,right,r : unsigned(17 downto 0):=(others => '0');  --input to adder/sub.r-remainder.
variable i : integer:=0;
end Faktorial;
begin
for i in 0 to 15 loop
right(0):='1';
right(1):=r(17);
right(17 downto 2):=q;
left(1 downto 0):=a(31 downto 30);
left(17 downto 2):=r(15 downto 0);
a(31 downto 2):=a(29 downto 0);  --shifting by 2 bit.
if ( r(17) = '1') then
r := left + right;
else
r := left - right;
end if;
q(15 downto 1) := q(14 downto 0);
q(0) := not r(17);
end loop;
return q;

end sqrt;
