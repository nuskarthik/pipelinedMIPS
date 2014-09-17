library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity processor is
port( 
		clk  : in STD_LOGIC;
		reset  : in STD_LOGIC);
end processor;

architecture BEHAVIORAL of PROCESSOR is


component pc is
	port (
		clk:	in STD_LOGIC;
		reset:	in STD_LOGIC;
		input:	in STD_LOGIC_VECTOR (31 downto 0);
		pc_out:	out STD_LOGIC_VECTOR (31 downto 0));
end component;

component pc_add is
	port (
		pcinp:		in STD_LOGIC_VECTOR (31 downto 0);
		pc_added:	out  STD_LOGIC_VECTOR (31 downto 0));
end component;

component instruction_memory is
port (clock : in std_logic;
      address : in std_logic_vector (31 downto 0);
      instruction_data : out std_logic_vector(31 downto 0));
end component;

component control_unit is
    port ( op : in STD_LOGIC_VECTOR(5 downto 0);
			  alu_zero : in std_logic;

			  memory_read : out std_logic;
			  memory_write : out std_logic;
			  memory_register : out std_logic;
			  reg_write : out std_logic;
			  link_enable : out std_logic_vector (1 downto 0);
			  alu_src : out std_logic_vector (1 downto 0);
			  alu_op : out std_logic_vector( 2 downto 0);
			  
			  pcsrc : out std_logic;
			  jump : out std_logic_vector (1 downto 0);
			  reg_dst : out std_logic);
end component;

component link_mux is
port (
	funct : in std_logic_vector (5 downto 0);
	link_enable : in std_logic_vector (1 downto 0);
	sub : in std_logic_vector (4 downto 0);
	link_write : out std_logic	);
end component;


component register_file is
port (
	reg_write: in STD_LOGIC;
	clk: in STD_LOGIC;
	reset: in STD_LOGIC;

	link_write : in std_logic;
	link_data :in std_logic_vector(31 downto 0);
	read_add1: in STD_LOGIC_VECTOR(4 downto 0);
	read_add2: in STD_LOGIC_VECTOR(4 downto 0);
	write_add: in STD_LOGIC_VECTOR(4 downto 0);
	write_data: in STD_LOGIC_VECTOR(31 downto 0);

	read_data1: out STD_LOGIC_VECTOR(31 downto 0);
	read_data2: out STD_LOGIC_VECTOR(31 downto 0)
	);
end component;

component register_mux is
port (
	reg_dst: in STD_LOGIC;
	rt: in STD_LOGIC_VECTOR(4 downto 0);	
	rd: in STD_LOGIC_VECTOR(4 downto 0);	

	write_add: out STD_LOGIC_VECTOR(4 downto 0));
end component;

component shift_left_16 is
port (
	immediate : in std_logic_vector (15 downto 0);
	shift_left_out : out std_logic_vector (31 downto 0)
);
end component;

component sign_extension is
port (
	reg_in: in STD_LOGIC_VECTOR(15 downto 0);	
	reg_out_32: out STD_LOGIC_VECTOR(31 downto 0));
end component;

component alu_control is
    port ( aluop : in STD_LOGIC_VECTOR(2 downto 0);
	   	  funct : in STD_LOGIC_VECTOR (5 downto 0);
           alu_cont_out : out STD_LOGIC_VECTOR (5 downto 0));
end component;


component alu is
Port (	Clk			: in	STD_LOGIC;
			Control		: in	STD_LOGIC_VECTOR (5 downto 0);
			Operand1		: in	STD_LOGIC_VECTOR (31 downto 0);
			Operand2		: in	STD_LOGIC_VECTOR (31 downto 0);
			Result1		: out	STD_LOGIC_VECTOR (31 downto 0);
			Debug			: out	STD_LOGIC_VECTOR (31 downto 0);
			Zero			: out std_logic);
end component;

component alu_mux is
port (
	alusrc: in STD_LOGIC_VECTOR (1 downto 0);
	shift16 : in STD_LOGIC_VECTOR (31 downto 0);
	reg_read_data: in STD_LOGIC_VECTOR(31 downto 0);	
	sign_extended_data: in STD_LOGIC_VECTOR(31 downto 0);	
	
	read_data_output: out STD_LOGIC_VECTOR(31 downto 0));
end component;

component data_memory is
  port ( 
  			address     : in STD_LOGIC_VECTOR (31 downto 0);
         write_data : in STD_LOGIC_VECTOR (31 downto 0);
			mem_write  : in STD_LOGIC;
         mem_read	  : in STD_LOGIC;
			clk       : in STD_LOGIC;
			read_data    : out STD_LOGIC_VECTOR (31 downto 0));
end component;

component data_mux is
port(
	mem_reg: in STD_LOGIC;
	memory_data: in STD_LOGIC_VECTOR(31 downto 0);	
	alu_data: in STD_LOGIC_VECTOR(31 downto 0);	
	
	memory_data_output: out STD_LOGIC_VECTOR(31 downto 0));
end component;

component shift_left is
port (
		 sign_extend_add : in std_logic_vector (31 downto 0);
		 shift_add : out std_logic_vector( 31 downto 0));
end component;

component branch_add is
	port (
		pcsrc 		: in std_logic;
		pc				:	in STD_LOGIC_VECTOR (31 downto 0);
		shifted_add	:	in STD_LOGIC_VECTOR (31 downto 0);
		pc_out		:	out STD_LOGIC_VECTOR (31 downto 0)
);
end component;

component jump_add is
port (
		 pc : in std_logic_vector (31 downto 0);
		 jump_offset : in std_logic_vector (25 downto 0);
		 added_pc : out std_logic_vector (31 downto 0));
end component;

component jump_mux is
port (
	funct : in std_logic_vector (5 downto 0);
	jump: in STD_LOGIC_VECTOR (1 downto 0);
	jump_pc: in STD_LOGIC_VECTOR(31 downto 0);	
	branch_pc: in STD_LOGIC_VECTOR(31 downto 0);	
	link_pc: in std_logic_vector(31 downto 0);
	pc_out: out STD_LOGIC_VECTOR(31 downto 0));

end component;


signal PCINPUT: std_logic_vector(31 downto 0) := x"00000004";-- (others => '0');
signal PCADDR : std_logic_vector (31 downto 0):= (others => '0');
signal PCADD : std_logic_vector (31 downto 0):= (others => '0');
signal INSTDATA : std_logic_vector (31 downto 0):= (others => '0');
signal ALUZERO : std_logic;
signal MEMREAD : std_logic;
signal MEMWRITE : std_logic;
signal MEMREG : std_logic;
signal REGWRITE : std_logic;
signal ALUSRC : std_logic_vector (1 downto 0):= (others => '0');
signal ALUOP : std_logic_vector( 2 downto 0):= (others => '0');
signal PCSRC : std_logic;
signal JUMP : std_logic_vector (1 downto 0):= (others => '0');
signal REGDST : std_logic;

signal REGMUXOUT : std_logic_vector (4 downto 0):= (others => '0');
signal DATAMUXOUT : std_logic_vector (31 downto 0):= (others => '0');
signal READDATA1 : std_logic_vector (31 downto 0) := (others => '0');
signal READDATA2 : std_logic_vector (31 downto 0):= (others => '0');
signal SIGN_EXT_OUT : std_logic_vector (31 downto 0):= (others => '0');
signal SHIFTLEFT16: std_logic_vector (31 downto 0):= (others => '0');

signal ALUCNTOUT : std_logic_vector (5 downto 0):= (others => '0');

signal ALUOUT : std_logic_vector (31 downto 0):= (others => '0');
signal ALUMUXOUT : std_logic_vector (31 downto 0):= (others => '0');
signal TDEBUG :	STD_LOGIC_VECTOR (31 downto 0):= (others => '0');
signal READ_DATA_MEM : std_logic_vector (31 downto 0):= (others => '0');
signal SHIFTOUT: std_logic_vector( 31 downto 0):= (others => '0');
signal BRANCHADDOUT: std_logic_vector (31 downto 0):= (others => '0');
signal JUMPADDOUT : std_logic_vector (31 downto 0):= (others => '0');

signal LINKENABLE : std_logic_vector (1 downto 0) := (others => '0');
signal LINKWRITE : std_logic := '0';
begin


pc0: pc
port map(
	clk => clk,
	reset => reset,
	input => PCINPUT,
	pc_out => PCADDR
);


pcadd0: pc_add
port map(
	pcinp => PCADDR,
	pc_added => PCADD
);

instr_mem0 : instruction_memory
port map(
		clock => clk,
      address => PCADDR,
      instruction_data => INSTDATA
);

control_unit0 : control_unit
port map ( 
		op => INSTDATA(31 downto 26),
		alu_zero => ALUZERO,
		memory_read => MEMREAD,
		memory_write => MEMWRITE,
		memory_register => MEMREG,
		reg_write => REGWRITE,
		link_enable => LINKENABLE,
		alu_src => ALUSRC,
		alu_op => ALUOP,
		pcsrc => PCSRC,
		jump => JUMP,
		reg_dst => REGDST
);

link_mux0 : link_mux
port map (
	funct => INSTDATA (5 downto 0),
	link_enable => LINKENABLE,
	sub => INSTDATA (20 downto 16),
	link_write => LINKWRITE
);

reg_file0: register_file 
port map(
	reg_write => REGWRITE,
	clk => clk,
	reset => reset,

	link_write => LINKWRITE,
	link_data => PCADD,
	read_add1 => INSTDATA (25 downto 21),
	read_add2 => INSTDATA (20 downto 16),
	write_add => REGMUXOUT,
	write_data => DATAMUXOUT,

	read_data1 => READDATA1,
	read_data2 => READDATA2
);

reg_mux0 : register_mux 
port map(
	reg_dst => REGDST,
	rt => INSTDATA (20 downto 16),	
	rd => INSTDATA (15 downto 11),
	write_add => REGMUXOUT
);

shift16_0 : shift_left_16 
port map(
	immediate => INSTDATA (15 downto 0),
	shift_left_out => SHIFTLEFT16
);

sign_ext0 : sign_extension 
port map (
	reg_in => INSTDATA (15 downto 0),	
	reg_out_32 => SIGN_EXT_OUT
);


alu_cnt0:  alu_control
port map (
	aluop => ALUOP,
   funct => INSTDATA (5 downto 0),
   alu_cont_out => ALUCNTOUT
);

alu0:  alu 
Port map (
	Clk => clk,
	Control => ALUCNTOUT,
	Operand1 => READDATA1,
	Operand2	=> ALUMUXOUT,
	Result1	=> ALUOUT,
	Debug =>	TDEBUG,
	Zero	=> ALUZERO
);

alumux0 : alu_mux 
port map (
	alusrc => ALUSRC,
	shift16 => SHIFTLEFT16,
	reg_read_data => READDATA2,	
	sign_extended_data => SIGN_EXT_OUT,
	read_data_output => ALUMUXOUT
);	
	
datamem0 : data_memory
port map ( 
	clk => clk,
	address => ALUOUT,
	write_data => READDATA2,
	mem_write => MEMWRITE,
	mem_read => MEMREAD,
	read_data => READ_DATA_MEM
);
	
datamux0 : data_mux
port map(
	mem_reg => MEMREG,
	memory_data => READ_DATA_MEM,
	alu_data => ALUOUT,
	memory_data_output => DATAMUXOUT
);

shiftleft0 : shift_left 
port map (
   sign_extend_add => SIGN_EXT_OUT,
   shift_add => SHIFTOUT
);


branchadd0 : branch_add 
port map(
	pcsrc => PCSRC,
	pc	=>	PCADD,
	shifted_add	=> SHIFTOUT,
	pc_out => BRANCHADDOUT
);

jumpadd0 : jump_add
port map (
	 pc => PCADD,
	 jump_offset => INSTDATA (25 downto 0),
	 added_pc => JUMPADDOUT
);

jumpmux0 : jump_mux
port map (
	funct => INSTDATA(5 downto 0),
	jump => JUMP,
	jump_pc => JUMPADDOUT,
	branch_pc => BRANCHADDOUT,
	link_pc => READDATA1,
	pc_out => PCINPUT
);


end BEHAVIORAL;
