library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity register_file is
port (
	reg_write: in STD_LOGIC;
	link_write: in STD_LOGIC;
	clk: in STD_LOGIC;
	reset: in STD_LOGIC;

	link_data: in std_logic_vector(31 downto 0);
	read_add1: in STD_LOGIC_VECTOR(4 downto 0);
	read_add2: in STD_LOGIC_VECTOR(4 downto 0);
	write_add: in STD_LOGIC_VECTOR(4 downto 0);
	write_data: in STD_LOGIC_VECTOR(31 downto 0);

	read_data1: out STD_LOGIC_VECTOR(31 downto 0);
	read_data2: out STD_LOGIC_VECTOR(31 downto 0)
	);
end register_file;

architecture BEHAVIORAL of register_file is
--------------------------------------------
-- Component declarations.
--------------------------------------------

--------------------------------------------
-- Signal declarations.
--------------------------------------------

-- INTERNAL REGISTERS.
	signal REG00: STD_LOGIC_VECTOR(31 downto 0):= (others => '0');
	signal REG01: STD_LOGIC_VECTOR(31 downto 0):= (others => '0');
	signal REG02: STD_LOGIC_VECTOR(31 downto 0):= (others => '0');
	signal REG03: STD_LOGIC_VECTOR(31 downto 0):= (others => '0');
	signal REG04: STD_LOGIC_VECTOR(31 downto 0):= (others => '0');
	signal REG05: STD_LOGIC_VECTOR(31 downto 0):= (others => '0');
	signal REG06: STD_LOGIC_VECTOR(31 downto 0):= (others => '0');
	signal REG07: STD_LOGIC_VECTOR(31 downto 0):= (others => '0');
	signal REG08: STD_LOGIC_VECTOR(31 downto 0):= (others => '0');
	signal REG09: STD_LOGIC_VECTOR(31 downto 0):= (others => '0');
	signal REG10: STD_LOGIC_VECTOR(31 downto 0):= (others => '0');
	signal REG11: STD_LOGIC_VECTOR(31 downto 0):= (others => '0');
	signal REG12: STD_LOGIC_VECTOR(31 downto 0):= (others => '0');
	signal REG13: STD_LOGIC_VECTOR(31 downto 0):= (others => '0');
	signal REG14: STD_LOGIC_VECTOR(31 downto 0):= (others => '0');
	signal REG15: STD_LOGIC_VECTOR(31 downto 0):= (others => '0');
	signal REG16: STD_LOGIC_VECTOR(31 downto 0):= (others => '0');
	signal REG17: STD_LOGIC_VECTOR(31 downto 0):= (others => '0');
	signal REG18: STD_LOGIC_VECTOR(31 downto 0):= (others => '0');
	signal REG19: STD_LOGIC_VECTOR(31 downto 0):= (others => '0');
	signal REG20: STD_LOGIC_VECTOR(31 downto 0):= (others => '0');
	signal REG21: STD_LOGIC_VECTOR(31 downto 0):= (others => '0');
	signal REG22: STD_LOGIC_VECTOR(31 downto 0):= (others => '0');
	signal REG23: STD_LOGIC_VECTOR(31 downto 0):= (others => '0');
	signal REG24: STD_LOGIC_VECTOR(31 downto 0):= (others => '0');
	signal REG25: STD_LOGIC_VECTOR(31 downto 0):= (others => '0');
	signal REG26: STD_LOGIC_VECTOR(31 downto 0):= (others => '0');
	signal REG27: STD_LOGIC_VECTOR(31 downto 0):= (others => '0');
	signal REG28: STD_LOGIC_VECTOR(31 downto 0):= (others => '0');
	signal REG29: STD_LOGIC_VECTOR(31 downto 0):= (others => '0');
	signal REG30: STD_LOGIC_VECTOR(31 downto 0):= (others => '0');
	signal REG31: STD_LOGIC_VECTOR(31 downto 0):= (others => '0');

-- END INTERNAL REGISTERS.
--------------------------------------------
-- Module Implementation.
--------------------------------------------
begin -- BEGIN ARCHITECTURE

PROCESS(clk, reset)
	begin
		if reset = '1' then
				REG00 <= X"00000000";
				REG01 <= X"00000000";
				REG02 <= X"00000000";
				REG03 <= X"00000000";
				REG04 <= X"00000000";
				REG05 <= X"00000000";
				REG06 <= X"00000000";
				REG07 <= X"00000000";
				REG08 <= X"00000000";
				REG09 <= X"00000000";
				REG10 <= X"00000000";
				REG11 <= X"00000000";
				REG12 <= X"00000000";
				REG13 <= X"00000000";
				REG14 <= X"00000000";
				REG15 <= X"00000000";
				REG16 <= X"00000000";
				REG17 <= X"00000000";
				REG18 <= X"00000000";
				REG19 <= X"00000000";
				REG20 <= X"00000000";
				REG21 <= X"00000000";
				REG22 <= X"00000000";
				REG23 <= X"00000000";
				REG24 <= X"00000000";
				REG25 <= X"00000000";
				REG26 <= X"00000000";
				REG27 <= X"00000000";
				REG28 <= X"00000000";
				REG29 <= X"00000000";
				REG30 <= X"00000000";
				REG31 <= X"00000000";
				
		elsif (clk'event and clk = '0') then
			if reg_write = '1' then
				case write_add is
					when "00001" =>
						REG01 <= write_data;
					when "00010" =>
						REG02 <= write_data;
					when "00011" =>
						REG03 <= write_data;
					when "00100" =>
						REG04 <= write_data;
					when "00101" =>
						REG05 <= write_data;
					when "00110" =>
						REG06 <= write_data;
					when "00111" =>
						REG07 <= write_data;
					when "01000" =>
						REG08 <= write_data;
					when "01001" =>
						REG09 <= write_data;
					when "01010" =>
						REG10 <= write_data;
					when "01011" =>
						REG11 <= write_data;
					when "01100" =>
						REG12 <= write_data;
					when "01101" =>
						REG13 <= write_data;
					when "01110" =>
						REG14 <= write_data;
					when "01111" =>
						REG15 <= write_data;
					when "10000" =>
						REG16 <= write_data;
					when "10001" =>
						REG17 <= write_data;
					when "10010" =>
						REG18 <= write_data;
					when "10011" =>
						REG19 <= write_data;
					when "10100" =>
						REG20 <= write_data;
					when "10101" =>
						REG21 <= write_data;
					when "10110" =>
						REG22 <= write_data;
					when "10111" =>
						REG23 <= write_data;
					when "11000" =>
						REG24 <= write_data;
					when "11001" =>
						REG25 <= write_data;
					when "11010" =>
						REG26 <= write_data;
					when "11011" =>
						REG27 <= write_data;
					when "11100" =>
						REG28 <= write_data;
					when "11101" =>
						REG29 <= write_data;
					when "11110" =>
						REG30 <= write_data;
					when "11111" =>
						REG31 <= write_data;
					when others =>
						REG00 <= write_data;
				end case;
			elsif link_write = '1' then
				REG31 <= link_data;
			end if;
		end if;
	end process;
-- RESET

-----------------------------------------
-- FETCHING DATA FROM REGISTERS 
-- This takes data from one of the
-- internal registers and writes it to
-- the appropriate output bus.
-----------------------------------------
-- read_add1
	read_data1 <= REG00 when read_add1 = "00000" else
					 REG01 when read_add1 = "00001" else
					 REG02 when read_add1 = "00010" else
					 REG03 when read_add1 = "00011" else
					 REG04 when read_add1 = "00100" else
	 				 REG05 when read_add1 = "00101" else
					 REG06 when read_add1 = "00110" else
					 REG07 when read_add1 = "00111" else
					 REG08 when read_add1 = "01000" else
					 REG09 when read_add1 = "01001" else
					 REG10 when read_add1 = "01010" else
					 REG11 when read_add1 = "01011" else
					 REG12 when read_add1 = "01100" else
					 REG13 when read_add1 = "01101" else
					 REG14 when read_add1 = "01110" else
					 REG15 when read_add1 = "01111" else
					 REG16 when read_add1 = "10000" else
					 REG17 when read_add1 = "10001" else
					 REG18 when read_add1 = "10010" else
					 REG19 when read_add1 = "10011" else
					 REG20 when read_add1 = "10100" else
					 REG21 when read_add1 = "10101" else
					 REG22 when read_add1 = "10110" else
					 REG23 when read_add1 = "10111" else
					 REG24 when read_add1 = "11000" else
					 REG25 when read_add1 = "11001" else
					 REG26 when read_add1 = "11010" else
					 REG27 when read_add1 = "11011" else
					 REG28 when read_add1 = "11100" else
					 REG29 when read_add1 = "11101" else
					 REG30 when read_add1 = "11110" else
					 REG31 when read_add1 = "11111" else REG00;

-- read_add2
	read_Data2 <= REG00 when read_add2 = "00000" else
					 REG01 when read_add2 = "00001" else
					 REG02 when read_add2 = "00010" else
					 REG03 when read_add2 = "00011" else
					 REG04 when read_add2 = "00100" else
	 				 REG05 when read_add2 = "00101" else
					 REG06 when read_add2 = "00110" else
					 REG07 when read_add2 = "00111" else
					 REG08 when read_add2 = "01000" else
					 REG09 when read_add2 = "01001" else
					 REG10 when read_add2 = "01010" else
					 REG11 when read_add2 = "01011" else
					 REG12 when read_add2 = "01100" else
					 REG13 when read_add2 = "01101" else
					 REG14 when read_add2 = "01110" else
					 REG15 when read_add2 = "01111" else
					 REG16 when read_add2 = "10000" else
					 REG17 when read_add2 = "10001" else
					 REG18 when read_add2 = "10010" else
					 REG19 when read_add2 = "10011" else
					 REG20 when read_add2 = "10100" else
					 REG21 when read_add2 = "10101" else
					 REG22 when read_add2 = "10110" else
					 REG23 when read_add2 = "10111" else
					 REG24 when read_add2 = "11000" else
					 REG25 when read_add2 = "11001" else
					 REG26 when read_add2 = "11010" else
					 REG27 when read_add2 = "11011" else
					 REG28 when read_add2 = "11100" else
					 REG29 when read_add2 = "11101" else
					 REG30 when read_add2 = "11110" else
					 REG31 when read_add2 = "11111" else REG00;
-- END REGISTER FETCH
end BEHAVIORAL;