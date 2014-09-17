----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    18:29:20 10/28/2013 
-- Design Name: 
-- Module Name:    alu_mux - Behavioral 
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

entity alu_mux is

port (
	alusrc: in STD_LOGIC_VECTOR (1 downto 0);
	shift16 : in STD_LOGIC_VECTOR (31 downto 0);
	reg_read_data: in STD_LOGIC_VECTOR(31 downto 0);	
	sign_extended_data: in STD_LOGIC_VECTOR(31 downto 0);	
	
	read_data_output: out STD_LOGIC_VECTOR(31 downto 0));

end alu_mux;

architecture Behavioral of alu_mux is
--decode the instr (15 to 0) into shamt and funct
signal shamt_extend : std_logic_vector(31 downto 0):= (others => '0');
signal funct: std_logic_vector (5 downto 0):= (others => '0');
begin
shamt_extend (4 downto 0) <= sign_extended_data(10 downto 6);
funct <= sign_extended_data(5 downto 0);
read_data_output <= shamt_extend when alusrc = "00" and (funct = "000000" or funct = "000010" or funct= "000011") 
						else reg_read_data when alusrc = "00"
						else sign_extended_data when alusrc = "01"
						else shift16 when alusrc = "10";
						

end Behavioral;
