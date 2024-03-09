--PMULH
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use IEEE.NUMERIC_STD.ALL;
use IEEE.std_logic_arith.all;

entity wallace_tree is
Port ( x, y : in STD_LOGIC_VECTOR (7 downto 0);
         p : out STD_LOGIC_VECTOR (15 downto 0);
         cout : out STD_LOGIC);
end wallace_tree;

architecture Behavioral of wallace_tree is

component CSA is
  Port (A, B, C : in std_logic_vector(7 downto 0);
        S       : out std_logic_vector(7 downto 0);
        Cout    : out std_logic);
end component;

component carry_propagate_adder is
Port ( x    : in STD_LOGIC_VECTOR (7 downto 0);
       y    : in STD_LOGIC_VECTOR (7 downto 0);
       s    : out STD_LOGIC_VECTOR (7 downto 0);
       cout : out STD_LOGIC );
end component;

signal ir0, ir1, ir2, ir3, ir4, ir5, ir6, ir7: std_logic_vector(7 downto 0);
signal cin0, cin1, cin2, cin3, cin4, cin5, cin6, cin7: std_logic_vector(7 downto 0);
--signal c0, c1, c2, c3, c4, c5, c6, c7: std_logic;
signal part_sum_0, part_sum_1, part_sum_2, part_sum_3, part_sum_4: STD_LOGIC_VECTOR(7 downto 0);
signal final_carry_bit: std_logic;
  signal ps0, ps1, ps2, ps3, ps4 : STD_LOGIC_VECTOR(7 downto 0);
  signal c0, c1, c2, c3, c4, c5, c6, c7, c8 : STD_LOGIC;
  signal cfa2_input_x, cfa2_input_y, cfa3_input_x, cfa3_input_y: STD_LOGIC_VECTOR(7 downto 0);
  
begin

      process (x, y)
        begin
        for i in 0 to 7 loop
            ps0(i) <= x(i) and y(0);
            ps1(i) <= x(i) and y(1);
            ps2(i) <= x(i) and y(2);
            ps3(i) <= x(i) and y(3);
            ps4(i) <= x(i) and y(4);
        end loop;
    end process;
    
    
csa1: CSA port map(A => ps0, 
                   B => ps1, 
                   C => ps2, 
                   S => ir0, 
                   Cout => c1);
                   
csa2: CSA port map(A => ps3, 
                   B => ps4, 
                   C => ir0, 
                   S => ir1, 
                   Cout => c2);
                   
csa3: CSA port map(A => ps0, 
                   B => ps1, 
                   C => ps2, 
                   S => ir2, 
                   Cout => c3);
                   
csa4: CSA port map(A => ps2, 
                   B => ps3, 
                   C => (others => '0'), 
                   S => p(31 downto 24), 
                   Cout => c4);
                   
cpa1: carry_propagate_adder port map (x => ir0, 
                                      y => ir1, 
                                      s => p(23 downto 16), 
                                      cout => c5);

cpa2: carry_propagate_adder port map (x => ir2, 
                                      y => ir3, 
                                      s => p(15 downto 8),
                                      cout => c6);

cpa3: carry_propagate_adder port map (x => cfa2_input_x, 
                                      y => cfa2_input_y, 
                                      s => p(7 downto 0),
                                      cout => c6);
                                                                           
cpa4: carry_propagate_adder port map (x => cfa3_input_x, 
                                      y => cfa3_input_y, 
                                      s =>  p(63 downto 24),
                                      cout => final_carry_bit);
                                      
                                      
      p(63) <= final_carry_bit;
end Behavioral;
