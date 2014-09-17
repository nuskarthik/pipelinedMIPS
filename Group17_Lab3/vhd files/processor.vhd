library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity processor is
Port (	clk			: in	STD_LOGIC;
			Control		: in	STD_LOGIC_VECTOR (5 downto 0);
			Operand1		: in	STD_LOGIC_VECTOR (31 downto 0);
			Operand2		: in	STD_LOGIC_VECTOR (31 downto 0);
			Result1		: out	STD_LOGIC_VECTOR (31 downto 0);
			Result2			:	OUT	STD_LOGIC_VECTOR(31 DOWNTO 0);
			Debug			: out	STD_LOGIC_VECTOR (31 downto 0));
end processor;

architecture BEHAVIORAL of PROCESSOR is


component pc is
	port (
		clk:	in STD_LOGIC;
		stall : in std_logic;
		input:	in STD_LOGIC_VECTOR (31 downto 0);
		pc_out:	out STD_LOGIC_VECTOR (31 downto 0));
end component;

component pc_add is
	port (
		pcinp:		in STD_LOGIC_VECTOR (31 downto 0);
		pc_added:	out  STD_LOGIC_VECTOR (31 downto 0));
end component;

component branch_mux is
port (
	alu_zero : in std_logic;
	branch : in std_logic;
	pc_add : in std_logic_vector (31 downto 0);
	branch_add : in std_logic_vector (31 downto 0);
	branch_pc : out std_logic_vector(31 downto 0)
);
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

component instruction_memory is
port (     
		address : in std_logic_vector (31 downto 0);
      instruction_data : out std_logic_vector(31 downto 0));
end component;

component ifid is
port (
	stall : in std_logic;
	instruction_in : in std_logic_vector (31 downto 0);
	instruction_out : out std_logic_vector (31 downto 0);
	pc_add_in : in std_logic_vector (31 downto 0);
	pc_add_out : out std_logic_vector (31 downto 0);
	clk : in std_logic
);

end component;


component control_unit is
    port ( 
	  op : in STD_LOGIC_VECTOR(5 downto 0);
	  memory_read : out std_logic;
	  memory_write : out std_logic;
	  memory_register : out std_logic;
	  reg_write : out std_logic;
	  link_enable : out std_logic_vector (1 downto 0);
	  alu_src : out std_logic_vector (1 downto 0);
	  alu_op : out std_logic_vector( 2 downto 0);
	  
	  branch : out std_logic;
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

component idex is
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
	stall : out std_logic
);

end component;

component alu_control is
    port ( aluop : in STD_LOGIC_VECTOR(2 downto 0);
	   	  funct : in STD_LOGIC_VECTOR (5 downto 0);
           alu_cont_out : out STD_LOGIC_VECTOR (5 downto 0));
end component;


component alu is
Port (	Clk			: in	STD_LOGIC;
			stall 		: in std_logic;
			Control		: in	STD_LOGIC_VECTOR (5 downto 0);
			Operand1		: in	STD_LOGIC_VECTOR (31 downto 0);
			Operand2		: in	STD_LOGIC_VECTOR (31 downto 0);
			Result1		: out	STD_LOGIC_VECTOR (31 downto 0);
			Zero			: out std_logic);
end component;

component alu_mux is
port (
	alusrc: in STD_LOGIC_VECTOR (1 downto 0);
	shift16 : in STD_LOGIC_VECTOR (31 downto 0);
	reg_read_data1: in STD_LOGIC_VECTOR(31 downto 0);	
	reg_read_data2: in STD_LOGIC_VECTOR(31 downto 0);	
	sign_extended_data: in STD_LOGIC_VECTOR(31 downto 0);	
	
	read_data_output1: out STD_LOGIC_VECTOR(31 downto 0);
	read_data_output2: out STD_LOGIC_VECTOR(31 downto 0));
end component;

component shift_left is
port (
		 sign_extend_add : in std_logic_vector (31 downto 0);
		 shift_add : out std_logic_vector( 31 downto 0));
end component;

component branch_add is
	port (
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


component exmem is
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

	pc_add_out : out std_logic_vector(31 downto 0);
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
end component;

component data_memory is
  port ( 
			address     : in STD_LOGIC_VECTOR (31 downto 0);
--			Control		: in std_logic_vector (5 downto 0);
  			Operand1		: in	STD_LOGIC_VECTOR (31 downto 0);
			Operand2		: in	STD_LOGIC_VECTOR (31 downto 0);
			Result1		: out	STD_LOGIC_VECTOR (31 downto 0);
			Result2		: out	STD_LOGIC_VECTOR (31 downto 0);
			write_data : in STD_LOGIC_VECTOR (31 downto 0);
			mem_write  : in STD_LOGIC;
         mem_read	  : in STD_LOGIC;
			clk       : in STD_LOGIC;
			read_data    : out STD_LOGIC_VECTOR (31 downto 0));
end component;

component memwb is
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
end component;


component data_mux is
port(
	mem_reg: in STD_LOGIC;
	memory_data: in STD_LOGIC_VECTOR(31 downto 0);	
	alu_data: in STD_LOGIC_VECTOR(31 downto 0);	
	
	memory_data_output: out STD_LOGIC_VECTOR(31 downto 0));
end component;


signal PCINPUT: std_logic_vector(31 downto 0) := x"00000004";-- (others => '0');
signal PCADDR : std_logic_vector (31 downto 0):= (others => '0');

signal PCADD : std_logic_vector (31 downto 0):= (others => '0');
signal INSTDATA : std_logic_vector (31 downto 0):= (others => '0');

signal PCADDOUT : std_logic_vector (31 downto 0):= (others => '0');
signal INSTDATAOUT : std_logic_vector (31 downto 0):= (others => '0');


signal ALUZERO : std_logic:= '0';
signal MEMREAD : std_logic:= '0';
signal MEMWRITE : std_logic:= '0';
signal MEMREG : std_logic:= '0';
signal REGWRITE : std_logic:= '0';
signal ALUSRC : std_logic_vector (1 downto 0):= (others => '0');
signal ALUOP : std_logic_vector( 2 downto 0):= (others => '0');
signal BRANCH : std_logic:= '0';
signal JUMP : std_logic_vector (1 downto 0):= (others => '0');
signal REGDST : std_logic:= '0';

signal REGMUXOUT : std_logic_vector (4 downto 0):= (others => '0');
signal DATAMUXOUT : std_logic_vector (31 downto 0):= (others => '0');
signal READDATA1 : std_logic_vector (31 downto 0) := (others => '0');
signal READDATA2 : std_logic_vector (31 downto 0):= (others => '0');
signal SIGN_EXT_OUT : std_logic_vector (31 downto 0):= (others => '0');
signal SHIFTLEFT16: std_logic_vector (31 downto 0):= (others => '0');

-- idex
signal PCADDOUT_OUT : std_logic_vector (31 downto 0):= (others => '0');
signal PCADDOUT_OUT_OUT : std_logic_vector (31 downto 0):= (others => '0');
signal PCADDOUT_OUT_OUT_OUT : std_logic_vector (31 downto 0):= (others => '0');

signal INSTDATAOUT_OUT : std_logic_vector (31 downto 0):= (others => '0');
signal ALUZERO_OUT : std_logic:= '0';
signal MEMREAD_OUT : std_logic:= '0';
signal MEMWRITE_OUT : std_logic:= '0';
signal MEMREG_OUT : std_logic:= '0';
signal REGWRITE_OUT : std_logic:= '0';
signal ALUSRC_OUT : std_logic_vector (1 downto 0):= (others => '0');
signal ALUOP_OUT : std_logic_vector( 2 downto 0):= (others => '0');
signal BRANCH_OUT : std_logic:= '0';
signal JUMP_OUT : std_logic_vector (1 downto 0):= (others => '0');
signal REGDST_OUT : std_logic:= '0';

signal READDATA1_OUT : std_logic_vector (31 downto 0) := (others => '0');
signal READDATA2_OUT : std_logic_vector (31 downto 0):= (others => '0');
signal SIGN_EXT_OUT_OUT : std_logic_vector (31 downto 0):= (others => '0');
signal SHIFTLEFT16_OUT : std_logic_vector (31 downto 0):= (others => '0');


signal ALUCNTOUT : std_logic_vector (5 downto 0):= (others => '0');

signal ALUOUT : std_logic_vector (31 downto 0):= (others => '0');
signal ALUMUXOUT1 : std_logic_vector (31 downto 0):= (others => '0');
signal ALUMUXOUT2 : std_logic_vector (31 downto 0):= (others => '0');

signal READ_DATA_MEM : std_logic_vector (31 downto 0):= (others => '0');
signal SHIFTOUT: std_logic_vector( 31 downto 0):= (others => '0');
signal BRANCHADDOUT: std_logic_vector (31 downto 0):= (others => '0');
signal BRANCHMUXOUT: std_logic_vector (31 downto 0):= (others => '0');
signal JUMPADDOUT : std_logic_vector (31 downto 0):= (others => '0');

signal LINKENABLE : std_logic_vector (1 downto 0) := (others => '0');
signal LINKENABLE_OUT : std_logic_vector (1 downto 0) := (others => '0');
signal LINKWRITE : std_logic := '0';

-- exmem
signal ALUOUT_OUT : std_logic_vector (31 downto 0):= (others => '0');
signal BRANCHADDOUT_OUT: std_logic_vector (31 downto 0):= (others => '0');
signal JUMPADDOUT_OUT : std_logic_vector (31 downto 0):= (others => '0');
signal LINKWRITE_OUT : std_logic := '0';

signal READDATA1_OUT_OUT : std_logic_vector (31 downto 0):= (others => '0');
signal READDATA2_OUT_OUT : std_logic_vector (31 downto 0):= (others => '0');
signal MEMREAD_OUT_OUT : std_logic:= '0';
signal MEMWRITE_OUT_OUT : std_logic:= '0';
signal MEMREG_OUT_OUT : std_logic:= '0';
signal REGWRITE_OUT_OUT : std_logic:= '0';
signal BRANCH_OUT_OUT : std_logic:= '0';
signal JUMP_OUT_OUT : std_logic_vector (1 downto 0):= (others => '0');
signal REGMUXOUT_OUT : std_logic_vector (4 downto 0):= (others => '0');


--memwb
signal MEMREG_OUT_OUT_OUT : std_logic:= '0';
signal REGWRITE_OUT_OUT_OUT : std_logic:= '0';
signal LINKWRITE_OUT_OUT : std_logic := '0';
signal REGMUXOUT_OUT_OUT : std_logic_vector (4 downto 0):= (others => '0');
signal ALUOUT_OUT_OUT : std_logic_vector (31 downto 0):= (others => '0');
signal READ_DATA_MEM_OUT : std_logic_vector (31 downto 0):= (others => '0');

signal STALL : std_logic:= '0';

signal FUNCT_OUT : std_logic_vector (5 downto 0):= (others => '0');
begin

pc0: pc
port map(
	clk => clk,
	stall => STALL,
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
      address => PCADDR,
      instruction_data => INSTDATA
);

ifid0: ifid 
port map(
	stall => STALL,
	instruction_in => INSTDATA,
	instruction_out => INSTDATAOUT,
	pc_add_in => PCADD,
	pc_add_out => PCADDOUT,
	clk => clk
);

control_unit0 : control_unit
port map ( 
		op => INSTDATAOUT(31 downto 26),
		memory_read => MEMREAD,
		memory_write => MEMWRITE,
		memory_register => MEMREG,
		reg_write => REGWRITE,
		link_enable => LINKENABLE,
		alu_src => ALUSRC,
		alu_op => ALUOP,
		branch => BRANCH,
		jump => JUMP,
		reg_dst => REGDST
);


reg_file0: register_file 
port map(
	reg_write => REGWRITE_OUT_OUT_OUT,
	clk => clk,

	link_write => LINKWRITE_OUT_OUT,
	link_data => PCADDOUT_OUT_OUT_OUT,
	read_add1 => INSTDATAOUT (25 downto 21),
	read_add2 => INSTDATAOUT (20 downto 16),
	write_add => REGMUXOUT_OUT_OUT,
	write_data => DATAMUXOUT,

	read_data1 => READDATA1,
	read_data2 => READDATA2
);

shift16_0 : shift_left_16 
port map(
	immediate => INSTDATAOUT (15 downto 0),
	shift_left_out => SHIFTLEFT16
);

sign_ext0 : sign_extension 
port map (
	reg_in => INSTDATAOUT (15 downto 0),	
	reg_out_32 => SIGN_EXT_OUT
);

idex0: idex 
port map(
	pc_add_in => PCADDOUT,

	read_data1_in => READDATA1,
	read_data2_in => READDATA2,
	sign_extend_in => SIGN_EXT_OUT,
	shift_left_in => SHIFTLEFT16,
	alu_op_in => ALUOP,
	memory_read_in =>MEMREAD,
	memory_write_in => MEMWRITE,
	memory_register_in => MEMREG,
	reg_write_in =>REGWRITE,
	link_enable_in => LINKENABLE,
	alu_src_in => ALUSRC,
	branch_in =>BRANCH,
	jump_in =>JUMP,
	reg_dst_in => REGDST,
	instruction_in => INSTDATAOUT,
	
	pc_add_out => PCADDOUT_OUT,

	read_data1_out => READDATA1_OUT,
	read_data2_out => READDATA2_OUT,
	sign_extend_out => SIGN_EXT_OUT_OUT,
	shift_left_out => SHIFTLEFT16_OUT,
	alu_op_out => ALUOP_OUT,
	memory_read_out =>MEMREAD_OUT,
	memory_write_out => MEMWRITE_OUT,
	memory_register_out => MEMREG_OUT,
	reg_write_out =>REGWRITE_OUT,
	link_enable_out => LINKENABLE_OUT,
	alu_src_out => ALUSRC_OUT,
	branch_out =>BRANCH_OUT,
	jump_out =>JUMP_OUT,
	reg_dst_out => REGDST_OUT,
	instruction_out => INSTDATAOUT_OUT,

	clk => clk,
		stall => STALL
);


reg_mux0 : register_mux 
port map(
	reg_dst => REGDST_OUT,
	rt => INSTDATAOUT_OUT (20 downto 16),	
	rd => INSTDATAOUT_OUT (15 downto 11),
	write_add => REGMUXOUT
);

link_mux0 : link_mux
port map (
	funct => INSTDATAOUT_OUT (5 downto 0),
	link_enable => LINKENABLE_OUT,
	sub => INSTDATAOUT_OUT (20 downto 16),
	link_write => LINKWRITE
);

alu_cnt0:  alu_control
port map (
	aluop => ALUOP_OUT,
   funct => INSTDATAOUT_OUT (5 downto 0),
   alu_cont_out => ALUCNTOUT
);

alu0:  alu 
Port map (
	Clk => clk,
	stall => STALL,
	Control => ALUCNTOUT,
	Operand1 => ALUMUXOUT1,
	Operand2	=> ALUMUXOUT2,
	Result1	=> ALUOUT,
	Zero	=> ALUZERO
);

alumux0 : alu_mux 
port map (
	alusrc => ALUSRC_OUT,
	shift16 => SHIFTLEFT16_OUT,
	reg_read_data1 => READDATA1_OUT,	
	reg_read_data2 => READDATA2_OUT,	
	sign_extended_data => SIGN_EXT_OUT_OUT,
	read_data_output1 => ALUMUXOUT1,
	read_data_output2 => ALUMUXOUT2
);	

shiftleft0 : shift_left 
port map (
   sign_extend_add => SIGN_EXT_OUT_OUT,
   shift_add => SHIFTOUT
);


branchadd0 : branch_add 
port map(
	pc	=>	PCADDOUT_OUT,
	shifted_add	=> SHIFTOUT,
	pc_out => BRANCHADDOUT
);

jumpadd0 : jump_add
port map (
	 pc => PCADDOUT_OUT,
	 jump_offset => INSTDATAOUT_OUT (25 downto 0),
	 added_pc => JUMPADDOUT
);

exmem0: exmem 
port map(
	clk => clk,
	stall => STALL,
	pc_add_in => PCADDOUT_OUT,
	alu_result_in => ALUOUT,
	read_data1_in => READDATA1_OUT,
	read_data2_in =>READDATA2_OUT,
	memory_read_in => MEMREAD_OUT,
	memory_write_in => MEMWRITE_OUT,
	memory_register_in => MEMREG_OUT,
	reg_write_in => REGWRITE_OUT,
	reg_mux_in => REGMUXOUT,
	link_mux_in => LINKWRITE,
	alu_zero_in => ALUZERO,
	branch_add_in => BRANCHADDOUT,
	jump_in => JUMP_OUT,
	jump_shift_in => JUMPADDOUT,
	branch_in => BRANCH_OUT,
	funct_in => INSTDATAOUT_OUT(5 downto 0),

	pc_add_out => PCADDOUT_OUT_OUT,
	alu_result_out => ALUOUT_OUT,
	read_data1_out => READDATA1_OUT_OUT,
	read_data2_out =>READDATA2_OUT_OUT,
	memory_read_out => MEMREAD_OUT_OUT,
	memory_write_out => MEMWRITE_OUT_OUT,
	memory_register_out => MEMREG_OUT_OUT,
	reg_write_out => REGWRITE_OUT_OUT,
	reg_mux_out => REGMUXOUT_OUT,
	link_mux_out => LINKWRITE_OUT,
	alu_zero_out => ALUZERO_OUT,
	branch_add_out => BRANCHADDOUT_OUT,
	jump_out => JUMP_OUT_OUT,
	jump_shift_out => JUMPADDOUT_OUT,
	branch_out => BRANCH_OUT_OUT,
	funct_out => FUNCT_OUT
);

	
datamem0 : data_memory
port map ( 
	clk => clk,
--	Control => Control,
	address => ALUOUT_OUT,
	Operand1 => Operand1,
	Operand2 => Operand2,
	Result1 => Result1,
	Result2 => Result2,
	write_data => READDATA2_OUT_OUT,
	mem_write => MEMWRITE_OUT_OUT,
	mem_read => MEMREAD_OUT_OUT,
	read_data => READ_DATA_MEM
);
	

branchmux0 : branch_mux
port map (
	alu_zero => ALUZERO_OUT,
	branch => BRANCH_OUT_OUT,
	pc_add => PCADD,
	branch_add => BRANCHADDOUT_OUT,
	branch_pc => BRANCHMUXOUT
);


jumpmux0 : jump_mux
port map (
	funct => FUNCT_OUT,
	jump => JUMP_OUT_OUT,
	jump_pc => JUMPADDOUT_OUT,
	branch_pc => BRANCHMUXOUT,
	link_pc => READDATA1_OUT_OUT,
	pc_out => PCINPUT
);

memwb0 : memwb 
port map(
	clk => clk,
	stall => STALL,
	pc_add_in => PCADDOUT_OUT_OUT,
	memory_register_in => MEMREG_OUT_OUT,
	reg_write_in => REGWRITE_OUT_OUT,
	link_mux_in => LINKWRITE_OUT,
	reg_mux_in => REGMUXOUT_OUT,
	alu_result_in => ALUOUT_OUT,
	read_data_in => READ_DATA_MEM,

	pc_add_out => PCADDOUT_OUT_OUT_OUT,
	memory_register_out => MEMREG_OUT_OUT_OUT,
	reg_write_out => REGWRITE_OUT_OUT_OUT,
	link_mux_out => LINKWRITE_OUT_OUT,
	reg_mux_out => REGMUXOUT_OUT_OUT,
	alu_result_out => ALUOUT_OUT_OUT,
	read_data_out => READ_DATA_MEM_OUT
);


datamux0 : data_mux
port map(
	mem_reg => MEMREG_OUT_OUT_OUT,
	memory_data => READ_DATA_MEM_OUT,
	alu_data => ALUOUT_OUT_OUT,
	memory_data_output => DATAMUXOUT
);


end BEHAVIORAL;
