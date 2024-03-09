library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity carry_propagate_adder is
Port ( x    : in STD_LOGIC_VECTOR (7 downto 0);
       y    : in STD_LOGIC_VECTOR (7 downto 0);
       s    : out STD_LOGIC_VECTOR (7 downto 0);
       cout : out STD_LOGIC );
end carry_propagate_adder;

architecture Behavioral of carry_propagate_adder is

    component full_adder_padd
        Port (A, B, Cin : in std_logic; 
              S, Cout : out std_logic);
    end component;
    
    signal carry_f,p_sum:STD_LOGIC_VECTOR(7 downto 0);
    signal c1, c2, c3, c4, c5, c6, c7, c8, c_sum: STD_LOGIC;

begin

    A1:full_adder_padd port map (A=> x(0), B => y(0), Cin => '0', S => p_sum(0), Cout => carry_f(1));
    A2:full_adder_padd port map (A=> x(1), B => y(1), Cin => '0', S => p_sum(1), Cout => carry_f(2));
    A3:full_adder_padd port map (A=> x(2), B => y(2), Cin => '0', S => p_sum(2), Cout => carry_f(3));
    A4:full_adder_padd port map (A=> x(3), B => y(3), Cin => '0', S => p_sum(3), Cout => carry_f(4));
    A5:full_adder_padd port map (A=> x(4), B => y(4), Cin => '0', S => p_sum(4), Cout => carry_f(5));
    A6:full_adder_padd port map (A=> x(5), B => y(5), Cin => '0', S => p_sum(5), Cout => carry_f(6));
    A7:full_adder_padd port map (A=> x(6), B => y(6), Cin => '0', S => p_sum(6), Cout => carry_f(7));
    A8:full_adder_padd port map (A=> x(7), B => y(7), Cin => '0', S => p_sum(7), Cout => c_sum);
   
    carry_f(0) <= '0';
    
    F1:full_adder_padd port map (A => p_sum(0), B => carry_f(0), Cin => '0', S => s(0), Cout => c1);
    F2:full_adder_padd port map (A => p_sum(1), B => carry_f(1), Cin => c1,  S => s(1), Cout => c2);
    F3:full_adder_padd port map (A => p_sum(2), B => carry_f(2), Cin => c2,  S => s(2), Cout => c3);
    F4:full_adder_padd port map (A => p_sum(3), B => carry_f(3), Cin => c3,  S => s(3), Cout => c4);
    F5:full_adder_padd port map (A => p_sum(4), B => carry_f(4), Cin => c4,  S => s(4), Cout => c5);
    F6:full_adder_padd port map (A => p_sum(5), B => carry_f(5), Cin => c5,  S => s(5), Cout => c6);
    F7:full_adder_padd port map (A => p_sum(6), B => carry_f(6), Cin => c6,  S => s(6), Cout => c7);
    F8:full_adder_padd port map (A => p_sum(7), B => carry_f(7), Cin => c7,  S => s(7), Cout => c8);
    
    cout <= c_sum or c8;

end Behavioral;
