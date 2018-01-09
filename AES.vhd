----------------------------------------------------------------------------------
-- National Institute of Posts and Telecommunications: 
-- student Engineer: Abdeladim SADIKI
-- 
-- Create Date:    21:47 09/01/2018 
-- Module Name:    AES - Behavioral 
-- Project Name:   AES Algorithm
-- Description:    A VHDL implementation of The AES algorithm

-- Revision:       1.0
-- Additional Comments: In collaboration with Mohamed ZELMAD
-- Suppervised by : Dr. BOUSSELAM KAOUTHAR
----------------------------------------------------------------------------------

Library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity AES is
  port( Plaintext : in std_logic_vector(127 downto 0);
        Key       : in std_logic_vector(127 downto 0);
        Ciphertext: out std_logic_vector(127 downto 0));
        
end AES;

architecture AES_archi of AES is
begin
end AES_archi;