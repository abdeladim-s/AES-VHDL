-- mixcolumn pour entrâiner la diffusion dans le chiffrement.

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity mixcolumn is
Port ( a : in  STD_LOGIC_VECTOR (127 downto 0);
       mixout : out  STD_LOGIC_VECTOR (127 downto 0));
end mixcolumn;

	architecture Behavioral of mixcolumn is
	  
   ---------------------    -------------            --------------------- 
-- s0  | s4  | s8  | s12    2 | 3 | 1 | 1            p0  | p4  | p8  | p12
   ---------------------    -------------            ---------------------
-- s1  | s5  | s9  | s13    1 | 2 | 3 | 1            p1  | p5  | p9  | p13
   --------------------- X  -------------  ====>     --------------------- 
-- s2  | s6  | s10 | s14    1 | 1 | 2 | 3            p2  | p6  | p10 | p14
   ---------------------    -------------            ---------------------
-- s3 |  s7  | s11 | s15    3 | 1 | 1 | 2            p3  |  p7 | p11 | p15
   ---------------------    -------------            ---------------------
   
signal p0,p1,p2,p3,p4,p5,p6,p7,p8,p9,p10,p11,p12,p13,p14,p15:std_logic_vector(7 downto 0);

component mixcolumnOneByte is
    Port ( i1,i2,i3,i4: in STD_LOGIC_VECTOR (7 downto 0);
           data_out : out  STD_LOGIC_VECTOR (7 downto 0));
end component;
 
begin

z1:mixcolumnOneByte port map(a(127 downto 120),a(119 downto 112),a(111 downto 104),a(103 downto 96),p0);
z2:mixcolumnOneByte port map(a(119 downto 112),a(111 downto 104),a(103 downto 96),a(127 downto 120),p1);
z3:mixcolumnOneByte port map(a(111 downto 104),a(103 downto 96),a(127 downto 120),a(119 downto 112),p2);
z4:mixcolumnOneByte port map(a(103 downto 96),a(127 downto 120),a(119 downto 112),a(111 downto 104),p3);

z5:mixcolumnOneByte port map(a(95 downto 88),a(87 downto 80),a(79 downto 72),a(71 downto 64),p4);
z6:mixcolumnOneByte port map(a(87 downto 80),a(79 downto 72),a(71 downto 64),a(95 downto 88),p5);
z7:mixcolumnOneByte port map(a(79 downto 72),a(71 downto 64),a(95 downto 88),a(87 downto 80),p6);
z8:mixcolumnOneByte port map(a(71 downto 64),a(95 downto 88),a(87 downto 80),a(79 downto 72),p7);

z9:mixcolumnOneByte port map(a(63 downto 56),a(55 downto 48),a(47 downto 40),a(39 downto 32),p8);
z10:mixcolumnOneByte port map(a(55 downto 48),a(47 downto 40),a(39 downto 32),a(63 downto 56),p9);
z11:mixcolumnOneByte port map(a(47 downto 40),a(39 downto 32),a(63 downto 56),a(55 downto 48),p10);
z12:mixcolumnOneByte port map(a(39 downto 32),a(63 downto 56),a(55 downto 48),a(47 downto 40),p11);

z13:mixcolumnOneByte port map(a(31 downto 24),a(23 downto 16),a(15 downto 8),a(7 downto 0),p12);
z14:mixcolumnOneByte port map(a(23 downto 16),a(15 downto 8),a(7 downto 0),a(31 downto 24),p13);
z15:mixcolumnOneByte port map(a(15 downto 8),a(7 downto 0),a(31 downto 24),a(23 downto 16),p14);
z16:mixcolumnOneByte port map(a(7 downto 0),a(31 downto 24),a(23 downto 16),a(15 downto 8),p15);

-- mixout est le vecteur de sortie.

mixout <=  p0&p1&p2&p3&p4&p5&p6&p7&p8&p9&p10&p11&p12&p13&p14&p15;

end Behavioral;