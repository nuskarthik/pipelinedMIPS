library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity exmem is
port (
	clk : in std_logic;
	stall : in std_logic;
	pc_add_in : in std_logic_vector(31 downto 0);
	alu_result_in : in std_logic_vector (31 downto 0);
	read_data1_in : in std_logic_vector (31 downto 0);	
	read_data2_in : in std_logic_vector (31 downto 0);	
	memory_read_in : in std_logic;
	memory_write_in : in std_logic;
	memory_register_in : in std_logic;
	reg_write_in :in std_logic;
	reg_mux_in : in std_logic_vector (4 downto 0);
	link_mux_in : in std_logic;
	alu_zero_in : in std_logic;
	branch_add_in : in std_logic_vector (31 downto 0);
	jump_in : in std_logic_vector (1 downto 0);
	jump_shift_in : in std_logic_vector (31 downto 0);
	branch_in : in std_logic;
	funct_in : in std_logic_vector (5 downto 0);


	pc_add_out :out std_logic_vector(31 downto 0);
	alu_result_out : out std_logic_vector (31 downto 0);
	read_data1_out : out std_logic_vector (31 downto 0);
	read_data2_out : out std_logic_vector (31 downto 0);
	memory_read_out : out std_logic;
	memory_write_out : out std_logic;
	memory_register_out : out std_logic;
	reg_write_out :out std_logic;
	reg_mux_out : out std_logic_vector (4 downto 0);
	link_mux_out : out std_logic;
	alu_zero_out : out std_logic;
	branch_add_out : out std_logic_vector (31 downto 0);
	jump_out : out std_logic_vector (1 downto 0);
	jump_shift_out : out std_logic_vector (31 downto 0);
	branch_out : out std_logic;
	funct_out : out std_logic_vector (5 downto 0)
);
end exmem;

architecture Behavioral of exmem is

begin
process(clk)
begin
	if (clk'event and clk = '0' and stall = '0') then
			pc_add_out <= pc_add_in;
			alu_result_out <= alu_result_in;
			read_data1_out <= read_data1_in;
			read_data2_out <= read_data2_in;
			memory_read_out <= memory_read_in;
			memory_write_out <= memory_write_in;
			memory_register_out <= memory_register_in;
			reg_write_out <= reg_write_in;
			reg_mux_out <= reg_mux_in;
			link_mux_out <= link_mux_in;
			alu_zero_out <= alu_zero_in;
			branch_add_out <= branch_add_in;
			jump_out <= jump_in;
			jump_shift_out <= jump_shift_in;
			branch_out <= branch_in;
			funct_out <= funct_in;
	end if;
end process;

end Behavioral;

