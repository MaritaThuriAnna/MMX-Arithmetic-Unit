library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity csa_fin is
  Port (x : in STD_LOGIC_VECTOR (7 downto 0);
           y : in STD_LOGIC_VECTOR (7 downto 0);
           s : out STD_LOGIC_VECTOR (7 downto 0);
           cout : out STD_LOGIC  );
end csa_fin;

architecture Behavioral of csa_fin is

    component full_adder_padd
        Port (A, B, Cin : in std_logic; 
              S, Cout : out std_logic);
    end component;

    signal carry, sum: STD_LOGIC_VECTOR(7 downto 0);
    signal c1, c2, c3, c4, c5, c6, c7, c8, c_sum: STD_LOGIC;
    
begin

a1: full_adder_padd port map(A => x(0), B => y(0), Cin => '0', S => sum(0), Cout => carry(1));
a2: full_adder_padd port map(A => x(1), B => y(1), Cin => '0', S => sum(1), Cout => carry(2));
a3: full_adder_padd port map(A => x(2), B => y(2), Cin => '0', S => sum(2), Cout => carry(3));
a4: full_adder_padd port map(A => x(3), B => y(3), Cin => '0', S => sum(3), Cout => carry(4));
a5: full_adder_padd port map(A => x(4), B => y(4), Cin => '0', S => sum(4), Cout => carry(5));
a6: full_adder_padd port map(A => x(5), B => y(5), Cin => '0', S => sum(5), Cout => carry(6));
a7: full_adder_padd port map(A => x(6), B => y(6), Cin => '0', S => sum(6), Cout => carry(7));
a8: full_adder_padd port map(A => x(7), B => y(7), Cin => '0', S => sum(7), Cout => c_sum);
carry(0) <= '0';

f1: full_adder_padd port map(A => sum(0), B => carry(0), Cin => '0', S => s(0), Cout => c1);
f2: full_adder_padd port map(A => sum(1), B => carry(1), Cin => c1, S => s(1), Cout => c2);
f3: full_adder_padd port map(A => sum(2), B => carry(2), Cin => c2, S => s(2), Cout => c3);
f4: full_adder_padd port map(A => sum(3), B => carry(3), Cin => c3, S => s(3), Cout => c4);
f5: full_adder_padd port map(A => sum(4), B => carry(4), Cin => c4, S => s(4), Cout => c5);
f6: full_adder_padd port map(A => sum(5), B => carry(5), Cin => c5, S => s(5), Cout => c6);
f7: full_adder_padd port map(A => sum(6), B => carry(6), Cin => c6, S => s(6), Cout => c7);
f8: full_adder_padd port map(A => sum(7), B => carry(7), Cin => c7, S => s(7), Cout => c8);
cout <= c_sum or c8;



end Behavioral;
