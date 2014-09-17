
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
--use IEEE.std_logic_unsigned.all;
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity idex is
port (
	pc_add_in : in std_logic_vector(31 downto 0);
	read_data1_in : in std_logic_vector(31 downto 0);
	read_data2_in : in std_logic_vector(31 downto 0);
	sign_extend_in : in std_logic_vector(31 downto 0);
	shift_left_in : in std_logic_vector(31 downto 0);
	alu_op_in : in std_logic_vector(2 downto 0);
	memory_read_in : in std_logic;
	memory_write_in : in std_logic;
	memory_register_in : in std_logic;
	reg_write_in :in std_logic;
	link_enable_in : in std_logic_vector (1 downto 0);
	alu_src_in : in std_logic_vector (1 downto 0);
	branch_in : in std_logic;
	jump_in : in std_logic_vector (1 downto 0);
	reg_dst_in : in std_logic;
	instruction_in : in std_logic_vector(31 downto 0);
	
	pc_add_out : out std_logic_vector(31 downto 0);
	read_data1_out : out std_logic_vector(31 downto 0);
	read_data2_out : out std_logic_vector(31 downto 0);
	sign_extend_out : out std_logic_vector(31 downto 0);
	shift_left_out : out std_logic_vector(31 downto 0);
	alu_op_out : out std_logic_vector(2 downto 0);
	memory_read_out : out std_logic;
	memory_write_out : out std_logic;
	memory_register_out : out std_logic;
	reg_write_out : out std_logic;
	link_enable_out : out std_logic_vector (1 downto 0);
	alu_src_out : out std_logic_vector (1 downto 0);
	  
	branch_out : out std_logic;
	jump_out : out std_logic_vector (1 downto 0);
	reg_dst_out : out std_logic;
	instruction_out : out std_logic_vector(31 downto 0);
	clk : in std_logic;
	counter : out std_logic_vector (5 downto 0);
	stall : out std_logic
);

end idex;

architecture Behavioral of idex is
signal temp_stall : std_logic:= '0';
begin
process (clk)
variable is_div : std_logic:= '0';
variable temp_counter : std_logic_vector (5 downto 0):= (others => '0');
begin
	if (clk'event and clk = '0') then
		if (instruction_in(31 downto 26) = "000000" and (instruction_in(5 downto 0) = "011010" or instruction_in(5 downto 0) = "011011")) then
			is_div := '1';
		end if;
		
		if (is_div = '1' and temp_stall = '0') then				
			pc_add_out <= pc_add_in;
			sign_extend_out <= sign_extend_in;
			shift_left_out <= shift_left_in;
			alu_op_out <= alu_op_in;      
			memory_read_out <= memory_read_in;
			memory_write_out <= memory_write_in;
			memory_register_out <= memory_register_in;
			reg_write_out <= reg_write_in;
			link_enable_out <= link_enable_in;
			alu_src_out <= alu_src_in; 
			
			branch_out <= branch_in;
			jump_out <= jump_in;
			reg_dst_out <= reg_dst_in;
			instruction_out <= instruction_in;

			read_data1_out <= read_data1_in;
			read_data2_out <= read_data2_in;

			temp_counter := "000000";
			counter <= temp_counter;
			temp_stall <= '1';

		elsif is_div = '1' then
			if (temp_counter = "100011") then
				temp_stall <= '0';
				is_div := '0';
			end if;
			temp_counter := std_logic_vector(unsigned(temp_counter) + 1);
			counter <= temp_counter;
		else
			pc_add_out <= pc_add_in;
			sign_extend_out <= sign_extend_in;
			shift_left_out <= shift_left_in;
			alu_op_out <= alu_op_in;      
			memory_read_out <= memory_read_in;
			memory_write_out <= memory_write_in;
			memory_register_out <= memory_register_in;
			reg_write_out <= reg_write_in;
			link_enable_out <= link_enable_in;
			alu_src_out <= alu_src_in; 
			
			branch_out <= branch_in;
			jump_out <= jump_in;
			reg_dst_out <= reg_dst_in;
			instruction_out <= instruction_in;

			read_data1_out <= read_data1_in;
			read_data2_out <= read_data2_in;
		end if;
	end if;
end process;
			stall <= temp_stall;

end Behavioral;	
		