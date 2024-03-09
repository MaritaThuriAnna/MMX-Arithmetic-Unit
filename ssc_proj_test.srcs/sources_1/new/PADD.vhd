--PADD:
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity PADD is
    Port (
        op1, op2 : in STD_LOGIC_VECTOR(63 downto 0);
        result   : out STD_LOGIC_VECTOR(63 downto 0);
        cascade  : in STD_LOGIC_VECTOR(1 downto 0)
    );  
end PADD;

architecture Behavioral of PADD is

    component full_adder is
    Port (
        A, B, Cin, cascade_carry : in std_logic;
        S, Cout   : out std_logic
    );
    end component;

    signal carry : std_logic_vector(64 downto 0);
    signal cascade_carry: STD_LOGIC_VECTOR(6 downto 0) := (others => '0');
    signal S : std_logic_vector(63 downto 0);
        
begin
    
carry(0) <= '0';

with cascade select
    cascade_carry(0) <= '1' when "00", --8
                        '0' when others;
with cascade select
    cascade_carry(1) <= '1' when "00", --8
                        '1' when "01", --16
                        '0' when others;              
with cascade select
    cascade_carry(2) <= '1' when "00", --8
                        '0' when others;
with cascade select
    cascade_carry(3) <= '1' when "00", --8
                        '1' when "01", --16
                        '1' when "10", --32
                        '0' when others;
with cascade select
    cascade_carry(4) <= '1' when "00", --8
                        '0' when others;                                         
with cascade select
    cascade_carry(5) <= '1' when "00", --8
                        '1' when "01", --16
                        '0' when others;                                                      
with cascade select
    cascade_carry(6) <= '1' when "00", --8
                        '1' when "11",
                        '0' when others;

oct0: for i in 0 to 7 
generate 
    fa0_i: full_adder port map(A => op1(i), 
                               B => op2(i), 
                               cascade_carry => '0',
                               Cin => carry(i), 
                               S => result(i), 
                               Cout => carry(i + 1)); 
end generate;
--9th adders carry:
    fa_8: full_adder port map(A => op1(8), 
                              B => op2(8), 
                              cascade_carry => cascade_carry(0),
                              Cin => carry(8), 
                              S => result(8), 
                              Cout => carry(9));
                              
oct1: for i in 9 to 15
generate 
    fa1_i: full_adder port map(A => op1(i), 
                               B => op2(i), 
                               cascade_carry => '0',
                               Cin => carry(i), 
                               S => result(i), 
                               Cout => carry(i + 1)); 
end generate;
    fa_16: full_adder port map(A => op1(16), 
                               B => op2(16),
                               cascade_carry => cascade_carry(1),
                               Cin => carry(16), 
                               S => result(16), 
                               Cout => carry(17));                              

oct2: for i in 17 to 23
generate 
    fa2_i: full_adder port map(A => op1(i), 
                               B => op2(i),
                               cascade_carry => '0', 
                               Cin => carry(i), 
                               S => result(i), 
                               Cout => carry(i + 1)); 
end generate;
    fa_24: full_adder port map(A => op1(24), 
                               B => op2(24), 
                               cascade_carry => cascade_carry(2),
                               Cin => carry(24), 
                               S => result(24), 
                               Cout => carry(25));

oct3: for i in 25 to 31
generate 
    fa3_i: full_adder port map(A => op1(i), 
                               B => op2(i), 
                               cascade_carry => '0',
                               Cin => carry(i), 
                               S => result(i), 
                               Cout => carry(i + 1)); 
end generate;
    fa_32: full_adder port map(A => op1(32), 
                               B => op2(32), 
                               cascade_carry => cascade_carry(3),
                               Cin => carry(32), 
                               S => result(32), 
                               Cout => carry(33));    

oct4: for i in 33 to 39
generate 
    fa4_i: full_adder port map(A => op1(i), 
                               B => op2(i), 
                               cascade_carry => '0',
                               Cin => carry(i), 
                               S => result(i), 
                               Cout => carry(i + 1)); 
end generate;
    fa_40: full_adder port map(A => op1(40), 
                               B => op2(40), 
                               cascade_carry => cascade_carry(4),
                               Cin => carry(40), 
                               S => result(40), 
                               Cout => carry(41));                                                           

oct5: for i in 41 to 47
generate 
    fa5_i: full_adder port map(A => op1(i), 
                               B => op2(i), 
                               cascade_carry => '0',
                               Cin => carry(i), 
                               S => result(i), 
                               Cout => carry(i + 1)); 
end generate;
    fa_48: full_adder port map(A => op1(48), 
                               B => op2(48), 
                               cascade_carry => cascade_carry(5),
                               Cin => carry(48), 
                               S => result(48), 
                               Cout => carry(49)); 

oct6: for i in 49 to 55
generate 
    fa6_i: full_adder port map(A => op1(i), 
                               B => op2(i), 
                               cascade_carry => '0',
                               Cin => carry(i), 
                               S => result(i), 
                               Cout => carry(i + 1)); 
end generate;
    fa_56: full_adder port map(A => op1(56), 
                               B => op2(56), 
                               cascade_carry => cascade_carry(6),
                               Cin => carry(56), 
                               S => result(56), 
                               Cout => carry(57));
                               
oct7: for i in 57 to 63
generate 
    fa7_i: full_adder port map(A => op1(i), 
                               B => op2(i), 
                               cascade_carry => '0',
                               Cin => carry(i), 
                               S => result(i), 
                               Cout => carry(i + 1)); 
end generate;
                                        
end Behavioral;