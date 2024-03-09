library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity CSA is
  Port (A, B, C : in std_logic_vector(7 downto 0);
        S : out std_logic_vector(7 downto 0);
        Cout : out std_logic);
end CSA;

architecture Behavioral of CSA is

component full_adder_padd
Port ( A, B, Cin : in STD_LOGIC;
       S, Cout : out STD_LOGIC);
end component;

component half_adder_wallace is
    Port ( a : in  STD_LOGIC;
           b : in  STD_LOGIC;
           sum : out  STD_LOGIC;
           carry : out  STD_LOGIC);
end component;

signal X, Y : std_logic_vector(3 downto 0);
signal c1, c2, c3 : std_logic;
signal d: std_logic_vector(7 downto 0);
signal h: std_logic_vector(7 downto 0);
signal s_temp: std_logic_vector(6 downto 0);

begin

--level 1
fa1: full_adder_padd port map(A => A(0), B => B(0), Cin => '0', S => S(0), Cout => d(0));
ha1: half_adder_wallace port map(A => A(1), B => B(1), sum => s_temp(0), carry => d(1));
ha2: half_adder_wallace port map(A => A(2), B => B(2), sum => s_temp(1), carry => d(2));
ha3: half_adder_wallace port map(A => A(3), B => B(3), sum => s_temp(2), carry => d(3));
ha4: half_adder_wallace port map(A => A(4), B => B(4), sum => s_temp(3), carry => d(4));
ha5: half_adder_wallace port map(A => A(5), B => B(5), sum => s_temp(4), carry => d(5));
ha6: half_adder_wallace port map(A => A(6), B => B(6), sum => s_temp(5), carry => d(6));
ha7: half_adder_wallace port map(A => A(7), B => B(7), sum => s_temp(6), carry => d(7));

--level 2
ha8: half_adder_wallace port map(A => d(0), B => s_temp(0), sum => S(0), carry => h(0));
fa2: full_adder_padd port map(A => d(1), B => s_temp(1), Cin => h(0), S => S(1), Cout => h(1));
fa3: full_adder_padd port map(A => d(2), B => s_temp(2), Cin => h(1), S => S(2), Cout => h(2));
fa4: full_adder_padd port map(A => d(3), B => s_temp(3), Cin => h(2), S => S(3), Cout => h(3));
fa5: full_adder_padd port map(A => d(4), B => s_temp(4), Cin => h(3), S => S(4), Cout => h(4));
fa6: full_adder_padd port map(A => d(5), B => s_temp(5), Cin => h(4), S => S(5), Cout => h(5));
fa7: full_adder_padd port map(A => d(6), B => s_temp(6), Cin => h(5), S => S(6), Cout => h(6));
ha9: half_adder_wallace port map(A => h(6), B => d(7), sum => S(7), carry => h(7));


end Behavioral;
