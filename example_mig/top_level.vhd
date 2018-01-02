----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    09:37:12 12/19/2017 
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
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity top_level is
 generic(
    C3_P0_MASK_SIZE           : integer := 4;
    C3_P0_DATA_PORT_SIZE      : integer := 32;
    C3_P1_MASK_SIZE           : integer := 4;
    C3_P1_DATA_PORT_SIZE      : integer := 32;
    C3_MEMCLK_PERIOD          : integer := 10000;
    C3_RST_ACT_LOW            : integer := 0;
    C3_INPUT_CLK_TYPE         : string := "SINGLE_ENDED";
    C3_CALIB_SOFT_IP          : string := "TRUE";
    C3_SIMULATION             : string := "FALSE";
    DEBUG_EN                  : integer := 0;
    C3_MEM_ADDR_ORDER         : string := "ROW_BANK_COLUMN";
    C3_NUM_DQ_PINS            : integer := 16;
    C3_MEM_ADDR_WIDTH         : integer := 13;
    C3_MEM_BANKADDR_WIDTH     : integer := 2
);
    port (
   mcb3_dram_dq                            : inout  std_logic_vector(C3_NUM_DQ_PINS-1 downto 0);
   mcb3_dram_a                             : out std_logic_vector(C3_MEM_ADDR_WIDTH-1 downto 0);
   mcb3_dram_ba                            : out std_logic_vector(C3_MEM_BANKADDR_WIDTH-1 downto 0);
   mcb3_dram_cke                           : out std_logic;
   mcb3_dram_ras_n                         : out std_logic;
   mcb3_dram_cas_n                         : out std_logic;
   mcb3_dram_we_n                          : out std_logic;
   mcb3_dram_dm                            : out std_logic;
   mcb3_dram_udqs                          : inout  std_logic;
   rzq3                                    : inout  std_logic;
   mcb3_dram_udm                           : out std_logic;
   c3_sys_clk                              : in  std_logic;
   c3_sys_rst_i                            : in  std_logic;
   c3_calib_done                           : out std_logic;
   c3_clk0                                 : out std_logic;
   c3_rst0                                 : out std_logic;
   mcb3_dram_dqs                           : inout  std_logic;
   mcb3_dram_ck                            : out std_logic;
   mcb3_dram_ck_n                          : out std_logic;
   c3_p0_cmd_clk                           : in std_logic;
   c3_p0_cmd_en                            : in std_logic;
   c3_p0_cmd_instr                         : in std_logic_vector(2 downto 0);
   c3_p0_cmd_bl                            : in std_logic_vector(5 downto 0);
   c3_p0_cmd_byte_addr                     : in std_logic_vector(29 downto 0);
   c3_p0_cmd_empty                         : out std_logic;
   c3_p0_cmd_full                          : out std_logic;
   c3_p0_wr_clk                            : in std_logic;
   c3_p0_wr_en                             : in std_logic;
   c3_p0_wr_mask                           : in std_logic_vector(C3_P0_MASK_SIZE - 1 downto 0);
   c3_p0_wr_data                           : in std_logic_vector(C3_P0_DATA_PORT_SIZE - 1 downto 0);
   c3_p0_wr_full                           : out std_logic;
   c3_p0_wr_empty                          : out std_logic;
   c3_p0_wr_count                          : out std_logic_vector(6 downto 0);
   c3_p0_wr_underrun                       : out std_logic;
   c3_p0_wr_error                          : out std_logic;
   c3_p0_rd_clk                            : in std_logic;
   c3_p0_rd_en                             : in std_logic;
   c3_p0_rd_data                           : out std_logic_vector(C3_P0_DATA_PORT_SIZE - 1 downto 0);
   c3_p0_rd_full                           : out std_logic;
   c3_p0_rd_empty                          : out std_logic;
   c3_p0_rd_count                          : out std_logic_vector(6 downto 0);
   c3_p0_rd_overflow                       : out std_logic;
   c3_p0_rd_error                          : out std_logic
);
end top_level;

architecture Behavioral of top_level is

begin
  u_mig_core : entity work.mig_core
    generic map (
    C3_P0_MASK_SIZE => C3_P0_MASK_SIZE,
    C3_P0_DATA_PORT_SIZE => C3_P0_DATA_PORT_SIZE,
    C3_P1_MASK_SIZE => C3_P1_MASK_SIZE,
    C3_P1_DATA_PORT_SIZE => C3_P1_DATA_PORT_SIZE,
    C3_MEMCLK_PERIOD => C3_MEMCLK_PERIOD,
    C3_RST_ACT_LOW => C3_RST_ACT_LOW,
    C3_INPUT_CLK_TYPE => C3_INPUT_CLK_TYPE,
    C3_CALIB_SOFT_IP => C3_CALIB_SOFT_IP,
    C3_SIMULATION => C3_SIMULATION,
    DEBUG_EN => DEBUG_EN,
    C3_MEM_ADDR_ORDER => C3_MEM_ADDR_ORDER,
    C3_NUM_DQ_PINS => C3_NUM_DQ_PINS,
    C3_MEM_ADDR_WIDTH => C3_MEM_ADDR_WIDTH,
    C3_MEM_BANKADDR_WIDTH => C3_MEM_BANKADDR_WIDTH
)
    port map (

    c3_sys_clk  =>         c3_sys_clk,
  c3_sys_rst_i    =>       c3_sys_rst_i,                        

  mcb3_dram_dq       =>    mcb3_dram_dq,  
  mcb3_dram_a        =>    mcb3_dram_a,  
  mcb3_dram_ba       =>    mcb3_dram_ba,
  mcb3_dram_ras_n    =>    mcb3_dram_ras_n,                        
  mcb3_dram_cas_n    =>    mcb3_dram_cas_n,                        
  mcb3_dram_we_n     =>    mcb3_dram_we_n,                          
  mcb3_dram_cke      =>    mcb3_dram_cke,                          
  mcb3_dram_ck       =>    mcb3_dram_ck,                          
  mcb3_dram_ck_n     =>    mcb3_dram_ck_n,       
  mcb3_dram_dqs      =>    mcb3_dram_dqs,                          
  mcb3_dram_udqs  =>       mcb3_dram_udqs,    -- for X16 parts           
  mcb3_dram_udm  =>        mcb3_dram_udm,     -- for X16 parts
  mcb3_dram_dm  =>       mcb3_dram_dm,
    c3_clk0	=>	        c3_clk0,
  c3_rst0		=>        c3_rst0,
	
 
  c3_calib_done      =>    c3_calib_done,
  
   mcb3_rzq         =>            rzq3,
   
     c3_p0_cmd_clk                           =>  c3_p0_cmd_clk,
   c3_p0_cmd_en                            =>  c3_p0_cmd_en,
   c3_p0_cmd_instr                         =>  c3_p0_cmd_instr,
   c3_p0_cmd_bl                            =>  c3_p0_cmd_bl,
   c3_p0_cmd_byte_addr                     =>  c3_p0_cmd_byte_addr,
   c3_p0_cmd_empty                         =>  c3_p0_cmd_empty,
   c3_p0_cmd_full                          =>  c3_p0_cmd_full,
   c3_p0_wr_clk                            =>  c3_p0_wr_clk,
   c3_p0_wr_en                             =>  c3_p0_wr_en,
   c3_p0_wr_mask                           =>  c3_p0_wr_mask,
   c3_p0_wr_data                           =>  c3_p0_wr_data,
   c3_p0_wr_full                           =>  c3_p0_wr_full,
   c3_p0_wr_empty                          =>  c3_p0_wr_empty,
   c3_p0_wr_count                          =>  c3_p0_wr_count,
   c3_p0_wr_underrun                       =>  c3_p0_wr_underrun,
   c3_p0_wr_error                          =>  c3_p0_wr_error,
   c3_p0_rd_clk                            =>  c3_p0_rd_clk,
   c3_p0_rd_en                             =>  c3_p0_rd_en,
   c3_p0_rd_data                           =>  c3_p0_rd_data,
   c3_p0_rd_full                           =>  c3_p0_rd_full,
   c3_p0_rd_empty                          =>  c3_p0_rd_empty,
   c3_p0_rd_count                          =>  c3_p0_rd_count,
   c3_p0_rd_overflow                       =>  c3_p0_rd_overflow,
   c3_p0_rd_error                          =>  c3_p0_rd_error
);

end Behavioral;

