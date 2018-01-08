---------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    10:52:21 01/08/2018 
-- Design Name: 
-- Module Name:    one_hot_counter_16 - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
-- Description: 
--
-- Dependencies: 
--
-- Revision: 
-- Revision 0.01 - File Created
-- Additional Comments: 
--
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity one_hot_counter_16 is
    Port ( CLK_IN : in  STD_LOGIC;
           State_Out : out  STD_LOGIC_VECTOR (15 downto 0));
end one_hot_counter_16;

architecture Behavioral of one_hot_counter_16 is
	signal state_internal : STD_LOGIC_VECTOR (15 downto 0) := "0000000000000000";
begin

	state_change: process(CLK_In)
	begin
		if rising_edge(CLK_In) then
			case_statement: case state_internal is
					when "0000000000000000" => state_internal <= "0000000000000001";
					when "0000000000000001" => state_internal <= "0000000000000010";
					when "0000000000000010" => state_internal <= "0000000000000100";
					when "0000000000000100" => state_internal <= "0000000000001000";
					when "0000000000001000" => state_internal <= "0000000000010000";
					when "0000000000010000" => state_internal <= "0000000000100000";
					when "0000000000100000" => state_internal <= "0000000001000000";
					when "0000000001000000" => state_internal <= "0000000010000000";
					when "0000000010000000" => state_internal <= "0000000100000000";
					when "0000000100000000" => state_internal <= "0000001000000000";
					when "0000001000000000" => state_internal <= "0000010000000000";
					when "0000010000000000" => state_internal <= "0000100000000000";
					when "0000100000000000" => state_internal <= "0001000000000000";
					when "0001000000000000" => state_internal <= "0010000000000000";
					when "0010000000000000" => state_internal <= "0100000000000000";
					when "0100000000000000" => state_internal <= "1000000000000000";
					when others => state_internal <= "0000000000000001";
			end case case_statement;
		end if;
	end process state_change;

	State_Out <= state_internal;

end Behavioral;

