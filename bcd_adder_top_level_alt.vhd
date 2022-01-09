-- =============================================================================================================
--   Name                           :| Ver  :| Author					:| Last Mod. Date 	:| Changes Made:
--   BCD Adder Top Level (Alt)      :| V1.0 :| Robert Jiang			    :| 12/11/2021		:| Added VHDL file
-- =============================================================================================================
--   Description
--   Calculates and outputs the sum of two 4-bit BCD numbers on 6-display 7-segment in an alternate way
-- =============================================================================================================

-- library declarations
library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

-- entity implementation
entity bcd_adder_top_level_alt is 
    
    port (
        A, B : in std_logic_vector (3 downto 0);
        C_in : in std_logic_vector (0 downto 0);
        HEX0, HEX1 : out std_logic_vector (7 downto 0));
        
end bcd_adder_top_level_alt;

-- architecture implementation
architecture bcd_adder_top_level_alt_arch of bcd_adder_top_level_alt is
    
    component bcd_adder_alt is 

        port (
            A, B : in std_logic_vector (3 downto 0);
            C_in : in std_logic_vector (0 downto 0);
            BCD : out std_logic_vector (7 downto 0));

    end component;

    component bcd2_to_seg7 is 

        port (
            BCD : in std_logic_vector(7 downto 0);
            HEX0, HEX1 : out std_logic_vector(7 downto 0));

    end component;

    signal S : std_logic_vector(7 downto 0);      

begin
    
    add : bcd_adder_alt port map (A => A, B => B, C_in => C_in, BCD => S);
    
    to_7seg : bcd2_to_seg7 port map (BCD => S, HEX0 => HEX0, HEX1 => HEX1);

end bcd_adder_top_level_alt_arch;