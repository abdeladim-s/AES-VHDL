
-- SubBytes pour la substitution des octets.

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity subbytes is
port ( subbytes_in : in std_logic_vector (127 downto 0);
       subbytes_out : out std_logic_vector (127 downto 0));
end subbytes;

architecture Behavioral of subbytes is

-- ce component nous permet d'accéder au valeur de sbox.

component sbox is
port (a : in std_logic_vector(7 downto 0);
	  y : out std_logic_vector(7 downto 0)); 
end component;

begin

-- subbytes nous permet de remplacer les octets de notre matrix d'état par celle de un octets de sbox.
-- par exemple :
    -----------------               -----------------
--  00 | 12 | 0C | 08   SubByte     63 | C9 | FE | 30
    -----------------               -----------------
--  04 | 04 | 00 | 23  =========>   F2 | F2 | 63 | 26
    -----------------               -----------------
--  12 | 12 | 13 | 19               C9 | C9 | 7D | D4
    -----------------               -----------------
--  14 | 00 | 11 | 19               FA | 63 | 82 | D4
    -----------------               -----------------

sbox01 : sbox port map (subbytes_in(127 downto 120),subbytes_out(127 downto 120)); 
sbox02 : sbox port map (subbytes_in(119 downto 112),subbytes_out(119 downto 112)); 
sbox03 : sbox port map (subbytes_in(111 downto 104),subbytes_out(111 downto 104)); 
sbox04 : sbox port map (subbytes_in(103 downto 96),subbytes_out(103 downto 96)); 
sbox05 : sbox port map (subbytes_in(95 downto 88),subbytes_out(95 downto 88)); 
sbox06 : sbox port map (subbytes_in(87 downto 80),subbytes_out(87 downto 80)); 
sbox07 : sbox port map (subbytes_in(79 downto 72),subbytes_out(79 downto 72)); 
sbox08 : sbox port map (subbytes_in(71 downto 64),subbytes_out(71 downto 64)); 
sbox09 : sbox port map (subbytes_in(63 downto 56),subbytes_out(63 downto 56)); 
sbox10 : sbox port map (subbytes_in(55 downto 48),subbytes_out(55 downto 48)); 
sbox11 : sbox port map (subbytes_in(47 downto 40),subbytes_out(47 downto 40)); 
sbox12 : sbox port map (subbytes_in(39 downto 32),subbytes_out(39 downto 32)); 
sbox13 : sbox port map (subbytes_in(31 downto 24),subbytes_out(31 downto 24)); 
sbox14 : sbox port map (subbytes_in(23 downto 16),subbytes_out(23 downto 16)); 
sbox15 : sbox port map (subbytes_in(15 downto 8),subbytes_out(15 downto 8)); 
sbox16 : sbox port map (subbytes_in(7 downto 0),subbytes_out(7 downto 0)); 

end Behavioral;
