
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity KeyExpansion is
    Port ( a  :in  STD_LOGIC_VECTOR (127 downto 0);
           Rcon  :  in  STD_LOGIC_VECTOR (7 downto 0);
           b  :  out  STD_LOGIC_VECTOR (127 downto 0));
end KeyExpansion;

architecture Behavioral of KeyExpansion is

signal w0,w1,w2,w3 : std_logic_vector(31 downto 0);
signal x0,x1,x2,x3: std_logic_vector(31 downto 0);
signal temp,Rcon_xor :std_logic_vector(31 downto 0);
signal  m,RotWord : std_logic_vector(31 downto 0);

component sbox is
port (a : in std_logic_vector(7 downto 0);
		y : out std_logic_vector(7 downto 0)); 
end component;
begin

  temp<=a(31 downto 24) & a(23 downto 16) & a(15 downto 8) & a(7 downto 0);
  w0<= a(127 downto 120) & a(119 downto 112) & a(111 downto 104) & a(103 downto 96) ;
  w1<=a(95 downto 88) & a(87 downto 80) & a(79 downto 72) & a(71 downto 64);
  w2<=a(63 downto 56) & a(55 downto 48) & a(47 downto 40) & a(39 downto 32);
  w3<=a(31 downto 24) & a(23 downto 16) & a(15 downto 8) & a(7 downto 0);


RotWord <= temp(23 downto 16)& temp(15 downto 8)&temp(7  downto 0)&temp(31 downto 24);

e1:sbox port map(RotWord(7  downto 0),m(7  downto 0));
e2:sbox port map(RotWord(15  downto 8),m(15  downto 8));
e3:sbox port map(RotWord(23  downto 16),m(23  downto 16));
e4:sbox port map(RotWord(31  downto 24),m(31  downto 24));

  Rcon_xor<= (m(31 downto 24) xor Rcon) & m(23  downto 16) & m(15  downto 8) & m(7  downto 0);


  x0<= (Rcon_xor(31 downto 24) xor  w0(31 downto 24)) & (Rcon_xor(23  downto 16) xor w0(23  downto 16)) & (Rcon_xor(15  downto 8) xor w0(15  downto 8)) & (Rcon_xor(7  downto 0) xor w0(7  downto 0));
  x1<= (x0(31 downto 24) xor w1(31 downto 24))& (x0(23  downto 16) xor w1(23  downto 16)) & (x0(15  downto 8) xor w1(15  downto 8))& (x0(7  downto 0) xor w1(7  downto 0)) ;
  x2<= (x1(31 downto 24) xor w2(31 downto 24)) & (x1(23  downto 16) xor w2(23  downto 16)) & (x1(15  downto 8) xor w2(15  downto 8)) & (x1(7  downto 0) xor  w2(7  downto 0)) ;
  x3<= (x2(31 downto 24) xor w3(31 downto 24)) & (x2(23  downto 16) xor w3(23  downto 16))&(x2(15  downto 8) xor w3(15  downto 8))& (x2(7  downto 0) xor w3(7  downto 0)) ;
  b<= x0 & x1 & x2 & x3;

end Behavioral;
