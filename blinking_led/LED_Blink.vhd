----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    14:47:41 12/12/2017 
-- Design Name: 
-- Module Name:    LED_Blink - Behavioral 
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

use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity LED_Blink is
	port (
		CLK_100MHz: in std_logic;
		LED_out: out std_logic
	);
end LED_Blink;

architecture Behavioral of LED_Blink is
	signal prescaler_count: std_logic_vector(25 downto 0);  --This rings of bad form, but I'll follow as is and rewrite later.
	signal scaled_CLK_1Hz: std_logic;
begin

--Prescale the clock
	prescaler: process(CLK_100MHz)
	begin
		if rising_edge(CLK_100MHz) then
			if prescaler_count < "10111110101111000010000000" then  --50,000,000
				prescaler_count <= prescaler_count +1;
			else
				prescaler_count <= (others => '0');
			end if;
		end if;
		
		if prescaler_count < "01011111010111100001000000" then
			scaled_CLK_1Hz <= '1';
		else 
			scaled_CLK_1Hz <= '0';
		end if;

	end process prescaler;

--Feed the prescaled clock into the LED
LED_out <= scaled_CLK_1Hz;


end Behavioral;

