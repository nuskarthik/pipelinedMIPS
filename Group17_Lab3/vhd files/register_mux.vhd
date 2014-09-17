
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity register_mux is
port (
	reg_dst: in STD_LOGIC;
	rt: in STD_LOGIC_VECTOR(4 downto 0);	
	rd: in STD_LOGIC_VECTOR(4 downto 0);	

	write_add: out STD_LOGIC_VECTOR(4 downto 0));
end register_mux;

architecture Behavioral of register_mux is

begin
	write_add <= rt when reg_dst = '0' else
					rd;


end Behavioral;

