library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity tb_PMULHW is
--  Port ( );
end tb_PMULHW;

architecture Behavioral of tb_PMULHW is

component PMULHW is
  Port (
          a : in  STD_LOGIC_VECTOR (15 downto 0);
          b : in STD_LOGIC_VECTOR (15 downto 0);
          p : out STD_LOGIC_VECTOR (31 downto 0)
   );
end component;

signal A16 : std_logic_vector(15 downto 0) := (others => '0');
   signal B16 : std_logic_vector(15 downto 0) := (others => '0');

   signal prod16 : std_logic_vector(31 downto 0);
	signal clk :std_logic:= '0';
   constant clk_period : time := 10 ns;
   
begin
   uut: PMULHW PORT MAP (
          a => A16,
          b => B16,
          p => prod16
        );

   clk_process :process
   begin
		clk <= '0';
		wait for clk_period/2;
		clk <= '1';
		wait for clk_period/2;
   end process;
 

   -- Stimulus process
   stim_proc: process
   begin		
		A16<="1111111111111111";
		B16<="1111000011110000";

      wait for clk_period*10;
		A16<="1111111111111111";
		B16<="1111111111111111";
		
		wait for clk_period*10;
		A16<="1111111111111111";
		B16<="0000000000000011";

      wait;
   end process;

end Behavioral;
