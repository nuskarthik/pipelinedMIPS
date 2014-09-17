library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity sign_extension is
port (
	reg_in: in STD_LOGIC_VECTOR(15 downto 0);	
	reg_out_32: out STD_LOGIC_VECTOR(31 downto 0));
end sign_extension;

architecture Behavioral of sign_extension is

begin
	reg_out_32 <= (X"FFFF" & reg_in) when  reg_in(15) = '1'
						else X"0000" & reg_in;

end Behavioral;

