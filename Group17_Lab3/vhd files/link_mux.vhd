
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity link_mux is
port (
	funct : in std_logic_vector (5 downto 0);
	link_enable : in std_logic_vector (1 downto 0);
	sub : in std_logic_vector (4 downto 0);
	link_write : out std_logic	);
end link_mux;

architecture Behavioral of link_mux is

begin
link_write <= '1' when (link_enable = "01" and sub="10001") or link_enable = "10" or (link_enable = "00" and funct = "001001") else
					'0';

end Behavioral;

