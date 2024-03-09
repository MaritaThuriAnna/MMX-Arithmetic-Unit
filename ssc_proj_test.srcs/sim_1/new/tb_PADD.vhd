--testbench PADD
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity tb_PADD is
end tb_PADD;

architecture Behavioral of tb_PADD is

    signal op1, op2 : std_logic_vector(63 downto 0);
    signal result : std_logic_vector(63 downto 0);
    signal cascade: std_logic_vector(1 downto 0);
    

    component PADD is
    Port (
        op1, op2 : in STD_LOGIC_VECTOR(63 downto 0);
        result   : out STD_LOGIC_VECTOR(63 downto 0);
        cascade  : in STD_LOGIC_VECTOR(1 downto 0)
    );  
    end component;

begin
    UUT: PADD
        port map (op1 => op1, 
                  op2 => op2,
                  result => result, 
                  cascade => cascade);

    simulation: process
    begin
    
     op1 <= x"FFFFFFFFFFFFFFFF";
     op2 <= x"FFFFFFFFFFFFFFFF";
     cascade <= "10"; 
     wait for 10 ns;
    
     op1 <= x"0101010101110101";
     op2 <= x"0101010101010101";
     cascade <= "01"; 
     wait for 10 ns;
    
     op1 <= x"0101010101010101";
     op2 <= x"0101011101010101";
     cascade <= "10";
     wait for 10 ns;
     
     op1 <= x"0000000000000000";
     op2 <= x"0000000000000001";
     cascade <= "00";
     wait for 10 ns;

     op1 <= x"123456789ABCDEF0";
     op2 <= x"FFFFFFFFFFFFFFFF";
     cascade <= "01";
     wait for 10 ns;

     op1 <= x"1111111111111111";
     op2 <= x"0000000000000001";
     cascade <= "10";
     wait for 10 ns;
     
     op1 <= x"5555555555555555";
     op2 <= x"AAAAAAAAAAAAAAAA";
     cascade <= "00";
     wait for 10 ns;

     op1 <= x"8888888888888888";
     op2 <= x"8888888888888888";
     cascade <= "00";
     wait for 10 ns;

     op1 <= x"2222222222222222";
     op2 <= x"4444444444444444";
     cascade <= "01";
     wait for 10 ns;

        wait;
    end process simulation;

end Behavioral;
