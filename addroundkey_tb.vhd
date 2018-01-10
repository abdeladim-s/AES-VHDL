LIBRARY ieee  ; 
library std;
USE ieee.NUMERIC_STD.all  ; 
USE ieee.std_logic_1164.all  ; 
USE ieee.STD_LOGIC_SIGNED.all  ; 
use std.textio.ALL;


ENTITY addroundkey_tb  IS 
END ; 
 
ARCHITECTURE addroundkey_tb_arch OF addroundkey_tb IS
  
  file file_in : text;
  file file_RESULTS : text;
  
  SIGNAL addroundkey_out   :  std_logic_vector (127 downto 0)  ; 
  SIGNAL Key   :  std_logic_vector (127 downto 0)  ; 
  SIGNAL Plaintext   :  std_logic_vector (127 downto 0)  ; 
  COMPONENT addroundkey  
    PORT ( 
      addroundkey_out  : out std_logic_vector (127 downto 0) ; 
      Key  : in std_logic_vector (127 downto 0) ; 
      Plaintext  : in std_logic_vector (127 downto 0) ); 
  END COMPONENT ; 
BEGIN
  DUT  : addroundkey  
    PORT MAP ( 
      addroundkey_out   => addroundkey_out  ,
      Key   => Key  ,
      Plaintext   => Plaintext   ) ; 
      
process

 
begin
	wait for 10 ns;
	Plaintext <= x"3243f6a8885a308d313198a2e0370734";
	key <= x"2b7e151628aed2a6abf7158809cf4f3c";
	wait for 10 ns;
	
end process;


END ; 

