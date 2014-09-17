
library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity instruction_memory is
port (clock : in std_logic;
      address : in std_logic_vector (31 downto 0);
      instruction_data : out std_logic_vector(31 downto 0));
end instruction_memory;

architecture behavioral of instruction_memory is
    type rom_type is array (0 to 63) of std_logic_vector (7 downto 0);                 
    signal ROM : rom_type:= (  x"00", x"00", x"09", x"8c", 
										x"04", x"00", x"0a", x"8c", 
										x"1b", x"00", x"2a", x"01", 
										x"10", x"88", x"00", x"00", 
										x"12", x"90", x"00", x"00", 
									   others => x"00" );                        
    signal rdata : std_logic_vector(31 downto 0);

begin	
	rdata (7 downto 0) <= ROM(conv_integer(address));
	rdata (15 downto 8) <= ROM(conv_integer(address) + 1);
	rdata (23 downto 16) <= ROM(conv_integer(address) + 2);
	rdata (31 downto 24) <= ROM(conv_integer(address) + 3);
	instruction_data <= rdata;
end behavioral;