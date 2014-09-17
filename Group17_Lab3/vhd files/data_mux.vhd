library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity data_mux is
port(
	mem_reg: in STD_LOGIC;
	memory_data: in STD_LOGIC_VECTOR(31 downto 0);	
	alu_data: in STD_LOGIC_VECTOR(31 downto 0);	
	
	memory_data_output: out STD_LOGIC_VECTOR(31 downto 0));
end data_mux;

architecture Behavioral of data_mux is

begin
memory_data_output <= alu_data when mem_reg = '0'
						else memory_data;

end Behavioral;

