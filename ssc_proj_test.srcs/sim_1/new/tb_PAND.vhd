library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity PAND_TB is
end entity PAND_TB;

architecture Behavioral of PAND_TB is
  signal A : STD_LOGIC_VECTOR(63 downto 0);
  signal B : STD_LOGIC_VECTOR(63 downto 0);
  signal P : STD_LOGIC_VECTOR(63 downto 0);
  signal Cin, clk, reset, enable : std_logic := '0';
  
  component PAND
    Port (
      A : in STD_LOGIC_VECTOR(63 downto 0);
      B : in STD_LOGIC_VECTOR(63 downto 0);
      P : out STD_LOGIC_VECTOR(63 downto 0)
    );
  end component;
  
begin

 UUT: PAND port map (A => A, 
                     B => B, 
                     P => P);
 
  simulation: process
  begin
  
    clk <= '0';
  
    A <= x"0000000000000000";
    B <= x"0000000000000000";
    
    A <= x"0000000011001100";
    B <= x"0000000010101010";
    wait for 10 ns;
    
    A <= x"0000000011110000";
    B <= x"0000000000111100";
    wait for 10 ns;

    A <= x"0000000001010101";
    B <= x"0000000011001100";
    wait for 10 ns;
    
    A <= x"0101010101110101";
     B <= x"0101010101010101";
     wait for 10 ns;
    
     A <= x"0101010101010101";
     B <= x"0101011101010101";
     wait for 10 ns;
     
     A <= x"123456789ABCDEF0";
     B <= x"FFFFFFFFFFFFFFFF";
     wait for 10 ns;

    wait;
  end process;

 

end architecture Behavioral;
