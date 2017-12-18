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

--Debug input
debug_internal <= Debug_in;
Debug_Out <= debug_internal;

--DDR RAM Controller
  u_saturn_lpddr_100MHz_nodebug : entity work.saturn_lpddr_100MHz_nodebug
    --generic map (
    --C3_P0_MASK_SIZE => C3_P0_MASK_SIZE,
    --C3_P0_DATA_PORT_SIZE => C3_P0_DATA_PORT_SIZE,
    --C3_P1_MASK_SIZE => C3_P1_MASK_SIZE,
    --C3_P1_DATA_PORT_SIZE => C3_P1_DATA_PORT_SIZE,
    --C3_MEMCLK_PERIOD => C3_MEMCLK_PERIOD,
    --C3_RST_ACT_LOW => C3_RST_ACT_LOW,
    --C3_INPUT_CLK_TYPE => C3_INPUT_CLK_TYPE,
    --C3_CALIB_SOFT_IP => C3_CALIB_SOFT_IP,
    --C3_SIMULATION => C3_SIMULATION,
    --DEBUG_EN => DEBUG_EN,
    --C3_MEM_ADDR_ORDER => C3_MEM_ADDR_ORDER,
    --C3_NUM_DQ_PINS => C3_NUM_DQ_PINS,
    --C3_MEM_ADDR_WIDTH => C3_MEM_ADDR_WIDTH,
    --C3_MEM_BANKADDR_WIDTH => C3_MEM_BANKADDR_WIDTH
--)
    port map (

    c3_sys_clk  =>         '0',
  c3_sys_rst_i    =>       '0',                        

  --mcb3_dram_dq       =>    b"zzzzzzzzzzzzzzzz",  
  --mcb3_dram_a        =>    b"0000000000000",  
  --mcb3_dram_ba       =>    b"00",
  --mcb3_dram_ras_n    =>    '0',                        
  --mcb3_dram_cas_n    =>    '0',                        
  --mcb3_dram_we_n     =>    '0',                          
  --mcb3_dram_cke      =>    '0',                          
  --mcb3_dram_ck       =>    '0',                          
  --mcb3_dram_ck_n     =>    '0',       
  --mcb3_dram_dqs      =>    '0',                          
  --mcb3_dram_udqs  =>       '0',    -- for X16 parts           
  --mcb3_dram_udm  =>        '0',     -- for X16 parts
  --mcb3_dram_dm  =>       '0',
  --  c3_clk0	=>	        '0',
  --c3_rst0		=>        '0',
	
 
  --c3_calib_done      =>    '0',
  
   --mcb3_rzq         =>            'z',
   
     c3_p0_cmd_clk                           =>  '0',
   c3_p0_cmd_en                            =>  '0',
   c3_p0_cmd_instr                         =>  b"000",
   c3_p0_cmd_bl                            =>  b"000000",
   c3_p0_cmd_byte_addr                     =>  b"000000000000000000000000000000",
   --c3_p0_cmd_empty                         =>  '0',
   --c3_p0_cmd_full                          =>  '0',
   c3_p0_wr_clk                            =>  '0',
   c3_p0_wr_en                             =>  '0',
   c3_p0_wr_mask                           =>  b"0000",
   c3_p0_wr_data                           =>  x"00000000",
   --c3_p0_wr_full                           =>  '0',
   --c3_p0_wr_empty                          =>  '0',
   --c3_p0_wr_count                          =>  b"0000000",
   --c3_p0_wr_underrun                       =>  '0',
   --c3_p0_wr_error                          =>  '0',
   c3_p0_rd_clk                            =>  '0',
   c3_p0_rd_en                             =>  '0'
   --c3_p0_rd_data                           =>  x"00000000",
   --c3_p0_rd_full                           =>  '0',
   --c3_p0_rd_empty                          =>  '0',
   --c3_p0_rd_count                          =>  b"0000000",
   --c3_p0_rd_overflow                       =>  '0',
   --3_p0_rd_error                          =>  '0'
);


end Behavioral;

