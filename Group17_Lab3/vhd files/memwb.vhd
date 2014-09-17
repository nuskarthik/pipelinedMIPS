library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity memwb is
port (
	clk : in std_logic;
	stall : in std_logic;
	pc_add_in : in std_logic_vector(31 downto 0);
	memory_register_in : in std_logic;
	reg_write_in :in std_logic;
	link_mux_in : in std_logic;
	reg_mux_in : in std_logic_vector (4 downto 0);
	alu_result_in : in std_logic_vector (31 downto 0);
	read_data_in :in std_logic_vector (31 downto 0);
	
	pc_add_out : out std_logic_vector(31 downto 0);
	memory_register_out : out std_logic;
	reg_write_out :out std_logic;
	link_mux_out : out std_logic;
	reg_mux_out : out std_logic_vector (4 downto 0);
	alu_result_out : out std_logic_vector (31 downto 0);
	read_data_out :out std_logic_vector (31 downto 0)
	
);
end memwb;

architecture Behavioral of memwb is

begin

process (clk)
begin
if (clk'event and clk = '0' and stall = '0') then
	pc_add_out <= pc_add_in;
	memory_register_out <= memory_register_in;
	reg_write_out <= reg_write_in;
	link_mux_out <= link_mux_in;
	reg_mux_out <= reg_mux_in;
	alu_result_out <= alu_result_in;
	read_data_out <= read_data_in;
end if;

end process;

end Behavioral;

