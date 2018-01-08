----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    16:29:28 01/05/2018 
-- Design Name: 
-- Module Name:    binary_counter - Behavioral 
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
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity binary_counter is
	generic (max_val : natural;
				switch_val: natural);
   Port ( CLK_In : in  STD_LOGIC;
           CLK_div_out : out  STD_LOGIC);
end binary_counter;

architecture Behavioral of binary_counter is
	signal count : integer range 0 to max_val;
begin
	incrementer: process(CLK_In)
	begin
	
		--sync
		if rising_edge(CLK_In) then
			if count = max_val then
				count <= 0;
			else 
				count <= count+1;
			end if;
			
		if count >= switch_val then
			CLK_div_out <= '1';
		else
			CLK_div_out <= '0';
		end if;

		end if;
		--async (none!)
	end process incrementer;
	
end Behavioral;

