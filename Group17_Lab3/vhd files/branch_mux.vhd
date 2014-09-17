library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity branch_mux is
port (
	alu_zero : in std_logic;
	branch : in std_logic;
	pc_add : in std_logic_vector (31 downto 0);
	branch_add : in std_logic_vector (31 downto 0);
	branch_pc : out std_logic_vector(31 downto 0)
);

end branch_mux;

architecture Behavioral of branch_mux is

begin
branch_pc <= pc_add when (alu_zero = '0' or branch = '0')  else
				branch_add;

end Behavioral;

