library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity ifid is
port (
stall : in std_logic;
	instruction_in : in std_logic_vector (31 downto 0);
	instruction_out : out std_logic_vector (31 downto 0);
	pc_add_in : in std_logic_vector (31 downto 0);
	pc_add_out : out std_logic_vector (31 downto 0);
	clk : in std_logic
);

end ifid;

architecture Behavioral of ifid is

begin

process (clk)
begin

if (clk'event and clk = '0' and stall = '0') then
	instruction_out <= instruction_in;
	pc_add_out <= pc_add_in;
end if;

end process;

end Behavioral;

