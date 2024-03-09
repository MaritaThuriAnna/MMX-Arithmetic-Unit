--PAND
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity PAND is
  Port (
    A : in STD_LOGIC_VECTOR(63 downto 0);
    B : in STD_LOGIC_VECTOR(63 downto 0);
    P : out STD_LOGIC_VECTOR(63 downto 0)
  );
end entity PAND;

architecture Behavioral of PAND is
begin

    P <= A and B;
end architecture Behavioral;
