library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity control_unit is
    port ( op : in STD_LOGIC_VECTOR(5 downto 0);
			  memory_read : out std_logic;
			  memory_write : out std_logic;
			  memory_register : out std_logic;
			  reg_write : out std_logic;
			  link_enable : out std_logic_vector (1 downto 0);

			  alu_src : out std_logic_vector (1 downto 0);
			  alu_op : out std_logic_vector( 2 downto 0);
			  
			  branch : out std_logic;
			  jump : out std_logic_vector (1 downto 0);
			  reg_dst : out std_logic);
end control_unit;

architecture BEHAVIORAL of control_unit is

begin

jump <= "01" when op = "000010" or op = "000011" else 
		  "10" when op = "000000" else
		  "00";

branch <= '1' when (op = "000100" or op = "000001") else '0';

reg_dst <= '1' when op = "000000" else 
				 '0' when op = "100011" or op = "101011" or op = "001111" or op = "001101" or op = "001000" or op = "001010";

memory_write <= '1' when op = "101011" else '0';
memory_read <= '1' when op = "100011" else '0';
memory_register <= '1' when op = "100011" else '0';


alu_src <= "01" when op = "100011" or op = "101011" or op = "001101" or op = "001000" or op = "001010" else
			  "10" when op = "001111" 
			  else "00"; 
         
reg_write <= '1' when op = "100011" or op = "000000" or op = "001111" or op = "001101" or op = "001000" or op = "001010" else '0';
link_enable <= "01" when op = "000001" else
					"10" when op = "000011"
					else "00";


alu_op <= "000" when op = "000000" else
			  "001" when op = "000100" else
			  "010" when op = "100011" or op = "101011" or op = "001111" or op = "001000" else
			  "011" when op = "001101" else
			  "100" when op = "000001" else --bgez/bgezal
			  "101" when op = "001010"; --slti
			  
	
end BEHAVIORAL;
