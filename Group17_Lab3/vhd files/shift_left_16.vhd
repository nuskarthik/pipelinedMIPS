
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity shift_left_16 is
port (
	immediate : in std_logic_vector (15 downto 0);
	shift_left_out : out std_logic_vector (31 downto 0)
);
end shift_left_16;

architecture Behavioral of shift_left_16 is

signal temp_shift : std_logic_vector(31 downto 0) := (others => '0');

begin

temp_shift (31 downto 16) <= immediate;
shift_left_out <= temp_shift;

end Behavioral;

