library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity CSA_tb is
end entity;

architecture sim of CSA_tb is
  signal A, B, C: std_logic_vector(7 downto 0);
  signal S: std_logic_vector(7 downto 0);
  signal Cout: std_logic;

  -- Component instantiation for the CSA module
  component CSA
    Port (A, B, C : in std_logic_vector(7 downto 0);
          S : out std_logic_vector(8 downto 0);
          Cout : out std_logic);
  end component;

begin

  -- Testbench stimulus process
  stimulus_process: process
  begin
    -- Initialize inputs A, B, and C
    A <= "11011011";
    B <= "01010101";
    C <= "00000000";

    -- Apply inputs to the CSA module
    wait for 10 ns;
    A <= "10101010";
    B <= "00110011";
    C <= "00000000";

    wait for 10 ns;
    A <= "11111111";
    B <= "00000001";
    C <= "00000000";

    wait;
  end process;

  -- Instantiate the CSA module
  uut: CSA port map (A => A, B => B, C => C, S => S, Cout => Cout);

end architecture;
