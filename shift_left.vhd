----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    19:00:57 10/28/2013 
-- Design Name: 
-- Module Name:    shift_left - Behavioral 
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

entity shift_left is
port (
		 sign_extend_add : in std_logic_vector (31 downto 0);
		 shift_add : out std_logic_vector( 31 downto 0));
end shift_left;

architecture Behavioral of shift_left is
signal temp_shift : std_logic_vector (31 downto 0) := (others => '0');

begin
temp_shift(31 downto 2) <= sign_extend_add(29 downto 0);
shift_add <= temp_shift;
end Behavioral;

