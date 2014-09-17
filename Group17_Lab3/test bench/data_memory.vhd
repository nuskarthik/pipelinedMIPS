library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.STD_LOGIC_UNSIGNED.all;
use IEEE.NUMERIC_STD.ALL;

entity data_memory is
  port ( 
  			address     : in STD_LOGIC_VECTOR (31 downto 0);
         write_data : in STD_LOGIC_VECTOR (31 downto 0);
			mem_write  : in STD_LOGIC;
         mem_read	  : in STD_LOGIC;
			clk       : in STD_LOGIC;
			read_data    : out STD_LOGIC_VECTOR (31 downto 0));
end data_memory;

architecture BEHAVIORAL of data_memory is
  type   ram is array (0 to 64) of STD_LOGIC_VECTOR (31 downto 0);
  signal mem : ram := (x"00000009", x"00000003",
								x"FFFFFFE2", x"00000055", x"0000000b", others => x"00000000");
  signal temp_out: STD_LOGIC_VECTOR(31 downto 0) := (others => '0');
  signal temp_add: STD_LOGIC_VECTOR(31 downto 0) := (others => '0');
  signal const_sub: STD_LOGIC_VECTOR (31 downto 0):= x"10010000";
begin
  process (clk) is
  begin
    if (clk'event and clk = '0') then
      if mem_write = '1' then
			mem(CONV_INTEGER("00" & address(8 downto 2))) <= write_data(31 downto 0);
		end if;
		
    end if;
end process;


read_data <= mem(conv_integer("00" & address(8 downto 2))) when mem_read = '1';

	
end BEHAVIORAL;

