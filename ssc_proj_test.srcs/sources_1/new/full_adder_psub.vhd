--full adder
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity full_adder_psub is
    Port (
        A, B, Cin, cascade_carry  : in std_logic;
        S, Cout   : out std_logic
    );
end full_adder_psub;

architecture Behavioral of full_adder_psub is

signal c: std_logic;
signal miau: std_logic := '0';

begin
--  Daca cascade_carry e 1 atunci cin e 0
--  Daca cascade_carry e 0 atunci cin = cin de la sumatoru anterior
    process(A, B, Cin)
    begin
        S <= (A xor B) xor Cin;
        if cascade_carry = '1' then
            Cout <= ((not A) and (B or miau)) or (B and miau);
        else
            Cout <= ((not A) and (B or Cin)) or (B and Cin);
        end if;
        
    end process;
end Behavioral;
