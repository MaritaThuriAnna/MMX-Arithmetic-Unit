library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity tb_PSUB is
end tb_PSUB;

architecture Behavioral of tb_PSUB is

    signal op1, op2 : std_logic_vector(63 downto 0);
    signal result : std_logic_vector(63 downto 0);
    signal cascade: std_logic_vector(1 downto 0);

    

    component PSUB
        Port (
        op1, op2 : in STD_LOGIC_VECTOR(63 downto 0);
        result   : out STD_LOGIC_VECTOR(63 downto 0);
        cascade  : in STD_LOGIC_VECTOR(1 downto 0)
    );  
    end component;

begin
    UUT: PSUB
        port map (op1 => op1, 
                  op2 => op2,
                  result => result, 
                  cascade => cascade);

    simulation: process
    begin
          
        op1 <= x"0000000000001010";
        op2 <= x"0000000000000101";
        cascade <= "00"; 
        wait for 10 ns;

        op1 <= x"FFFFFFFFFFFFFFFF";
        op2 <= x"0000000000000001";
        cascade <= "01"; 
        wait for 10 ns;

        op1 <= x"0000000000000001";
        op2 <= x"0000000000000001";
        cascade <= "10"; 
        wait for 10 ns;
    
        op1 <= x"0000000000000101";
        op2 <= x"0000000000001010";
        cascade <= "01"; 
        wait for 10 ns;

        op1 <= x"FFFFFFFFFFFFFFFE";
        op2 <= x"0000000000000001";
        cascade <= "00"; 
        wait for 10 ns;

        op1 <= x"0000000000000002";
        op2 <= x"0000000000000001";
        cascade <= "10"; 
        wait for 10 ns;

        op1 <= x"FFFFFFFFFFFFFFFF";
        op2 <= x"0000000000000001";
        cascade <= "10"; 
        wait for 10 ns;

        op1 <= x"0000000000000001";
        op2 <= x"FFFFFFFFFFFFFFFF";
        cascade <= "00"; 
        wait for 10 ns;

        op1 <= x"8000000000000000";
        op2 <= x"7FFFFFFFFFFFFFFF";
        cascade <= "01"; 
        wait for 10 ns;

        op1 <= x"123456789ABCDEF0";
        op2 <= x"0000000000000000";
        cascade <= "10"; 
        wait for 10 ns;

        op1 <= x"0000000000000000";
        op2 <= x"123456789ABCDEF0";
        cascade <= "01"; 
        wait for 10 ns;

        op1 <= x"0000000000000100";
        op2 <= x"0000000000000200";
        cascade <= "00"; 
        wait for 10 ns;

        wait;
    end process simulation;

end Behavioral;
