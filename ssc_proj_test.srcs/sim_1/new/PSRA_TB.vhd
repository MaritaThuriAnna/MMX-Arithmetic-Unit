library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use IEEE.NUMERIC_STD.ALL;

entity PSRA_TB is
end entity PSRA_TB;

architecture Behavioral of PSRA_TB is
  signal clk : STD_LOGIC := '0';
  signal input_data : STD_LOGIC_VECTOR(63 downto 0) ;
  signal shift_amount : natural ;
  signal result : STD_LOGIC_VECTOR(63 downto 0) := (others => '0');
  
 component PSRA is
  Port (
    clk : in STD_LOGIC;
    input_data : in STD_LOGIC_VECTOR(63 downto 0);
    shift_amount : in natural range 0 to 63;
    result : out STD_LOGIC_VECTOR(63 downto 0)
  );
end component;

 component PSRL is
  Port (
    clk : in STD_LOGIC;
    input_data : in STD_LOGIC_VECTOR(63 downto 0);
    shift_amount : in natural range 0 to 63;
    result : out STD_LOGIC_VECTOR(63 downto 0)
  );
end component;

begin


--    UUT: PSRA
--    port map (
--      clk => clk,
--      input_data => input_data,
--      shift_amount => shift_amount,
--      result => result
--    );
    
    PSRL_UUT:PSRL
    port map (
      clk => clk,
      input_data => input_data,
      shift_amount => shift_amount,
      result => result
    );

  clk_process: process
  begin
    while now < 100 ns loop
      clk <= not clk;
      wait for 5 ns;
    end loop;
    wait;
  end process;

--clk <= not clk after 5 ns;

  stimulus_process: process
  begin

    -- Test Case 1, Answer should be : 11110011
    input_data <= x"0000000000110011"; -- Set input to all 1s
    shift_amount <= 2;
    wait for 20 ns;
   

    -- Test Case 2, Answer should be : 00000011
    input_data <= x"0000000000110011";
    shift_amount <= 4;
    wait for 20 ns;

    -- Test Case 3, Answer should be : 11111000
    input_data <= x"0000000011110000";
    shift_amount <= 1;
    wait for 20 ns; 

    wait;
  end process;

end architecture Behavioral;
