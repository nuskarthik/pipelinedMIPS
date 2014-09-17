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
  type   ram is array (0 to 511) of STD_LOGIC_VECTOR (7 downto 0);
  signal mem : ram := (x"09", x"00", x"00", x"00",
								x"04", x"00", x"00", x"00",
								x"00", x"00", x"00", x"00",
								x"00", x"00", x"00", x"00",								others => x"00");
  signal temp_out: STD_LOGIC_VECTOR(31 downto 0) := (others => '0');
  signal temp_add: STD_LOGIC_VECTOR(31 downto 0) := (others => '0');
  signal const_sub: STD_LOGIC_VECTOR (31 downto 0):= x"10010000";
begin
  process (clk) is
  begin
    if (clk'event and clk = '0') then
      if mem_write = '1' then
		 -- temp_add <= x"00000000";
		--	temp_add <= address - X"10010000";
        mem(CONV_INTEGER(address(8 downto 0))) <= write_data(7 downto 0);
        mem(CONV_INTEGER(address(8 downto 2) & "01")) <= write_data(15 downto 8);
        mem(CONV_INTEGER(address(8 downto 2) & "10")) <= write_data(23 downto 16);
		  mem(CONV_INTEGER(address(8 downto 2) & "11")) <= write_data(31 downto 24);      
		end if;
		
    end if;
end process;

--temp_add <= x"00000000";
--temp_add <= address and x"000001FF";
read_data <=
			mem(conv_integer(address)+3) & mem(conv_integer(address)+2)  & mem(conv_integer(address)+1) & mem(conv_integer(address)) 
			when mem_read = '1';


	--instruction_data <= rdata;

--read_data <=  
	--temp_out when mem_read = '1';
--	mem(CONV_INTEGER(temp_add(8 downto 2) & "11")) & mem(CONV_INTEGER(temp_add(8 downto 2) & "10")) & mem(CONV_INTEGER(temp_add(8 downto 2) & "01")) & mem(CONV_INTEGER(temp_add(8 downto 0))) when mem_read = '1';
	
end BEHAVIORAL;

