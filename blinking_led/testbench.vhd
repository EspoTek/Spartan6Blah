--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   15:51:34 12/12/2017
-- Design Name:   
-- Module Name:   C:/Users/Esposch/Documents/Xilinx/blinking_led/testbench.vhd
-- Project Name:  blinking_led
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: LED_Blink
-- 
-- Dependencies:
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
--
-- Notes: 
-- This testbench has been automatically generated using types std_logic and
-- std_logic_vector for the ports of the unit under test.  Xilinx recommends
-- that these types always be used for the top-level I/O of a design in order
-- to guarantee that the testbench will bind correctly to the post-implementation 
-- simulation model.
--------------------------------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY testbench IS
END testbench;
 
ARCHITECTURE behavior OF testbench IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT LED_Blink
    PORT(
         CLK_100MHz : IN  std_logic;
         LED_out : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal CLK_100MHz : std_logic := '0';

 	--Outputs
   signal LED_out : std_logic;

   -- Clock period definitions
   constant CLK_100MHz_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: LED_Blink PORT MAP (
          CLK_100MHz => CLK_100MHz,
          LED_out => LED_out
        );

   -- Clock process definitions
   CLK_100MHz_process :process
   begin
		CLK_100MHz <= '0';
		wait for CLK_100MHz_period/2;
		CLK_100MHz <= '1';
		wait for CLK_100MHz_period/2;
   end process;
 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      wait for 100 ns;	

      --wait for CLK_100MHz_period*10;

      -- insert stimulus here 

      --wait;
   end process;

END;
