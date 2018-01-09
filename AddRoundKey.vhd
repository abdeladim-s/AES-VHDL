-- AddRoundKey : initial round

Library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity addroundkey is
  port( Plaintext : in std_logic_vector(127 downto 0);
        Key       : in std_logic_vector(127 downto 0);
        addroundkey_out : out std_logic_vector(127 downto 0));
        
end addroundkey;

architecture addroundkey_archi of addroundkey is
begin
  addroundkey_out <= Plaintext xor Key;
end addroundkey_archi;