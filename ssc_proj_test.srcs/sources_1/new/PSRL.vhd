--PSRL
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use IEEE.numeric_std.all; 

entity PSRL is
  Port ( 
    clk : in STD_LOGIC;
    input_data : in STD_LOGIC_VECTOR(63 downto 0);
    shift_amount : in natural range 0 to 63;
    result : out STD_LOGIC_VECTOR(63 downto 0)
  );
end PSRL;

architecture Behavioral of PSRL is

   signal shift_reg : STD_LOGIC_VECTOR(63 downto 0) := (others => '0'); 
   signal temp16: STD_LOGIC_VECTOR(15 downto 0);

begin

    process(clk)
    begin
                for i in 63 downto 0 loop
                    if i >= 64 - shift_amount then
                        shift_reg(i) <= '0';
                    else
                        shift_reg(i) <= input_data(shift_amount + i);
                    end if;
                end loop;
        result <= shift_reg;
    end process;

end Behavioral;
