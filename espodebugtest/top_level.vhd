----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    13:59:25 01/05/2018 
-- Design Name: 
-- Module Name:    top_level - Behavioral 
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

entity top_level is
    Port ( CLK_100 : in  STD_LOGIC;
           edb_led_white_out : out  STD_LOGIC_VECTOR (3 downto 0);
			  edb_led_yellow_out : out  STD_LOGIC_VECTOR (3 downto 0);
			  edb_led_red_out : out  STD_LOGIC_VECTOR (3 downto 0);
			  edb_led_green_out : out  STD_LOGIC_VECTOR (3 downto 0));
end top_level;

architecture Behavioral of top_level is
	signal CLK_postdiv : STD_LOGIC := '0';
	signal LED_bus : STD_LOGIC_VECTOR (15 downto 0) := "0000000000000000";
begin

one_hot_state: entity work.one_hot_counter_16
	Port map ( CLK_IN => CLK_postdiv,
		State_Out => LED_bus);

--one_hot_state : process(CLK_postdiv)
--begin
--	if rising_edge(CLK_postdiv) then
--		LED_bus <= std_logic_vector( unsigned(LED_bus) + 1 );
--	end if;
--end process one_hot_state;

divider: entity work.binary_counter
	generic map (max_val => 9999999,
				switch_val => 5000000)
	Port map ( CLK_In => CLK_100,
			  CLK_div_out => CLK_postdiv);

edb_led_white_out <= LED_bus (15 downto 12);
edb_led_yellow_out <= LED_bus (11 downto 8);
edb_led_red_out <= LED_bus (7 downto 4);
edb_led_green_out <= LED_bus (3 downto 0);

--edb_led_white_out <= "1111";
--edb_led_yellow_out <= "1111";
--edb_led_red_out <= "1111";
--edb_led_green_out <= "1111";



end Behavioral;

