
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
	reg_read_data1: in STD_LOGIC_VECTOR(31 downto 0);	
	reg_read_data2: in STD_LOGIC_VECTOR(31 downto 0);	
	sign_extended_data: in STD_LOGIC_VECTOR(31 downto 0);	
	
	read_data_output1: out STD_LOGIC_VECTOR(31 downto 0);
	read_data_output2: out STD_LOGIC_VECTOR(31 downto 0));

end alu_mux;

architecture Behavioral of alu_mux is
--decode the instr (15 to 0) into shamt and funct
signal shamt_extend : std_logic_vector(31 downto 0):= (others => '0');
signal funct: std_logic_vector (5 downto 0):= (others => '0');
begin
shamt_extend (4 downto 0) <= sign_extended_data(10 downto 6);
funct <= sign_extended_data(5 downto 0);
read_data_output2 <= shamt_extend when alusrc = "00" and (funct = "000000" or funct = "000010" or funct= "000011") 
						else reg_read_data1 when alusrc = "00" and (funct = "000100" or funct = "000110" or funct = "000111")
						else reg_read_data2 when alusrc = "00"
						else sign_extended_data when alusrc = "01"
						else shift16 when alusrc = "10" ;
						
read_data_output1 <= reg_read_data2 when alusrc = "00" and (funct = "000000" or funct = "000010" or funct= "000011" or funct = "000100" or funct = "000110" or funct = "000111")
							else reg_read_data1;

end Behavioral;
