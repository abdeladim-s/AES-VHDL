-- Abdeladim SADIKI
-- INPT
-- 01/10/2018
----------------------------------------------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;



entity shiftrows is
port ( a : in  STD_LOGIC_VECTOR (127 downto 0);
       c : out STD_LOGIC_VECTOR (127 downto 0));
end shiftrows;

architecture Behavioral of shiftrows is
  
   ---------------------                --------------------- 
-- s0  | s4  | s8  | s12             -- s0  | s4  | s8  | s12
   ---------------------                ---------------------
-- s1  | s5  | s9  | s13             -- s5  | s9  | s13 | s1
   --------------------- ==========>    --------------------- 
-- s2  | s6  | s10 | s14             -- s10 | s14 | s2  | s6
   ---------------------                ---------------------
-- s3 |  s7  | s11 | s15             -- s15 |  s3  | s7 | s11
   ---------------------                ---------------------
signal s0,s1,s2,s3,s4,s5,s6,s7,s8,s9,s10,s11,s12,s13,s14,s15:std_logic_vector(7 downto 0);
begin
 s15<=a(7 downto 0);	 
 s11<=a(39 downto 32);		 
 s7<=a(71 downto 64);		 
 s3<=a(103 downto 96);	
	 
 s14<=a(15 downto 8);
 s10<=a(47 downto 40);
 s6<=a(79 downto 72);	
 s2<=a(111 downto 104);
	
 s13<=a(23 downto 16);	
 s9<=a(55 downto 48);	
 s5<=a(87 downto 80);	
 s1<=a(119 downto 112);	

 s12<=a(31 downto 24);	
 s8<=a(63 downto 56);	
 s4<=a(95 downto 88);	
 s0<=a(127 downto 120);	

C<=s0&s5&s10&s15&s4&s9&s14&s3&s8&s13&s2&s7&s12&s1&s6&s11;	

end Behavioral;