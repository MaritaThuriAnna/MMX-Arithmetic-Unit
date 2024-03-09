--ripple carry adder
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
    
entity ripple_carry_adder_padd is
        generic (
            DATA_WIDTH : integer := 64
        );
        Port (
            A, B    : in  std_logic_vector(DATA_WIDTH-1 downto 0);
            Cin     : in  std_logic;
            S       : out std_logic_vector(DATA_WIDTH-1 downto 0);
            Cout    : out std_logic
        );
end ripple_carry_adder_padd;
    
architecture Behavioral of ripple_carry_adder_padd is
    
    component full_adder_padd
        Port (A, B, Cin : in std_logic; 
              S, Cout : out std_logic);
    end component;
    
    signal c1, c2, c3, c4, c5, c6, c7, c8 : std_logic;
    signal carry : std_logic_vector(DATA_WIDTH - 1  downto 0);
    signal Cout_internal : std_logic;
    
begin
    carry(0) <= Cin;
    
    fa0: full_adder_padd port map(A => A(0), 
                                  B => B(0), 
                                  Cin => carry(0), 
                                  S => S(0), 
                                  Cout => carry(1)); 
                                  
    fa_S: for i in 1 to (DATA_WIDTH-2) generate
    uut: full_adder_padd port map(A => A(i), 
                                  B => B(i), 
                                  Cin => carry(i), 
                                  S => S(i), 
                                  Cout => carry(i+1));
    end generate;
    
    fa63: full_adder_padd port map(A => A(DATA_WIDTH-1), 
                                   B => B(DATA_WIDTH-1), 
                                   Cin => carry(DATA_WIDTH-1), 
                                   S => S(DATA_WIDTH-1), 
                                   Cout => Cout); 
    Cout <= Cout_internal;
    
--    carry(0) <= Cin;

--    fa0: full_adder_padd port map(A => A(0), B => B(0), Cin => carry(0), S => S(0), Cout => carry(1));
--    fa1: full_adder_padd port map(A => A(1), B => B(1), Cin => carry(1), S => S(1), Cout => carry(2));
--    fa2: full_adder_padd port map(A => A(2), B => B(2), Cin => carry(2), S => S(2), Cout => carry(3));
--    fa3: full_adder_padd port map(A => A(3), B => B(3), Cin => carry(3), S => S(3), Cout => carry(4));
--    fa4: full_adder_padd port map(A => A(4), B => B(4), Cin => carry(4), S => S(4), Cout => carry(5));
--    fa5: full_adder_padd port map(A => A(5), B => B(5), Cin => carry(5), S => S(5), Cout => carry(6));
--    fa6: full_adder_padd port map(A => A(6), B => B(6), Cin => carry(6), S => S(6), Cout => carry(7));
--    fa7: full_adder_padd port map(A => A(7), B => B(7), Cin => carry(7), S => S(7), Cout => carry(8));
--    fa8: full_adder_padd port map(A => A(8), B => B(8), Cin => carry(8), S => S(8), Cout => carry(9));
--    fa9: full_adder_padd port map(A => A(9), B => B(9), Cin => carry(9), S => S(9), Cout => carry(10));
--    fa10: full_adder_padd port map(A => A(10), B => B(10), Cin => carry(10), S => S(10), Cout => carry(11));
--    fa11: full_adder_padd port map(A => A(11), B => B(11), Cin => carry(11), S => S(11), Cout => carry(12));
--    fa12: full_adder_padd port map(A => A(12), B => B(12), Cin => carry(12), S => S(12), Cout => carry(13));
--    fa13: full_adder_padd port map(A => A(13), B => B(13), Cin => carry(13), S => S(13), Cout => carry(14));
--    fa14: full_adder_padd port map(A => A(14), B => B(14), Cin => carry(14), S => S(14), Cout => carry(15));
--    fa15: full_adder_padd port map(A => A(15), B => B(15), Cin => carry(15), S => S(15), Cout => carry(16));
--    fa16: full_adder_padd port map(A => A(16), B => B(16), Cin => carry(16), S => S(16), Cout => carry(17));
--    fa17: full_adder_padd port map(A => A(17), B => B(17), Cin => carry(17), S => S(17), Cout => carry(18));
--    fa18: full_adder_padd port map(A => A(18), B => B(18), Cin => carry(18), S => S(18), Cout => carry(19));
--    fa19: full_adder_padd port map(A => A(19), B => B(19), Cin => carry(19), S => S(19), Cout => carry(20));
--    fa20: full_adder_padd port map(A => A(20), B => B(20), Cin => carry(20), S => S(20), Cout => carry(21));
--    fa21: full_adder_padd port map(A => A(21), B => B(21), Cin => carry(21), S => S(21), Cout => carry(22));
--    fa22: full_adder_padd port map(A => A(22), B => B(22), Cin => carry(22), S => S(22), Cout => carry(23));
--    fa23: full_adder_padd port map(A => A(23), B => B(23), Cin => carry(23), S => S(23), Cout => carry(24));
--    fa24: full_adder_padd port map(A => A(24), B => B(24), Cin => carry(24), S => S(24), Cout => carry(25));
--    fa25: full_adder_padd port map(A => A(25), B => B(25), Cin => carry(25), S => S(25), Cout => carry(26));
--    fa26: full_adder_padd port map(A => A(26), B => B(26), Cin => carry(26), S => S(26), Cout => carry(27));
--    fa27: full_adder_padd port map(A => A(27), B => B(27), Cin => carry(27), S => S(27), Cout => carry(28));
--    fa28: full_adder_padd port map(A => A(28), B => B(28), Cin => carry(28), S => S(28), Cout => carry(29));
--    fa29: full_adder_padd port map(A => A(29), B => B(29), Cin => carry(29), S => S(29), Cout => carry(30));
--    fa30: full_adder_padd port map(A => A(30), B => B(30), Cin => carry(30), S => S(30), Cout => carry(31));
--    fa31: full_adder_padd port map(A => A(31), B => B(31), Cin => carry(31), S => S(31), Cout => carry(32));
--    fa32: full_adder_padd port map(A => A(32), B => B(32), Cin => carry(32), S => S(32), Cout => carry(33));
--    fa33: full_adder_padd port map(A => A(33), B => B(33), Cin => carry(33), S => S(33), Cout => carry(34));
--    fa34: full_adder_padd port map(A => A(34), B => B(34), Cin => carry(34), S => S(34), Cout => carry(35));
--    fa35: full_adder_padd port map(A => A(35), B => B(35), Cin => carry(35), S => S(35), Cout => carry(36));
--    fa36: full_adder_padd port map(A => A(36), B => B(36), Cin => carry(36), S => S(36), Cout => carry(37));
--    fa37: full_adder_padd port map(A => A(37), B => B(37), Cin => carry(37), S => S(37), Cout => carry(38));
--    fa38: full_adder_padd port map(A => A(38), B => B(38), Cin => carry(38), S => S(38), Cout => carry(39));
--    fa39: full_adder_padd port map(A => A(39), B => B(39), Cin => carry(39), S => S(39), Cout => carry(40));
--    fa40: full_adder_padd port map(A => A(40), B => B(40), Cin => carry(40), S => S(40), Cout => carry(41));
--    fa41: full_adder_padd port map(A => A(41), B => B(41), Cin => carry(41), S => S(41), Cout => carry(42));
--    fa42: full_adder_padd port map(A => A(42), B => B(42), Cin => carry(42), S => S(42), Cout => carry(43));
--    fa43: full_adder_padd port map(A => A(43), B => B(43), Cin => carry(43), S => S(43), Cout => carry(44));
--    fa44: full_adder_padd port map(A => A(44), B => B(44), Cin => carry(44), S => S(44), Cout => carry(45));
--    fa45: full_adder_padd port map(A => A(45), B => B(45), Cin => carry(45), S => S(45), Cout => carry(46));
--    fa46: full_adder_padd port map(A => A(46), B => B(46), Cin => carry(46), S => S(46), Cout => carry(47));
--    fa47: full_adder_padd port map(A => A(47), B => B(47), Cin => carry(47), S => S(47), Cout => carry(48));
--    fa48: full_adder_padd port map(A => A(48), B => B(48), Cin => carry(48), S => S(48), Cout => carry(49));
--    fa49: full_adder_padd port map(A => A(49), B => B(49), Cin => carry(49), S => S(49), Cout => carry(50));
--    fa50: full_adder_padd port map(A => A(50), B => B(50), Cin => carry(50), S => S(50), Cout => carry(51));
--    fa51: full_adder_padd port map(A => A(51), B => B(51), Cin => carry(51), S => S(51), Cout => carry(52));
--    fa52: full_adder_padd port map(A => A(52), B => B(52), Cin => carry(52), S => S(52), Cout => carry(53));
--    fa53: full_adder_padd port map(A => A(53), B => B(53), Cin => carry(53), S => S(53), Cout => carry(54));
--    fa54: full_adder_padd port map(A => A(54), B => B(54), Cin => carry(54), S => S(54), Cout => carry(55));
--    fa55: full_adder_padd port map(A => A(55), B => B(55), Cin => carry(55), S => S(55), Cout => carry(56));
--    fa56: full_adder_padd port map(A => A(56), B => B(56), Cin => carry(56), S => S(56), Cout => carry(57));
--    fa57: full_adder_padd port map(A => A(57), B => B(57), Cin => carry(57), S => S(57), Cout => carry(58));
--    fa58: full_adder_padd port map(A => A(58), B => B(58), Cin => carry(58), S => S(58), Cout => carry(59));
--    fa59: full_adder_padd port map(A => A(59), B => B(59), Cin => carry(59), S => S(59), Cout => carry(60));
--    fa60: full_adder_padd port map(A => A(60), B => B(60), Cin => carry(60), S => S(60), Cout => carry(61));
--    fa61: full_adder_padd port map(A => A(61), B => B(61), Cin => carry(61), S => S(61), Cout => carry(62));
--    fa62: full_adder_padd port map(A => A(62), B => B(62), Cin => carry(62), S => S(62), Cout => carry(63));
--    fa63: full_adder_padd port map(A => A(63), B => B(63), Cin => carry(63), S => S(63), Cout => Cout);

        

    
end Behavioral;