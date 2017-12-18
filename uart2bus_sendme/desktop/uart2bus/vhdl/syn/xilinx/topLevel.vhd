----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    13:49:29 12/13/2017 
-- Design Name: 
-- Module Name:    topLevel - Behavioral 
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

entity topLevel is
    Port ( CLK_In : in  STD_LOGIC;
			  Debug_in : in STD_LOGIC;
			  Debug_out : out STD_LOGIC;
           Serial_Tx_In : in  STD_LOGIC;
			  Serial_Rx_Out : out  STD_LOGIC;
           LED_Out : out STD_LOGIC);
end topLevel;

architecture Behavioral of topLevel is
	signal reset_state : STD_LOGIC := '1';
	signal data_to_write : STD_LOGIC_VECTOR(7 downto 0);
	signal data_to_read : STD_LOGIC_VECTOR(7 downto 0);
	signal address : STD_LOGIC_VECTOR(7 downto 0);
	signal write_enable_pulse : STD_LOGIC := '0';
	signal read_enable_pulse : STD_LOGIC := '0';
	signal debug_internal : STD_LOGIC := '0';
begin

--Reset on first clock cycle
initial_reset : process (CLK_In)
begin
	if rising_edge(CLK_In) then
		reset_state <= '0';  --Set the reset state to 0 immediately, after 1 clock cycle;
	end if;
end process initial_reset;

--The Serial Port to the UART Module
uart: entity work.uart2BusTop
  port map ( -- global signals
         clr => reset_state,                         
         clk => CLK_In,                          
         -- uart serial signals
         serIn => Serial_Tx_In,                          
         serOut => Serial_Rx_Out,                         
         -- internal bus to register file
         --intAccessReq => ,                          --
         intAccessGnt => '1' ,                          --
         intRdData => data_to_read,      -- data read from register file
         intAddress => address, -- address bus to register file
         intWrData => data_to_write,      -- write data to register file
         intWrite => write_enable_pulse,                          -- write control to register file
         intRead => read_enable_pulse);                         -- read control to register file

--Connect the UART Module's Output to the LED
byte_received: process (write_enable_pulse)
begin
	if rising_edge(write_enable_pulse) then
		LED_Out <= data_to_write(0);
	end if;
end process byte_received;

debug_internal <= Debug_in;
Debug_Out <= debug_internal;


end Behavioral;

