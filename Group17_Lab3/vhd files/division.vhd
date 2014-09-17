library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity division is
port (
		clk 			: in std_logic;
		div_enable	: in std_logic;	
		Dividend		: in	STD_LOGIC_VECTOR (31 downto 0);
		Divisor		: in	STD_LOGIC_VECTOR (31 downto 0);
		Quotient		: out	STD_LOGIC_VECTOR (31 downto 0);
		Remainder	: out	STD_LOGIC_VECTOR (31 downto 0)
);
end division;

architecture Behavioral of division is
begin

process (clk)

variable count: unsigned (5 downto 0) := "000000";
variable temp_divisor: unsigned(63 downto 0):= (others => '0');
variable current_remainder: unsigned (63 downto 0):= (others => '0');
variable temp_remainder: unsigned(63 downto 0):= (others => '0');
variable temp_quotient: unsigned (31 downto 0):= (others => '0');

begin 
	if (clk'event and clk = '1') then
		if div_enable = '1' then
			if divisor = x"00000000" then
				Quotient <= x"00000000";
				Remainder <= x"00000000";
			else
				if count = "000000" then
					current_remainder := x"00000000" & unsigned(Dividend);
					temp_divisor := unsigned(Divisor) & x"00000000";
							
					temp_remainder := (others => '0');
					temp_quotient := (others => '0');
				end if;
				if count < "100001"	then
						--Loop 32 times in one clock cylce
						temp_remainder:= current_remainder;
						current_remainder := current_remainder - temp_divisor;
						if current_remainder(63)='1' then
							temp_quotient(31 downto 0) := temp_quotient(30 downto 0) & '0';
							current_remainder := temp_remainder;
						else
							temp_quotient(31 downto 0) := temp_quotient(30 downto 0) & '1';
						end if;
						
						temp_divisor(63 downto 0) := '0' & temp_divisor(63 downto 1);
					count := count + 1;
				elsif count = "100001" then
					Quotient <= std_logic_vector(temp_quotient);
					Remainder <= std_logic_vector(current_remainder (31 downto 0));
				end if;	
			end if;
		else
			count := (others => '0');
		end if;
	end if;

end process;

end Behavioral;
