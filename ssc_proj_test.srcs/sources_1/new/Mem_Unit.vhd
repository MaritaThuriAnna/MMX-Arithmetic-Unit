library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;


entity Mem_Unit is
  Port (
        clk, sel: in std_logic;
        address: in std_logic_vector(1 downto 0);
        data_out: out std_logic_vector(127 downto 0)
  );
end Mem_Unit;

architecture Behavioral of Mem_Unit is

type mem_type is array (0 to 2) of std_logic_vector(127 downto 0);

signal RAM: mem_type := (
        x"123456789abcdef0_0fedcba987654321",
        x"0101010101010101_1100110011001100",
        x"FF2239E31003A804_FF2239E31003A804",
        others => x"0000000000000000_0000000000000000"
    );
    
begin

    process(clk)
    begin
        if rising_edge(clk) then
            data_out <= RAM(conv_integer(unsigned(address)));
        else
            data_out <= (others => '0');
        end if;
    end process;

end Behavioral;
