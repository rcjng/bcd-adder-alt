-- =============================================================================================================
--   Name                           :| Ver  :| Author					:| Last Mod. Date 	:| Changes Made:
--   BCD to 7-Segment               :| V1.0 :| Robert Jiang			    :| 12/08/2021		:| Added VHDL file
-- =============================================================================================================
--   Description
--   Converts 2-bit BCD to 2-display 7-segment
-- =============================================================================================================

-- library declarations
library IEEE;
use IEEE.std_logic_1164.all;

-- entity implementation
entity bcd2_to_seg7 is 
    
    port (
        BCD : in std_logic_vector(7 downto 0);
        HEX0, HEX1 : out std_logic_vector(7 downto 0));

end bcd2_to_seg7;

-- architecture implementation
architecture bcd2_to_seg7_arch of bcd2_to_seg7 is
    
    -- upper and lower BCD nibbles 
    signal BCD1, BCD0 : std_logic_vector(3 downto 0);

begin

    BCD1 <= BCD(7 downto 4);
    BCD0 <= BCD(3 downto 0);

    with BCD1 select
    
        -- 7-segment is active low
        HEX1 <= "11000000" when "0000",
                "11111001" when "0001",
                "10100100" when "0010",
                "10110000" when "0011",
                "10011001" when "0100",
                "10010010" when "0101",
                "10000010" when "0110",
                "11111000" when "0111",
                "10000000" when "1000",
                "10010000" when "1001",
                "11111111" when others;

    with BCD0 select
        
        -- 7-segment is active low
        HEX0 <= "11000000" when "0000",
                "11111001" when "0001",
                "10100100" when "0010",
                "10110000" when "0011",
                "10011001" when "0100",
                "10010010" when "0101",
                "10000010" when "0110",
                "11111000" when "0111",
                "10000000" when "1000",
                "10010000" when "1001",
                "11111111" when others;

end bcd2_to_seg7_arch;