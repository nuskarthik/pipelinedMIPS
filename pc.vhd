library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.STD_LOGIC_UNSIGNED.all;

entity pc is
	port (
		clk:	in STD_LOGIC;
		reset:	in STD_LOGIC;
		input:	in STD_LOGIC_VECTOR (31 downto 0);
		pc_out:	out STD_LOGIC_VECTOR (31 downto 0));
end pc;


architecture BEHAVIORAL of pc is
signal temp_pc: STD_LOGIC_VECTOR (31 downto 0):= (others => '0');

begin

process (clk, reset)
begin
	if reset = '1' then
		temp_pc <= X"00000000";
	else 
      if (clk'event and clk = '0') then
			temp_pc <= input;
		end if;
	end if;
end process;

pc_out <= temp_pc;

end BEHAVIORAL;