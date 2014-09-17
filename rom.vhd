
library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity instruction_memory is
port (clock : in std_logic;
      ADDR : in std_logic_vector (3 downto 0);
      DATA : out std_logic_vector(31 downto 0));
end rom_loader;

architecture behavioral of instruction_memory is
    type rom_type is array (0 to 11) of std_logic_vector (7 downto 0);                 
    signal ROM : rom_type:= (x"02", x"00", x"08", x"34",
										x"03", x"00", x"09", x"34", 
										x"21", x"50", x"09", x"01");                        
    signal rdata : std_logic_vector(31 downto 0);

begin	

   process (clock)
	begin
        if (clock'event and clock = '0') then
		      rdata (7 downto 0) <= ROM(conv_integer(ADDR));
				rdata (15 downto 8) <= ROM(conv_integer(ADDR) + 1);
				rdata (23 downto 16) <= ROM(conv_integer(ADDR) + 2);
				rdata (31 downto 24) <= ROM(conv_integer(ADDR) + 3);
            DATA <= rdata;
        end if;
    end process;

end behavioral;