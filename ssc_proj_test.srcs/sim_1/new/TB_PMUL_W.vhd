library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity TB_PMUL_W is
--  Port ( );
end TB_PMUL_W;

architecture Behavioral of TB_PMUL_W is

component PMUL_W is
    Port (
        a : in  STD_LOGIC_VECTOR (15 downto 0);
        b : in STD_LOGIC_VECTOR (15 downto 0);
        p : out STD_LOGIC_VECTOR (31 downto 0)
    );
end component;

    signal op1 : std_logic_vector(15 downto 0) := (others => '0');
    signal op2 : std_logic_vector(15 downto 0) := (others => '0');
    signal prod : std_logic_vector(31 downto 0);
    
    signal clk :std_logic:= '0';
    constant clk_period : time := 10 ns;

begin

    UUT: PMUL_W  PORT MAP (
          a => op1,
          b => op2,
          p => prod
        );
        
   clk_process :process
   begin
		clk <= '0';
		wait for clk_period/2;
		clk <= '1';
		wait for clk_period/2;
   end process;

    simulation: process
    begin		
		op1<="1111111111111111";
		op2<="1111000011110000";

        wait for clk_period*10;
		op1<="1111111111111111";
		op2<="1111111111111111";
		
		wait for clk_period*10;
		op1<="1111111111111111";
		op2<="0000000000000011";
		
		wait for clk_period*10;
		op1<="0000000000001100";
        op2<="0000000000010101";
        
        wait for clk_period*10;
        op1<="1100110011001100";
        op2<="0011110000111100";
        
        wait for clk_period*10;
        op1<="0000000000001111";
        op2<="0000000000000111";
        
        wait for clk_period*10;
        op1<="0000000000000001";
        op2<="1111111111111111";

      wait;
   end process;
end Behavioral;
