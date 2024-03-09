--full adder
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity full_adder is
    Port (
        A, B, Cin, cascade_carry : in std_logic;
        S, Cout   : out std_logic
    );
end full_adder;

architecture Behavioral of full_adder is
begin

     process(A, B, Cin, cascade_carry)

begin
    
    S <= (A xor B) xor Cin;
    if cascade_carry = '1' then
        Cout <= (A and B) or ((A or B) and '0');
    else
        Cout <= (A and B) or ((A or B) and Cin);
    end if;
    
end process;

end Behavioral;