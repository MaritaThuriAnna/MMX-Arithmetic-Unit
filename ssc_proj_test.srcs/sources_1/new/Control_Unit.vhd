library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity Arithmetic_Unit is
  PORT (
    opCode : in  STD_LOGIC_VECTOR(2 downto 0);
    cascade : in  STD_LOGIC_VECTOR(1 downto 0);
    clk : in STD_LOGIC;
    Alu_Op1 : IN STD_LOGIC_VECTOR(63 DOWNTO 0);
    Alu_Op2 : IN STD_LOGIC_VECTOR(63 DOWNTO 0);
    Alu_Res : OUT STD_LOGIC_VECTOR(63 DOWNTO 0);
    Alu_Op1_mul : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
    Alu_Op2_mul : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
    Alu_Res_mul : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
    shift_amount : in natural range 0 to 63
   );
end Arithmetic_Unit;

architecture Behavioral of Arithmetic_Unit is

  signal PADD_B_result : std_logic_vector(63 downto 0);
  signal PADD_W_result : std_logic_vector(63 downto 0);
  signal PADD_DW_result : std_logic_vector(63 downto 0);
  signal PSUB_B_result : std_logic_vector(63 downto 0);
  signal PSUB_W_result : std_logic_vector(63 downto 0);
  signal PSUB_DW_result : std_logic_vector(63 downto 0);
  signal PMULHW_result : std_logic_vector(31 downto 0);
  signal PAND_result : std_logic_vector(63 downto 0);
  signal PSRA_QW_result : std_logic_vector(63 downto 0);
  signal PSRL_QW_result : std_logic_vector(63 downto 0);
  
  component PADD
    Port (
      op1, op2 : in STD_LOGIC_VECTOR(63 downto 0);
      result   : out STD_LOGIC_VECTOR(63 downto 0);
      cascade  : in STD_LOGIC_VECTOR(1 downto 0)
    );
  end component;
  
  component PSUB is
    Port (
        op1, op2 : in STD_LOGIC_VECTOR(63 downto 0);
        result   : out STD_LOGIC_VECTOR(63 downto 0);
        cascade  : in STD_LOGIC_VECTOR(1 downto 0)
    );  
  end component;
  
  component PAND
    Port (
      A : in STD_LOGIC_VECTOR(63 downto 0);
      B : in STD_LOGIC_VECTOR(63 downto 0);
      P : out STD_LOGIC_VECTOR(63 downto 0)
    );
  end component;
  
    component PMUL_W is
    Port (
        a : in  STD_LOGIC_VECTOR (15 downto 0);
        b : in STD_LOGIC_VECTOR (15 downto 0);
        p : out STD_LOGIC_VECTOR (31 downto 0)
    );
    end component;
    
    component PSRL is
    Port ( 
        clk : in STD_LOGIC;
        input_data : in STD_LOGIC_VECTOR(63 downto 0);
        shift_amount : in natural range 0 to 63;
        result : out STD_LOGIC_VECTOR(63 downto 0)
    );
    end component;
    
    component PSRA is
    Port ( 
        clk : in STD_LOGIC;
        input_data : in STD_LOGIC_VECTOR(63 downto 0);
        shift_amount : in natural range 0 to 63;
        result : out STD_LOGIC_VECTOR(63 downto 0)
    );
    end component;

begin
    
    PADD_B : PADD
    port map (
      op1 => Alu_Op1,
      op2 => Alu_Op2,
      result => PADD_B_result,
      cascade => "00");
    
    PADD_W : PADD
    port map (
      op1 => Alu_Op1,
      op2 => Alu_Op2,
      result => PADD_W_result,
      cascade => cascade);

  PADD_DW : PADD
    port map (
      op1 => Alu_Op1,
      op2 => Alu_Op2,
      result => PADD_DW_result,
      cascade => cascade);
    
    PSUB_B : PSUB
    port map (
      op1 => Alu_Op1,
      op2 => Alu_Op2,
      result => PSUB_B_result,
      cascade => cascade);
    
    PSUB_W : PSUB
    port map (
      op1 => Alu_Op1,
      op2 => Alu_Op2,
      result => PSUB_W_result,
      cascade => cascade);

  PSUB_DW : PSUB
    port map (
      op1 => Alu_Op1,
      op2 => Alu_Op2,
      result => PSUB_DW_result,
      cascade => cascade);
    
  PMULHW : PMUL_W  
    PORT MAP (a => Alu_Op1_mul,
              b => Alu_Op2_mul,
              p => PMULHW_result);
   
  PAND_QW: PAND 
    port map (A => Alu_Op1, 
              B => Alu_Op2, 
              P => PAND_result);
                          
   PSRL_UUT:PSRL
    port map (
      clk => clk,
      input_data => Alu_Op1,
      shift_amount => shift_amount,
      result => PSRL_QW_result
    ); 
    
    PSRA_UUT:PSRA
    port map (
      clk => clk,
      input_data => Alu_Op1,
      shift_amount => shift_amount,
      result => PSRA_QW_result
    );                       
    
    process(clk)
    begin
        if clk'event and clk ='1' then
            case opCode is 
                when "000" =>  --adunare
                    case cascade is
                        when "00" =>
                            Alu_Res <= PADD_B_result;
                            Alu_Res_mul <= (others => '0');
                        when "01" =>
                            Alu_Res <= PADD_W_result;
                            Alu_Res_mul <= (others => '0');
                        when "10" =>
                            Alu_Res <= PADD_DW_result;
                            Alu_Res_mul <= (others => '0');
                        when others =>
                            Alu_Res <= (others => '0');
                            Alu_Res_mul <= (others => '0');
                        end case;
                when "001" => --scadere
                    case cascade is
                        when "00" =>
                            Alu_Res <= PSUB_B_result;
                            Alu_Res_mul <= (others => '0');
                        when "01" =>
                            Alu_Res <= PSUB_W_result;
                            Alu_Res_mul <= (others => '0');
                        when "10" =>
                            Alu_Res <= PSUB_DW_result;
                            Alu_Res_mul <= (others => '0');
                        when others =>
                            Alu_Res <= (others => '0');
                            Alu_Res_mul <= (others => '0');
                        end case; 
                when "010" =>  --inmultire
                    Alu_Res_mul <= PMULHW_result;
                    Alu_Res <=  (others => '0');
                when "011" =>  --PAND 64 biti
                    Alu_Res <= PAND_result;
                    Alu_Res_mul <= (others => '0');
                when "100" =>  --PSRA 64 biti
                    Alu_Res <= PSRA_QW_result;
                when "101" =>  --PSRl 64 biti
                    Alu_Res <= PSRL_QW_result;
                when others => 
                    Alu_Res <= (others => '0');
            end case;
        end if;
    end process;
    

end Behavioral;
