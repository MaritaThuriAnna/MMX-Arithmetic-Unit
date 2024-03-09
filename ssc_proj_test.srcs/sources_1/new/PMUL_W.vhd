library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity PMUL_W is
    Port (
        a : in  STD_LOGIC_VECTOR (15 downto 0);
        b : in STD_LOGIC_VECTOR (15 downto 0);
        p : out STD_LOGIC_VECTOR (31 downto 0)
    );
end PMUL_W;

architecture Behavioral of PMUL_W is

    component PMUL_B is
    Port ( a : in STD_LOGIC_VECTOR (7 downto 0);
           b : in STD_LOGIC_VECTOR (7 downto 0);
           p : out STD_LOGIC_VECTOR (15 downto 0));
    end component;
    
    signal lower_A, upper_A, lower_B, upper_B                                         : STD_LOGIC_VECTOR (7 downto 0);
    signal lower_times_lower, upper_times_lower, lower_times_upper, upper_times_upper : STD_LOGIC_VECTOR (15 downto 0);
    signal upper_times_upper_extended                                                 : STD_LOGIC_VECTOR (31 downto 0);
    signal first_term, second_term, third_term, fourth_term, result                   : integer;

begin

   -- salvez partile de jos si sus
  lower_A <= a(7 downto 0);
  upper_A <= a(15 downto 8);
  lower_B <= b(7 downto 0);
  upper_B <= b(15 downto 8);

  --inmultesc partile de jos si apoi sus
   m00 : PMUL_B port map(a => lower_A, b => lower_B, p => lower_times_lower);
   m01 :PMUL_B port map(a => upper_A, b => upper_B, p => upper_times_upper);

   upper_times_upper_extended(15 downto 0) <= upper_times_upper(15 downto 0);
   
   m02 : PMUL_B port map(a => upper_A,b => lower_B, p => upper_times_lower);
   m03 : PMUL_B port map(a => lower_A, b => upper_B, p => lower_times_upper);
  

  first_term  <= to_integer(unsigned(lower_times_lower));
  second_term <= to_integer(unsigned(upper_times_lower));
  third_term  <= to_integer(unsigned(lower_times_upper));
  fourth_term <= to_integer(shift_left(unsigned(upper_times_upper_extended), 16));

  result <= first_term + (second_term + third_term) * 256 + fourth_term;

  p <= std_logic_vector(to_signed(result, 32));


end Behavioral;
