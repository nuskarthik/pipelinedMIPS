library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.STD_LOGIC_UNSIGNED.all;

entity pc_add is
	port (
		pcinp:		in STD_LOGIC_VECTOR (31 downto 0);
		pc_added:	out  STD_LOGIC_VECTOR (31 downto 0)
);

end pc_add;

architecture BEHAVIORAL of pc_add is

signal new_pc : STD_LOGIC_VECTOR (31 downto 0);
begin

new_pc <= pcinp + 4;
pc_added <= new_pc;

end BEHAVIORAL;

