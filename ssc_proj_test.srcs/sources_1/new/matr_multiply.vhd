library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity multiply_B is
    Port ( a : in STD_LOGIC_VECTOR (7 downto 0);
           b : in STD_LOGIC_VECTOR (7 downto 0);
           p : out STD_LOGIC_VECTOR (15 downto 0));
end multiply_B;

architecture Behavioral of multiply_B is

component fullAdder is
    Port (
        A, B, Cin : in std_logic;
        S, Cout   : out std_logic
    );
end component;

--sume partiale
signal part_sum0, part_sum1, part_sum2, part_sum3, part_sum4, part_sum5, part_sum6, part_sum7 : std_logic_vector(7 downto 0);

--sume intermediare intre componente
signal s1_1, s1_2, s1_3, s1_4, s1_5, s1_6, s1_7, s1_8, s1_9                                           : std_logic;
signal s2_1, s2_2, s2_3, s2_4, s2_5, s2_6, s2_7, s2_8, s2_9, s2_10                                    : std_logic;
signal s3_1, s3_2, s3_3, s3_4, s3_5, s3_6, s3_7, s3_8, s3_9, s3_10,s3_11                              : std_logic;
signal s4_1, s4_2, s4_3, s4_4, s4_5, s4_6, s4_7, s4_8, s4_9, s4_10, s4_11, s4_12                      : std_logic;
signal s5_1, s5_2, s5_3, s5_4, s5_5, s5_6, s5_7, s5_8, s5_9, s5_10, s5_11, s5_12, s5_13               : std_logic;
signal s6_1, s6_2, s6_3, s6_4, s6_5, s6_6, s6_7, s6_8, s6_9, s6_10, s6_11, s6_12, s6_13, s6_14        : std_logic;
signal s7_1, s7_2, s7_3, s7_4, s7_5, s7_6, s7_7, s7_8, s7_9, s7_10, s7_11, s7_12, s7_13, s7_14, s7_15 : std_logic;

--carry intermediar inre componente
signal c1_0, c1_1, c1_2, c1_3, c1_4, c1_5, c1_6, c1_7, c1_8, c1_9                                           : std_logic;
signal c2_0, c2_1, c2_2, c2_3, c2_4, c2_5, c2_6, c2_7, c2_8, c2_9, c2_10                                    : std_logic;
signal c3_0, c3_1, c3_2, c3_3, c3_4, c3_5, c3_6, c3_7, c3_8, c3_9, c3_10, c3_11                             : std_logic;
signal c4_0, c4_1, c4_2, c4_3, c4_4, c4_5, c4_6, c4_7, c4_8, c4_9, c4_10, c4_11, c4_12                      : std_logic;
signal c5_0, c5_1, c5_2, c5_3, c5_4, c5_5, c5_6, c5_7, c5_8, c5_9, c5_10, c5_11, c5_12, c5_13               : std_logic;
signal c6_0, c6_1, c6_2, c6_3, c6_4, c6_5, c6_6, c6_7, c6_8, c6_9, c6_10, c6_11, c6_12, c6_13, c6_14        : std_logic;
signal c7_0, c7_1, c7_2, c7_3, c7_4, c7_5, c7_6, c7_7, c7_8, c7_9, c7_10, c7_11, c7_12, c7_13, c7_14, c7_15 : std_logic;


begin

    part_sum0(0)<=b(0) and a(0);
    part_sum0(1)<=b(0) and a(1);
    part_sum0(2)<=b(0) and a(2);
    part_sum0(3)<=b(0) and a(3);
    part_sum0(4)<=b(0) and a(4);
    part_sum0(5)<=b(0) and a(5);
    part_sum0(6)<=b(0) and a(6);
    part_sum0(7)<=b(0) and a(7);

    part_sum1(0)<=b(1) and a(0);
    part_sum1(1)<=b(1) and a(1);
    part_sum1(2)<=b(1) and a(2);
    part_sum1(3)<=b(1) and a(3);
    part_sum1(4)<=b(1) and a(4);
    part_sum1(5)<=b(1) and a(5);
    part_sum1(6)<=b(1) and a(6);
    part_sum1(7)<=b(1) and a(7);
    
    part_sum2(0)<=b(2) and a(0);
    part_sum2(1)<=b(2) and a(1);
    part_sum2(2)<=b(2) and a(2);
    part_sum2(3)<=b(2) and a(3);
    part_sum2(4)<=b(2) and a(4);
    part_sum2(5)<=b(2) and a(5);
    part_sum2(6)<=b(2) and a(6);
    part_sum2(7)<=b(2) and a(7);
    
    part_sum3(0)<=b(3) and a(0);
    part_sum3(1)<=b(3) and a(1);
    part_sum3(2)<=b(3) and a(2);
    part_sum3(3)<=b(3) and a(3);
    part_sum3(4)<=b(3) and a(4);
    part_sum3(5)<=b(3) and a(5);
    part_sum3(6)<=b(3) and a(6);
    part_sum3(7)<=b(3) and a(7);
    
    part_sum4(0)<=b(4) and a(0);
    part_sum4(1)<=b(4) and a(1);
    part_sum4(2)<=b(4) and a(2);
    part_sum4(3)<=b(4) and a(3);
    part_sum4(4)<=b(4) and a(4); 
    part_sum4(5)<=b(4) and a(5);
    part_sum4(6)<=b(4) and a(6);
    part_sum4(7)<=b(4) and a(7);
    
    part_sum5(0)<=b(5) and a(0);
    part_sum5(1)<=b(5) and a(1);
    part_sum5(2)<=b(5) and a(2);
    part_sum5(3)<=b(5) and a(3);
    part_sum5(4)<=b(5) and a(4);
    part_sum5(5)<=b(5) and a(5);
    part_sum5(6)<=b(5) and a(6);
    part_sum5(7)<=b(5) and a(7);
    
    part_sum6(0)<=b(6) and a(0);
    part_sum6(1)<=b(6) and a(1);
    part_sum6(2)<=b(6) and a(2);
    part_sum6(3)<=b(6) and a(3);
    part_sum6(4)<=b(6) and a(4);
    part_sum6(5)<=b(6) and a(5);
    part_sum6(6)<=b(6) and a(6);
    part_sum6(7)<=b(6) and a(7);
    
    part_sum7(0)<=b(7) and a(0);
    part_sum7(1)<=b(7) and a(1);
    part_sum7(2)<=b(7) and a(2);
    part_sum7(3)<=b(7) and a(3);
    part_sum7(4)<=b(7) and a(4);
    part_sum7(5)<=b(7) and a(5);
    part_sum7(6)<=b(7) and a(6);
    part_sum7(7)<=b(7) and a(7);
    
--  nivel 1    
    f11:fullAdder port map(a => part_sum0(0), b => '0', Cin => '0', s => s1_1, Cout => c1_1);
    f12:fullAdder port map(a => part_sum0(1), b => part_sum1(0), Cin => c1_1, s => s1_2, Cout => c1_2);
    f13:fullAdder port map(a => part_sum0(2), b => part_sum1(1), Cin => c1_2, s => s1_3, Cout => c1_3);
    f14:fullAdder port map(a => part_sum0(3), b => part_sum1(2), Cin => c1_3, s => s1_4, Cout => c1_4);
    f15:fullAdder port map(a => part_sum0(4), b => part_sum1(3), Cin => c1_4, s => s1_5, Cout => c1_5);
    f16:fullAdder port map(a => part_sum0(5), b => part_sum1(4), Cin => c1_5, s => s1_6, Cout => c1_6);
    f17:fullAdder port map(a => part_sum0(6), b => part_sum1(5), Cin => c1_6, s => s1_7, Cout => c1_7);
    f18:fullAdder port map(a => part_sum0(7), b => part_sum1(6), Cin => c1_7, s => s1_8, Cout => c1_8);
    f19:fullAdder port map(a => '0', b => part_sum1(7), Cin => c1_8, s => s1_9, Cout => c1_9);
    
--    nivel 2
    f21:fullAdder port map(a => s1_1, b => '0', Cin => '0', s => s2_1, Cout => c2_1);
    f22:fullAdder port map(a => s1_2, b => '0', Cin => c2_1, s => s2_2, Cout => c2_2);
    f23:fullAdder port map(a => s1_3, b => part_sum2(0), Cin => c2_2, s => s2_3, Cout => c2_3);
    f24:fullAdder port map(a => s1_4, b => part_sum2(1), Cin => c2_3, s => s2_4, Cout => c2_4);
    f25:fullAdder port map(a => s1_5, b => part_sum2(2), Cin => c2_4, s => s2_5, Cout => c2_5);
    f26:fullAdder port map(a => s1_6, b => part_sum2(3), Cin => c2_5, s => s2_6, Cout => c2_6);
    f27:fullAdder port map(a => s1_7, b => part_sum2(4), Cin => c2_6, s => s2_7, Cout => c2_7);
    f28:fullAdder port map(a => s1_8, b => part_sum2(5), Cin => c2_7, s => s2_8, Cout => c2_8);
    f29:fullAdder port map(a => s1_9, b => part_sum2(6), Cin => c2_8, s => s2_9, Cout => c2_9);
    f210:fullAdder port map(a => c1_9, b => part_sum2(7), Cin => c2_9, s => s2_10, Cout => c2_10);
    
--    nivel 3
    f31:fullAdder port map(a => s2_1, b => '0', Cin => '0', s => s3_1, Cout => c3_1);
    f32:fullAdder port map(a => s2_2, b => '0', Cin => c3_1, s => s3_2, Cout => c3_2);
    f33:fullAdder port map(a => s2_3, b => '0', Cin => c3_2, s => s3_3, Cout => c3_3);
    f34:fullAdder port map(a => s2_4, b => part_sum3(0), Cin => c3_3, s => s3_4, Cout => c3_4);
    f35:fullAdder port map(a => s2_5, b => part_sum3(1), Cin => c3_4, s => s3_5, Cout => c3_5);
    f36:fullAdder port map(a => s2_6, b => part_sum3(2), Cin => c3_5, s => s3_6, Cout => c3_6);
    f37:fullAdder port map(a => s2_7, b => part_sum3(3), Cin => c3_6, s => s3_7, Cout => c3_7);
    f38:fullAdder port map(a => s2_8, b => part_sum3(4), Cin => c3_7, s => s3_8, Cout => c3_8);
    f39:fullAdder port map(a => s2_9, b => part_sum3(5), Cin => c3_8, s => s3_9, Cout => c3_9);
    f310:fullAdder port map(a => s2_10, b => part_sum3(6), Cin => c3_9, s => s3_10, Cout => c3_10);
    f311:fullAdder port map(a => c2_10, b => part_sum3(7), Cin => c3_10, s => s3_11, Cout => c3_11);
    
--    nivel 4
    f41:fullAdder port map(a => s3_1, b => '0', Cin => '0', s => s4_1, Cout => c4_1);
    f42:fullAdder port map(a => s3_2, b => '0', Cin => c4_1, s => s4_2, Cout => c4_2);
    f43:fullAdder port map(a => s3_3, b => '0', Cin => c4_2, s => s4_3, Cout => c4_3);
    f44:fullAdder port map(a => s3_4, b => '0', Cin => c4_3, s => s4_4, Cout => c4_4);
    f45:fullAdder port map(a => s3_5, b => part_sum4(0), Cin => c4_4, s => s4_5, Cout => c4_5);
    f46:fullAdder port map(a => s3_6, b => part_sum4(1), Cin => c4_5, s => s4_6, Cout => c4_6);
    f47:fullAdder port map(a => s3_7, b => part_sum4(2), Cin => c4_6, s => s4_7, Cout => c4_7);
    f48:fullAdder port map(a => s3_8, b => part_sum4(3), Cin => c4_7, s => s4_8, Cout => c4_8);
    f49:fullAdder port map(a => s3_9, b => part_sum4(4), Cin => c4_8, s => s4_9, Cout => c4_9);
    f410:fullAdder port map(a => s3_10, b => part_sum4(5), Cin => c4_9, s => s4_10, Cout => c4_10);
    f411:fullAdder port map(a => s3_11, b => part_sum4(6), Cin => c4_10, s => s4_11, Cout => c4_11);
    f412:fullAdder port map(a => c3_11, b => part_sum4(7), Cin => c4_11, s => s4_12, Cout => c4_12);
    
--    nivel 5
    f51:fullAdder port map(a => s4_1, b => '0', Cin => '0', s => s5_1, Cout => c5_1);
    f52:fullAdder port map(a => s4_2, b => '0', Cin => c5_1, s => s5_2, Cout => c5_2);
    f53:fullAdder port map(a => s4_3, b => '0', Cin => c5_2, s => s5_3, Cout => c5_3);
    f54:fullAdder port map(a => s4_4, b => '0', Cin => c5_3, s => s5_4, Cout => c5_4);
    f55:fullAdder port map(a => s4_5, b => '0', Cin => c5_4, s => s5_5, Cout => c5_5);
    f56:fullAdder port map(a => s4_6, b => part_sum5(0), Cin => c5_5, s => s5_6, Cout => c5_6);
    f57:fullAdder port map(a => s4_7, b => part_sum5(1), Cin => c5_6, s => s5_7, Cout => c5_7);
    f58:fullAdder port map(a => s4_8, b => part_sum5(2), Cin => c5_7, s => s5_8, Cout => c5_8);
    f59:fullAdder port map(a => s4_9, b => part_sum5(3), Cin => c5_8, s => s5_9, Cout => c5_9);
    f510:fullAdder port map(a => s4_10, b => part_sum5(4), Cin => c5_9, s => s5_10, Cout => c5_10);
    f511:fullAdder port map(a => s4_11, b => part_sum5(5), Cin => c5_10, s => s5_11, Cout => c5_11);
    f512:fullAdder port map(a => s4_12, b => part_sum5(6), Cin => c5_11, s => s5_12, Cout => c5_12);
    f513:fullAdder port map(a => c4_12, b => part_sum5(7), Cin => c5_12, s => s5_13, Cout => c5_13);
    
--    nivel 6
    f61:fullAdder port map(a => s5_1, b => '0', Cin => '0', s => s6_1, Cout => c6_1);
    f62:fullAdder port map(a => s5_2, b => '0', Cin => c6_1, s => s6_2, Cout => c6_2);
    f63:fullAdder port map(a => s5_3, b => '0', Cin => c6_2, s => s6_3, Cout => c6_3);
    f64:fullAdder port map(a => s5_4, b => '0', Cin => c6_3, s => s6_4, Cout => c6_4);
    f65:fullAdder port map(a => s5_5, b => '0', Cin => c6_4, s => s6_5, Cout => c6_5);
    f66:fullAdder port map(a => s5_6, b => '0', Cin => c6_5, s => s6_6, Cout => c6_6);
    f67:fullAdder port map(a => s5_7, b => part_sum6(0), Cin => c6_6, s => s6_7, Cout => c6_7);
    f68:fullAdder port map(a => s5_8, b => part_sum6(1), Cin => c6_7, s => s6_8, Cout => c6_8);
    f69:fullAdder port map(a => s5_9, b => part_sum6(2), Cin => c6_8, s => s6_9, Cout => c6_9);
    f610:fullAdder port map(a => s5_10, b => part_sum6(3), Cin => c6_9, s => s6_10, Cout => c6_10);
    f611:fullAdder port map(a => s5_11, b => part_sum6(4), Cin => c6_10, s => s6_11, Cout => c6_11);
    f612:fullAdder port map(a => s5_12, b => part_sum6(5), Cin => c6_11, s => s6_12, Cout => c6_12);
    f613:fullAdder port map(a => s5_13, b => part_sum6(6), Cin => c6_12, s => s6_13, Cout => c6_13);
    f614:fullAdder port map(a => c5_13, b => part_sum6(7), Cin => c6_13, s => s6_14, Cout => c6_14);

    --nivel 7
    f71:fullAdder port map(a => s6_1, b => '0', Cin => '0', s => s7_1, Cout => c7_1);
    f72:fullAdder port map(a => s6_2, b => '0', Cin => c7_1, s => s7_2, Cout => c7_2);
    f73:fullAdder port map(a => s6_3, b => '0', Cin => c7_2, s => s7_3, Cout => c7_3);
    f74:fullAdder port map(a => s6_4, b => '0', Cin => c7_3, s => s7_4, Cout => c7_4);
    f75:fullAdder port map(a => s6_5, b => '0', Cin => c7_4, s => s7_5, Cout => c7_5);
    f76:fullAdder port map(a => s6_6, b => '0', Cin => c7_5, s => s7_6, Cout => c7_6);
    f77:fullAdder port map(a => s6_7, b => '0', Cin => c7_6, s => s7_7, Cout => c7_7);
    f78:fullAdder port map(a => s6_8, b => part_sum7(0), Cin => c7_7, s => s7_8, Cout => c7_8);
    f79:fullAdder port map(a => s6_9, b => part_sum7(1), Cin => c7_8, s => s7_9, Cout => c7_9);
    f710:fullAdder port map(a => s6_10, b => part_sum7(2), Cin => c7_9, s => s7_10, Cout => c7_10);
    f711:fullAdder port map(a => s6_11, b => part_sum7(3), Cin => c7_10, s => s7_11, Cout => c7_11);
    f712:fullAdder port map(a => s6_12, b => part_sum7(4), Cin => c7_11, s => s7_12, Cout => c7_12);
    f713:fullAdder port map(a => s6_13, b => part_sum7(5), Cin => c7_12, s => s7_13, Cout => c7_13);
    f714:fullAdder port map(a => s6_14, b => part_sum7(6), Cin => c7_13, s => s7_14, Cout => c7_14);
    f715:fullAdder port map(a => c6_14, b => part_sum7(7), Cin => c7_14, s => s7_15, Cout => c7_15);

    p(0)<=s7_1;
    p(1)<=s7_2;
    p(2)<=s7_3;
    p(3)<=s7_4;
    p(4)<=s7_5;
    p(5)<=s7_6;
    p(6)<=s7_7;
    p(7)<=s7_8;
    p(8)<=s7_9;
    p(9)<=s7_10;
    p(10)<=s7_11;
    p(11)<=s7_12;
    p(12)<=s7_13;
    p(13)<=s7_14;
    p(14)<=s7_15;
    p(15)<=c7_15;

end Behavioral;
