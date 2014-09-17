----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    19:11:14 10/28/2013 
-- Design Name: 
-- Module Name:    jump_add - Behavioral 
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
use ieee.std_logic_unsigned.all;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity jump_add is
port (
		 pc : in std_logic_vector (31 downto 0);
		 jump_offset : in std_logic_vector (25 downto 0);
		 added_pc : out std_logic_vector (31 downto 0));
end jump_add;

architecture Behavioral of jump_add is

signal temp_shift : std_logic_vector (31 downto 0):= (others => '0');
begin
temp_shift (27 downto 2) <= jump_offset;
temp_shift (31 downto 28) <= pc (31 downto 28);
--temp_shift <= temp_shift - x"00003000"; -- subtract initial offset
added_pc <= temp_shift - x"00003000";
end Behavioral;

