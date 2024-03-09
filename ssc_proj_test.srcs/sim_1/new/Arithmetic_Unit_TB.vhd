library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity Arithmetic_Unit_TB is
end Arithmetic_Unit_TB;

architecture Testbench of Arithmetic_Unit_TB is
  signal opCode                                     : STD_LOGIC_VECTOR(2 downto 0);
  signal cascade                                    : STD_LOGIC_VECTOR(1 downto 0);
  signal clk                                        : STD_LOGIC := '0';
  signal Alu_Op1 : STD_LOGIC_VECTOR(63 DOWNTO 0)    := (others => '0');
  signal Alu_Op2: STD_LOGIC_VECTOR(63 DOWNTO 0)     := (others => '0');
  signal Alu_Op1_mul: STD_LOGIC_VECTOR(15 DOWNTO 0) := (others => '0');
  signal Alu_Op2_mul: STD_LOGIC_VECTOR(15 DOWNTO 0) := (others => '0');
  signal Alu_Res_mul                                :STD_LOGIC_VECTOR(31 DOWNTO 0);
  signal Alu_Res                                    : STD_LOGIC_VECTOR(63 DOWNTO 0);
  signal shift_amount                               : natural range 0 to 63;

  constant CLK_PERIOD : time := 10 ns;  

  component Arithmetic_Unit
    PORT (
      opCode      : in  STD_LOGIC_VECTOR(2 downto 0);
      cascade     : in  STD_LOGIC_VECTOR(1 downto 0);
      clk         : in STD_LOGIC;
      Alu_Op1     : IN STD_LOGIC_VECTOR(63 DOWNTO 0);
      Alu_Op2     : IN STD_LOGIC_VECTOR(63 DOWNTO 0);
      Alu_Res     : OUT STD_LOGIC_VECTOR(63 DOWNTO 0);
      Alu_Op1_mul : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
      Alu_Op2_mul : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
      Alu_Res_mul : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
      shift_amount : in natural range 0 to 63
     );
  end component;
begin

  process
  begin
    while now < 1000 ns loop  
      wait for CLK_PERIOD / 2;
      clk <= not clk;
    end loop;
    wait;
  end process;

  process
  begin

--    PADD
    opCode <= "000";  
    cascade <= "00";
    Alu_Op1 <= x"1111111111111111";
    Alu_Op2 <= x"0000000000000011";
    wait for 20 ns;
    
--    PSUB
    opCode <= "001";  
    cascade <= "01";   
    Alu_Op1 <= x"0000000000000010";
    Alu_Op2 <= x"0000000000000001";
    wait for 20 ns;
    
    --    PMUL
    opCode <= "010";
    Alu_Op1_mul<="1111111111111111";
    Alu_Op2_mul<="1111000011110000";
    wait for 20 ns;
    
--    PAND
    opCode <= "011";
    Alu_Op1 <= x"0000000011110000";
    Alu_Op2 <= x"0000000000111100";
    wait for 20 ns;
    
--    PSRA
    opCode <= "100";
    Alu_Op1 <= x"0000000000110011";
    shift_amount <= 2;
    wait for 20 ns;
    
--    PSRL
    opCode <= "101";
    Alu_Op1 <= x"0000000000110011";
    shift_amount <= 2;
    wait for 20 ns;


    wait;
  end process;

  uut: Arithmetic_Unit
    port map (
      opCode => opCode,
      cascade => cascade,
      clk => clk,
      Alu_Op1 => Alu_Op1,
      Alu_Op2 => Alu_Op2,
      Alu_Res => Alu_Res,
      Alu_Op1_mul => Alu_Op1_mul,
      Alu_Op2_mul => Alu_Op2_mul, 
      Alu_Res_mul => Alu_Res_mul,
      shift_amount => shift_amount
    );

end Testbench;
