
library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity instruction_memory is
port ( address : in std_logic_vector (31 downto 0);
      instruction_data : out std_logic_vector(31 downto 0));
end instruction_memory;

architecture behavioral of instruction_memory is
    type rom_type is array (0 to 22) of std_logic_vector (31 downto 0);                 
    signal ROM : rom_type:= (x"8c090010",
										x"8c0a0014",
										x"00000000",
										x"00000000",
										x"00000000",
										x"012a0018",
										x"00000000",
										x"00000000",
										x"00000000",
										x"00008810",
										x"00000000",
										x"00000000",
										x"00000000",
										x"ac110018",
										x"00009012",
										x"00000000",
										x"00000000",
										x"00000000",
										x"ac12001c",
										x"08000c00",
										x"00000000",
										x"00000000",
										x"00000000");                         
    signal rdata : std_logic_vector(31 downto 0);

begin	
	rdata  <= ROM(conv_integer("00" & address(31 downto 2)));
	instruction_data <= rdata when rdata /= x"00000000" else
								x"FFFFFFFF";
end behavioral;