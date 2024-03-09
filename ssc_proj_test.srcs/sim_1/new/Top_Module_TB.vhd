library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity tb_Top_Module is
end tb_Top_Module;

architecture Behavioral of tb_Top_Module is

  signal clk : std_logic := '0';
  signal sel : std_logic := '1';
  signal opCode : std_logic_vector(2 downto 0) := "000";
  signal cascade : std_logic_vector(1 downto 0) := "00";
  signal mem_out: std_logic_vector(127 downto 0);
  signal Alu_Res : std_logic_vector(63 downto 0);
  signal Alu_Op1, Alu_Op2 : std_logic_vector(63 downto 0);

  component Top_Module
    Port (
      clk : in STD_LOGIC;
      sel : in STD_LOGIC;
      opCode : in STD_LOGIC_VECTOR(2 downto 0);
      cascade : in STD_LOGIC_VECTOR(1 downto 0);
      Alu_Res : out STD_LOGIC_VECTOR(63 DOWNTO 0)
    );
  end component;

  component Mem_Unit
    Port (
      clk, sel : in std_logic;
      address : in std_logic_vector(1 downto 0);
      data_out : out std_logic_vector(127 downto 0)
    );
  end component;

  constant clk_period : time := 10 ns;
  signal adr : std_logic_vector(1 downto 0):="00";

begin


  UUT: Top_Module
    port map (
      clk => clk,
      sel => sel,
      opCode => opCode,
      cascade => cascade,
      Alu_Res => Alu_Res
    );

  MEM_UN: Mem_Unit
    port map (
      clk => clk,
      sel => sel,
      address => adr,
      data_out => mem_out
    );

  clk_process: process
  begin
    while now < 100 ns loop
      clk <= not clk;
      wait for clk_period/2;
    end loop;
    wait;
  end process;

  stimulus_process: process
  begin
    wait for 20 ns;  -- Wait for some initial time

    -- Test case 1
    sel <= '1';
    opCode <= "000";
    cascade <= "00";
    wait for 20 ns;

    -- Test case 2
    sel <= '1';
    opCode <= "001";
    cascade <= "01";
    wait for 20 ns;

    -- Test case 3
    sel <= '1';
    opCode <= "010";
    cascade <= "10";
    wait for 20 ns;

    wait;
  end process stimulus_process;

end Behavioral;
