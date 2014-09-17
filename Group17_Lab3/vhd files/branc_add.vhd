library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.STD_LOGIC_UNSIGNED.all;

entity branch_add is
	port (
		pc				:	in STD_LOGIC_VECTOR (31 downto 0);
		shifted_add	:	in STD_LOGIC_VECTOR (31 downto 0);
		pc_out		:	out STD_LOGIC_VECTOR (31 downto 0)
);
end branch_add;

architecture BEHAVIORAL of branch_add is

begin
pc_out <= pc + shifted_add;

end BEHAVIORAL;