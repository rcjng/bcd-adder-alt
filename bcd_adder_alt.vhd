-- =============================================================================================================
--   Name                           :| Ver  :| Author					:| Last Mod. Date 	:| Changes Made:
--   BCD Adder (Alt)                :| V1.0 :| Robert Jiang			    :| 12/11/2021		:| Added VHDL file
-- =============================================================================================================
--   Description
--   Calculates the 2-digit BCD sum of two 1-digit BCD numbers taken as input in an alternate way
-- =============================================================================================================

-- library declarations
library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

-- entity implementation
entity bcd_adder_alt is 
    
    port (
        A, B : in std_logic_vector (3 downto 0);
        C_in : in std_logic_vector (0 downto 0);
        BCD : out std_logic_vector (7 downto 0));

end bcd_adder_alt;

-- architecture implementation
architecture bcd_adder_alt_arch of bcd_adder_alt is

    signal T, Z, S_int, A_u, B_u, C_in_u : integer;
    signal S_1, S_0 : std_logic_vector (3 downto 0);

begin

    add : process(A, B, C_in) is
    begin
        
        A_u <= to_integer(unsigned(A));
    
        B_u <= to_integer(unsigned(B));

        C_in_u <= to_integer(unsigned(C_in));

        T <= A_u + B_u + C_in_u;

        if (T > 9) then 
            Z <= 10;
            S_1 <= "0001";
        else
            Z <= 0;
            S_1 <= "0000"; 
        end if;

        S_int <= T - Z;

        S_0 <= std_logic_vector(to_unsigned(S_int, S_0'length));

    end process add;

    BCD <= S_1 & S_0;

end bcd_adder_alt_arch;