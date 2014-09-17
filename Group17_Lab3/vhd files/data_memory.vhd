library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.STD_LOGIC_UNSIGNED.all;
use IEEE.NUMERIC_STD.ALL;

entity data_memory is
  port ( 
  			address     : in STD_LOGIC_VECTOR (31 downto 0);
  			Operand1		: in	STD_LOGIC_VECTOR (31 downto 0);
			Operand2		: in	STD_LOGIC_VECTOR (31 downto 0);
			Result1		: out	STD_LOGIC_VECTOR (31 downto 0);
			Result2		: out	STD_LOGIC_VECTOR (31 downto 0);
			write_data : in STD_LOGIC_VECTOR (31 downto 0);
			mem_write  : in STD_LOGIC;
         mem_read	  : in STD_LOGIC;
			clk       : in STD_LOGIC;
			read_data    : out STD_LOGIC_VECTOR (31 downto 0));
end data_memory;

architecture BEHAVIORAL of data_memory is
  type ram is array (0 to 1) of STD_LOGIC_VECTOR (31 downto 0);
  signal mem : ram := (x"00000001", x"FFFFFFE2");

begin
  process (clk) is
  begin
    if (clk'event and clk = '0') then
      if mem_write = '1' then

			if conv_integer(address) < 13 then 
				  mem(CONV_INTEGER("00" & address(8 downto 2))) <= write_data(31 downto 0);
			elsif conv_integer(address) = 24 then 
				Result1 <= write_data;
			elsif conv_integer(address) = 28 then 
				Result2 <= write_data;
			end if;
		end if;
		
    end if;
end process;

read_data <=
			mem(conv_integer("00" & address(8 downto 2)))--+3) & mem(conv_integer(address)+2)  & mem(conv_integer(address)+1) & mem(conv_integer(address)) 
			when mem_read = '1' and conv_integer(address) < 13 else
			Operand1 when mem_read = '1' and conv_integer(address) = 16 else
			Operand2 when mem_read = '1' and conv_integer(address) = 20;


end BEHAVIORAL;

