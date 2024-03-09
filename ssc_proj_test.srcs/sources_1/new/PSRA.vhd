--PSRA
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
 
entity PSRA is
  Port (
    clk : in STD_LOGIC;
    input_data : in STD_LOGIC_VECTOR(63 downto 0);
    shift_amount : in natural range 0 to 63;
    result : out STD_LOGIC_VECTOR(63 downto 0)
  );
end entity PSRA;
 
architecture Behavioral of PSRA is
  signal shift_reg : STD_LOGIC_VECTOR(63 downto 0) := (others => '0');
  signal msb: STD_LOGIC := '0';
 
begin
 
--  process(input_data)
--  begin
    msb <= input_data(63); -- Save the sign bit
--  end process;
  process (clk)
  begin
    if rising_edge(clk) then
      if shift_amount = 0 then
        shift_reg <= input_data;
      else
        for i in 63 downto 0 loop
            if i >= 64 - shift_amount then
                shift_reg(i) <= msb;
            else
                shift_reg(i) <= input_data(shift_amount + i);
            end if;
        end loop;
      end if;
 
      result <= shift_reg;
    end if;
  end process;
 
end architecture Behavioral;
  
--  process(clk, sel, input_data, shift_amount)
--  begin
--    if rising_edge(clk) then
--      if shift_amount = 0 then
--        shift_reg <= input_data;
--       end if;
--    else
--        case sel is 
--            when "00" => --16
--                for j in 0 to 3 loop
--                    msb <= input_data((j + 1) * 16 - 1);
--                    for i in 15 downto 0 loop
--                        if i >= 15 - shift_amount then
--                             shift_reg((j * 16) + i) <= msb;
--                        else
--                             shift_reg((j * 16) + i) <= input_data(shift_amount + (j * 16) + i);
--                        end if;
--                    end loop;   
--                end loop;
                
--            when "01" => --32
--                for j in 0 to 1 loop
--                    msb <= input_data((j + 1) * 32 - 1);
--                    for i in 31 downto 0 loop
--                        if i >= 31 - shift_amount then
--                             shift_reg((j * 32) + i) <= msb;
--                        else
--                             shift_reg((j * 32) + i) <= input_data(shift_amount + (j * 32) + i);
--                        end if;
--                    end loop;   
--                end loop;
                
--            when "10" => -- 64
--                for i in 63 downto 0 loop
--                    if i >= 64 - shift_amount then
--                        shift_reg(i) <= msb;
--                    else
--                        shift_reg(i) <= input_data(shift_amount + i);
--                    end if;
--                end loop;
--            when others => 
--                shift_reg <= (others => '0');
                
--        end case;
--        result <= shift_reg;
--    end if; 
--end process;


