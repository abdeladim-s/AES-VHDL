LIBRARY ieee  ; 
USE ieee.std_logic_1164.all  ; 
ENTITY aes_tb  IS 
END ; 
 
ARCHITECTURE aes_tb_arch OF aes_tb IS
  SIGNAL Ciphertext   :  std_logic_vector (127 downto 0)  ; 
  SIGNAL Key   :  std_logic_vector (127 downto 0)  ; 
  SIGNAL Plaintext   :  std_logic_vector (127 downto 0)  ; 
  COMPONENT AES  
    PORT ( 
      Ciphertext  : out std_logic_vector (127 downto 0) ; 
      Key  : in std_logic_vector (127 downto 0) ; 
      Plaintext  : in std_logic_vector (127 downto 0) ); 
  END COMPONENT ; 
BEGIN
  DUT  : AES  
    PORT MAP ( 
      Ciphertext   => Ciphertext  ,
      Key   => Key  ,
      Plaintext   => Plaintext   ) ; 
      
      
process
  begin
    wait for 10 ns;
     Plaintext <= x"ab002540c275dfe77335817312ffb855";
     Key       <= x"912345705049aab975cdffe050aade44";
     wait for 10 ns;
   end process;
END ; 

