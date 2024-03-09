library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity Top_Module is
  Port (
    clk : in STD_LOGIC;
    sel : in STD_LOGIC;
    opCode : in STD_LOGIC_VECTOR(2 downto 0);
    cascade : in STD_LOGIC_VECTOR(1 downto 0);
    Alu_Res : out STD_LOGIC_VECTOR(63 DOWNTO 0)
  );
end Top_Module;

architecture Behavioral of Top_Module is

  component Mem_Unit
    Port (
      clk, sel : in std_logic;
      address : in std_logic_vector(1 downto 0);
      data_out : out std_logic_vector(127 downto 0)
    );
  end component;

  component Arithmetic_Unit
    Port (
      opCode : in STD_LOGIC_VECTOR(2 downto 0);
      cascade : in STD_LOGIC_VECTOR(1 downto 0);
      clk : in STD_LOGIC;
      Alu_Op1 : IN STD_LOGIC_VECTOR(63 DOWNTO 0);
      Alu_Op2 : IN STD_LOGIC_VECTOR(63 DOWNTO 0);
      Alu_Res : OUT STD_LOGIC_VECTOR(63 DOWNTO 0);
      Alu_Op1_mul : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
      Alu_Op2_mul : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
      Alu_Res_mul : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
      shift_amount : in natural range 0 to 63
    );
  end component;
  
  signal Mem_Unit_data_out : std_logic_vector(127 downto 0);
  signal Alu_Op1, Alu_Op2 : std_logic_vector(63 downto 0);
  signal current_address, next_address : std_logic_vector(1 downto 0) := "00";
  signal mem_unit_data_out_internal : std_logic_vector(127 downto 0);
  signal mem_unit_clk_internal, mem_unit_sel_internal : std_logic;
  signal mem_unit_address_internal : std_logic_vector(1 downto 0);
  signal Alu_Op1_mul, Alu_Op2_mul : STD_LOGIC_VECTOR(15 DOWNTO 0);
  signal Alu_Res_mul :  STD_LOGIC_VECTOR(31 DOWNTO 0);
  signal shift_amount : natural range 0 to 63;

begin

      Mem_Unit_inst : Mem_Unit
      port map (
        clk => mem_unit_clk_internal,
        sel => mem_unit_sel_internal,
        address => mem_unit_address_internal,
        data_out => mem_unit_data_out_internal
        );
        
    process(clk, sel, current_address, mem_unit_data_out_internal)
        begin
            if sel = '1' then
                Mem_Unit_data_out <= mem_unit_data_out_internal;
            end if;
    end process;
  
  Alu_Op1 <= Mem_Unit_data_out(63 downto 0);
  Alu_Op2 <= Mem_Unit_data_out(127 downto 64);
  
    process(clk)
    begin
    if rising_edge(clk) then
      if sel = '1' then
        next_address <= current_address + 1;
        if next_address = "11" then
          next_address <= "00";
        end if;
        current_address <= next_address; 
      end if;
    end if;
  end process;

  Arithmetic_Unit_inst : Arithmetic_Unit
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

end Behavioral;
