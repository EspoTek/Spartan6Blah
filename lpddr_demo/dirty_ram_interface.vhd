----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    15:23:11 01/08/2018 
-- Design Name: 
-- Module Name:    dirty_ram_interface - Behavioral 
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

entity dirty_ram_interface is
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
    Port (
	--My signals
		-- Note: already have a CLK
	instruction_pulse : in std_logic;
	address : in std_logic_vector (15 downto 0);  --Top byte is read_writebar
	grant_access : out std_logic;  --OUT
	write_data_in : in std_logic_vector (7 downto 0);
	
	--MIG signals
   c3_clk0 : in  std_logic;
	c3_rst0 : in  std_logic;
   
	c3_p0_cmd_clk : out std_logic;  --OUT_DONE
	c3_p0_cmd_en : out std_logic;  --OUT_DONE
	c3_p0_cmd_instr : out std_logic_vector (2 downto 0);  --OUT_DONE
	c3_p0_cmd_bl : out std_logic_vector (5 downto 0);  --OUT_DONE
	c3_p0_cmd_byte_addr : out std_logic_vector (29 downto 0);  --OUT_DONE
	c3_p0_cmd_empty : in std_logic;
	--c3_p0_cmd_full : in std_logic;
	c3_p0_wr_clk : out std_logic;  --OUT_DONE
	c3_p0_wr_en : out std_logic;  --OUT_DONE
	c3_p0_wr_mask : out std_logic_vector (C3_P0_MASK_SIZE - 1 downto 0);  --OUT_DONE
	c3_p0_wr_data : out std_logic_vector(C3_P0_DATA_PORT_SIZE - 1 downto 0);  --OUT_DONE
	--c3_p0_wr_full : in std_logic;
	c3_p0_wr_empty : in std_logic;
	--c3_p0_wr_count : in std_logic_vector (6 downto 0);
	--c3_p0_wr_underrun : in std_logic;
	--c3_p0_wr_error : in std_logic;
	c3_p0_rd_clk : out std_logic;  --OUT_DONE
	c3_p0_rd_en : out std_logic;  --OUT_DONE
	--c3_p0_rd_data : in std_logic_vector(C3_P0_DATA_PORT_SIZE - 1 downto 0);
	--c3_p0_rd_full : in std_logic;
	c3_p0_rd_empty : in std_logic
	--c3_p0_rd_count : in std_logic_vector (6 downto 0);
	--c3_p0_rd_overflow : in std_logic;
	--c3_p0_rd_error : in std_logic
);
end dirty_ram_interface;

architecture Behavioral of dirty_ram_interface is
	signal read_writebar : std_logic := '0';
	signal c3_p0_cmd_en_delayed_1 : std_logic := '0';
	--Do I need to buffer the address??
begin
	--My Assigns
	read_writebar <= address (15);
	grant_access <= c3_p0_wr_empty and c3_p0_rd_empty and c3_p0_cmd_empty;
	
	
	--Mig Assigns
	
	--CLK
	c3_p0_cmd_clk <= c3_clk0;
	c3_p0_wr_clk <= c3_clk0;
	c3_p0_rd_clk <= c3_clk0;
	
	--Write Path
	c3_p0_wr_en <= not read_writebar and instruction_pulse;
	c3_p0_wr_mask <= "0001";  --Ignore all but LSB;
	c3_p0_wr_data <= "000000000000000000000000" & write_data_in;  --Top 3 bytes are ignored.

	--Read Path
	c3_p0_rd_en <= read_writebar and instruction_pulse;

	--Command Path
	c3_p0_cmd_en <= (not c3_p0_rd_empty) or (not c3_p0_wr_empty);
	c3_p0_cmd_instr(2) <= '0';
	c3_p0_cmd_instr(1) <= '0';
	c3_p0_cmd_instr(0) <= not c3_p0_rd_empty;  --Read if there's something in the read buffer (it's not empty), otherwise write.
	--Possible race condition from above!
	c3_p0_cmd_byte_addr <= "0000000000000" & address (14 downto 0) & "00";
	c3_p0_cmd_bl <= "000000"; --Always 1 word.
		
end Behavioral;

