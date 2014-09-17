
library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity instruction_memory is
port (clock : in std_logic;
      address : in std_logic_vector (31 downto 0);
      instruction_data : out std_logic_vector(31 downto 0));
end instruction_memory;

architecture behavioral of instruction_memory is
    type rom_type is array (0 to 25) of std_logic_vector (31 downto 0);                 
    signal ROM : rom_type:= (x"8c090000",
										x"8c0a0004",
										x"00000000",
										x"00000000",
										x"012a8020",
										x"0551000c",
										x"00000000",
										x"00000000",
										x"00000000",
										x"020a8824",
										x"012a9026",
										x"00000000",
										x"ac110018",
										x"ac12001c",
										x"08000c00",
										x"00000000",
										x"00000000",
										x"00000000",
										x"01498022",
										x"00000000",
										x"00000000",
										x"ac100018",
										x"03e00008",
										x"00000000",
										x"00000000",
										x"00000000");                                            
    signal rdata : std_logic_vector(31 downto 0);

begin	
	rdata  <= ROM(conv_integer("00" & address(31 downto 2)));
	instruction_data <= rdata when rdata /= x"00000000" else
								x"FFFFFFFF";
end behavioral;