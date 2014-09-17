library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity jump_mux is

port (
	funct : in std_logic_vector (5 downto 0);
	jump: in STD_LOGIC_VECTOR (1 downto 0);
	jump_pc: in STD_LOGIC_VECTOR(31 downto 0);	
	branch_pc: in STD_LOGIC_VECTOR(31 downto 0);	
	link_pc: in std_logic_vector(31 downto 0);
	pc_out: out STD_LOGIC_VECTOR(31 downto 0));

end jump_mux;

architecture Behavioral of jump_mux is

begin
pc_out <= jump_pc when jump = "01" else
			 link_pc when jump = "10" and (funct = "001000" or funct ="001001")
			else  branch_pc;
end behavioral;
