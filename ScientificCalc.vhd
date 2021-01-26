LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.NUMERIC_STD.ALL;

ENTITY ScientificCalc IS
GENERIC ( N : NATURAL := 2);
PORT
(   CLK        : IN STD_LOGIC;
    A           : INOUT INTEGER RANGE 0 TO 100;
    B        	 : INOUT INTEGER RANGE 0 TO 100;
    SUM       	  : OUT INTEGER RANGE 0 TO 999999;
	 SUM2    	   : OUT INTEGER RANGE 0 TO 999999;
    MODE        : IN INTEGER RANGE 0 TO 7);
	 Selector        : IN INTEGER RANGE 0 TO 8);
END ScientificCalc;

ARCHITECTURE HASIL OF ScientificCalc IS
SIGNAL TEMPADD        		 : INTEGER;
SIGNAL TEMPSUB       		 : INTEGER;
SIGNAL TEMPMUL       		 : INTEGER;
SIGNAL TEMPDIV       		 : INTEGER;
SIGNAL TEMPROOT      		 : INTEGER;
SIGNAL TEMPROOT2     		 : INTEGER :=11;
SIGNAL TEMPPOW       		 : INTEGER;
SIGNAL MS_to_KMH   			 : INTEGER;

SIGNAL Celcius_to_Kelvin    : INTEGER;
SIGNAL Celcius_to_Reaumur   : INTEGER;
SIGNAL Celcius_to_Farenh    : INTEGER;
SIGNAL Hour_to_Second	    : INTEGER;
SIGNAL Distance			    : INTEGER;
SIGNAL Debit				    : INTEGER;
SIGNAL Volt				    : INTEGER;

signal Pecahan_bulat			 : INTEGER;
signal Pecahan_koma			 : INTEGER;
signal SqrtRoot				 : INTEGER :=10;



BEGIN
PROCESS (CLK,MODE)
BEGIN 
IF(RISING_EDGE(CLK)) THEN 
    CASE MODE IS
        WHEN 0 =>
					A	<=0;
					B <=0;
					SUM<=0;
					SUM2<=0;
					TEMPADD<= 0;TEMPSUB<= 0;TEMPMUL<= 0;TEMPDIV<= 0;TEMPROOT<= 0;TEMPROOT2<= 0;   		 
					TEMPPOW<= 0;Pecahan_bulat<= 0;Pecahan_koma<= 0;Pecahan_koma<= 0;SqrtRoot	<= 0;			    
					TEMPROOT2 <= 11;
					SqrtRoot	<= 10;
		  WHEN 1 => TEMPADD <= A + B; --add
						SUM <= TEMPADD;
        WHEN 2 => TEMPSUB <= A - B; --sub
						SUM <= TEMPSUB;
        WHEN 3 => TEMPMUL <= A * B; --mul
						SUM <= TEMPMUL;
        WHEN 4 => TEMPDIV <= A / B; --div
						SUM <= TEMPDIV;
        WHEN 5 => Pecahan_bulat  <= A / B;	
							Pecahan_koma <= ((A - (B*Pecahan_bulat)) * 10) / B;
							SUM <= Pecahan_bulat;	--store pecahan angka bulat
							SUM2 <= Pecahan_koma;	--pecahan angka blakang koma
		
		  When 6  	 =>  TEMPPOW <= A ** N; --pow
						SUM <= TEMPPOW;
		  when 7 =>
						for i in 1 to 10 loop		--akar dari A
						
						TempRoot <= SqrtRoot**N;
					if TempRoot = A then
								SUM<= TempRoot2;
								exit;
					elsif TempRoot < A then	
							SUM<= TempRoot2;	
							
					exit;
					end if;
							TempRoot2<=TempRoot2-1;
							SqrtRoot<=SqrtRoot-1;
			end loop;
			
			
						for i in 1 to 10 loop		--akar dari B
						
						TempRoot <= SqrtRoot**N;
					if TempRoot = B then
								SUM<= TempRoot2;
								exit;
					elsif TempRoot < B then	
							SUM2<= TempRoot2;	
							
					exit;
					end if;
							TempRoot2<=TempRoot2-1;
							SqrtRoot<=SqrtRoot-1;
			end loop;
			
			END CASE;
			END IF;
			
			
			
			
			
	IF(RISING_EDGE(CLK)) THEN 
    CASE Selector IS
        WHEN 0 =>
					A	<=0;
					B <=0;
					SUM<=0;
					SUM2<=0;
					MS_to_KMH <= 0;Celcius_to_Kelvin <= 0;Celcius_to_Reaumur<= 0; 			 
					Celcius_to_Farenh <= 0;Hour_to_Second	<= 0;Distance	<= 0;Debit<= 0; 	    
					Volt<= 0;	
			when 1 => MS_to_KMH <= ((A *18)/5);
						 SUM <= MS_to_KMH;
			
			when 2=> Celcius_to_Kelvin <= (A + 273);
						 SUM <= Celcius_to_Kelvin;
			
			when 3=> Celcius_to_Reaumur <= ((A*4)/5);
						 SUM <= Celcius_to_Reaumur;
			
			when 4=> Celcius_to_Farenh  <= (((A *9)/5)+32);
						 SUM <= Celcius_to_Farenh;
			when 5=> Hour_to_Second  <= (A *3600);
						 SUM <= Hour_to_Second;
				
			when 6=> Distance  <= (A *B);--Speed* time 
						 SUM <= Distance;--A=speed, B=time
						 
			when 7=> Debit  <= (A /B); --Volume/Time
						 SUM <= Debit;
			when 8=> Volt <= (A*B);--Volt= I * R
						 SUM <= Volt;
				
    END CASE;
    END IF;
END PROCESS;
END HASIL;