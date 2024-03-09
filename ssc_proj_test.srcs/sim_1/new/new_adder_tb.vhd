library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity tb_AdderMMX is
end tb_AdderMMX;

architecture testbench of tb_AdderMMX is
  signal x, y, s: std_logic_vector(63 downto 0);
  signal cascade: std_logic_vector(1 downto 0);
  
  component AdderMMX is
    Port ( x : in STD_LOGIC_VECTOR(63 downto 0);
           y : in STD_LOGIC_VECTOR(63 downto 0);
           cascade : in STD_LOGIC_VECTOR(1 downto 0);
           s : out STD_LOGIC_VECTOR(63 downto 0));
  end component;

begin

  -- Test Case 1: 8-bit addition
  x <= x"0000000000000001";
  y <= x"0000000000000001";
  cascade <= "00";
  
  uut: AdderMMX port map(x, y, cascade, s);

  process
  begin
    wait for 10 ns;
    assert s = x"0000000000000010" report "Test Case 1 Failed" severity error;
    wait;
  end process;

  -- Test Case 2: 16-bit addition
  x <= x"0000000000000001";
  y <= x"0000000000000001";
  cascade <= "01";
  
--  uut: AdderMMX port map(x, y, cascade, s);

  process
  begin
    wait for 10 ns;
    assert s = x"0000000000000010" & (others => '0') report "Test Case 2 Failed" severity error;
    wait;
  end process;

  -- Test Case 3: 32-bit addition
  x <= x"0000000000000001";
  y <= x"0000000000000001";
  cascade <= "10";
  
--  uut: AdderMMX port map(x, y, cascade, s);

  process
  begin
    wait for 10 ns;
    assert s = x"0000000000000002" & (others => '0') report "Test Case 3 Failed" severity error;
    wait;
  end process;

  -- Add more test cases as needed

end testbench;
