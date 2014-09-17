----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    15:03:52 11/07/2013 
-- Design Name: 
-- Module Name:    shift_mux - Behavioral 
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

entity shift_mux is
port (
	alu_src : in std_logic_vector (1 downto 0);
	funct : in std_logic_vector (5 downto 0);
	read_data1 : in std_logic_vector (31 downto 0);
	shamt : in std_logic_vector (4 downto 0);
	alu_operand1 : in std_logic_vector (31 downto 0));
end shift_mux;

architecture Behavioral of shift_mux is
signal shift_shamt: std_logic_vector(31 downto 0):= (others => '0');
begin
shift_shamt (4 downto 0) <= shamt; 
alu_operand1 <= shift_shamt when alu_src = "00" and (funct = "000000" or funct = "000010" or funct= "000011") else
					 read_data1;

end Behavioral;

