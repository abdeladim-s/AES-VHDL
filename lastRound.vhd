library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity lastRound is
Port ( lastRound_in : in  STD_LOGIC_VECTOR (127 downto 0);
       key         : in  STD_LOGIC_VECTOR (127 downto 0);
		   Rcon        : in  std_logic_vector(7 downto 0);
       lastRound_out: out STD_LOGIC_VECTOR (127 downto 0));
end lastRound;

architecture Behavioral of lastRound is

component subbytes is
   port ( subbytes_in : in std_logic_vector (127 downto 0);
          subbytes_out : out std_logic_vector (127 downto 0));
end component;

component shiftrows is
    Port ( a : in  STD_LOGIC_VECTOR (127 downto 0);
           c : out  STD_LOGIC_VECTOR (127 downto 0));
end component;

component KeyExpansion is
Port (     a     :  in  STD_LOGIC_VECTOR (127 downto 0);
           Rcon  :  in  STD_LOGIC_VECTOR (7 downto 0);
           b     :  out  STD_LOGIC_VECTOR (127 downto 0));
end component;

component addroundkey is
  port( addroundkey_in : in std_logic_vector(127 downto 0);
        Key       : in std_logic_vector(127 downto 0);
        addroundkey_out : out std_logic_vector(127 downto 0));
end component;

signal subout,shiftout,keyout:std_logic_vector(127 downto 0);
begin

q1:subbytes port map(lastRound_in,subout);
	
q2:shiftrows  port map(subout,shiftout);
  
q3: KeyExpansion port map (key,Rcon,keyout);
  
q4: addroundkey port map (shiftout,keyout, lastRound_out);

end Behavioral;
