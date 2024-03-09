--full adder
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity fullAdder is
    Port (
        A, B, Cin : in std_logic;
        S, Cout   : out std_logic
    );
end fullAdder;

architecture Behavioral of fullAdder is
begin
    process(A, B, Cin)
    begin
       -- sum_temp := A xor B xor Cin;
        S <= (A xor B xor Cin);
        Cout <= (A and B) or (Cin and B) or (A and Cin);
    end process;
end Behavioral;
