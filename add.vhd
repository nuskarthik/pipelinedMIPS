library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
--use ieee.std_logic_unsigned.all;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
use IEEE.NUMERIC_STD.ALL;

entity add is
Port (	CarryIn		: in 	STD_LOGIC;
			Operand1		: in	STD_LOGIC_VECTOR (31 downto 0);
			Operand2		: in	STD_LOGIC_VECTOR (31 downto 0);
			Sum			: out	STD_LOGIC_VECTOR (31 downto 0);
			CarryOut		: out STD_LOGIC);
end add;


architecture Behavioral of add is
   signal temp_result : unsigned (32 downto 0) := "000000000000000000000000000000000";

begin
	--33 bit unsigned addition, where the 33rd bit is the Carry
	temp_result <=  unsigned('0' & Operand1) + unsigned('0' & Operand2) + (X"00000000" & CarryIn);
	
	Sum <= std_logic_vector(temp_result (31 downto 0));
	CarryOut <= temp_result (32);
end Behavioral;

