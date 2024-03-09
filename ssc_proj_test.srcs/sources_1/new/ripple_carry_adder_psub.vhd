--ripple carry adder
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
    
entity ripple_carry_adder_psub is
        generic (
            DATA_WIDTH : integer := 64
        );
        Port (
            A, B    : in  std_logic_vector(DATA_WIDTH - 1 downto 0);
            Cin     : in  std_logic;
            S       : out std_logic_vector(DATA_WIDTH - 1 downto 0);
            Cout    : out std_logic
        );
end ripple_carry_adder_psub;
    
architecture Behavioral of ripple_carry_adder_psub is
--    signal carry : std_logic_vector(7 downto 0);
    
    component full_adder_psub
        Port (A, B, Cin : in std_logic; 
              S, Cout : out std_logic);
    end component;
    
    signal carry : std_logic_vector(DATA_WIDTH - 1  downto 0);
    signal Cout_internal : std_logic;
    
    begin
    
    carry(0) <= Cin;
    
    fa0: full_adder_psub port map(A => A(0), 
                                  B => B(0), 
                                  Cin => carry(0), 
                                  S => S(0), 
                                  Cout => carry(1)); 
    fa_S: for i in 1 to (DATA_WIDTH-2) generate
    uut: full_adder_psub port map(A => A(i), 
                                  B => B(i), 
                                  Cin => carry(i), 
                                  S => S(i), 
                                  Cout => carry(i+1));
    end generate;
    fa63: full_adder_psub port map(A => A(DATA_WIDTH-1), 
                                   B => B(DATA_WIDTH-1), 
                                   Cin => carry(DATA_WIDTH-1), 
                                   S => S(DATA_WIDTH-1), 
                                   Cout => Cout); 
--    FA0: full_adder_psub port map(A => A(0), B => B(0), Cin => carry(0), S => S(0), Cout => carry(1));
--    FA1: full_adder_psub port map(A => A(1), B => B(1), Cin => carry(1), S => S(1), Cout => carry(2));
--    FA2: full_adder_psub port map(A => A(2), B => B(2), Cin => carry(2), S => S(2), Cout => carry(3));
--    FA3: full_adder_psub port map(A => A(3), B => B(3), Cin => carry(3), S => S(3), Cout => carry(4));
--    FA4: full_adder_psub port map(A => A(4), B => B(4), Cin => carry(4), S => S(4), Cout => carry(5));
--    FA5: full_adder_psub port map(A => A(5), B => B(5), Cin => carry(5), S => S(5), Cout => carry(6));
--    FA6: full_adder_psub port map(A => A(6), B => B(6), Cin => carry(6), S => S(6), Cout => carry(7));
--    FA7: full_adder_psub port map(A => A(7), B => B(7), Cin => carry(7), S => S(7), Cout => Cout);
    
    
    
end Behavioral;
