library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity alu_control is
    port ( aluop : in STD_LOGIC_VECTOR(2 downto 0);
	   	  funct : in STD_LOGIC_VECTOR (5 downto 0);
           alu_cont_out : out STD_LOGIC_VECTOR (5 downto 0));
end alu_control;

architecture behavioural of alu_control is
begin
	alu_cont_out <= "000010" when (aluop = "000" and (funct = "100000" or funct = "100001")) or
						           aluop = "010" else --add/load/store
						  "000100" when (aluop = "000" and (funct = "100010" or funct = "100011")) else -- sub
						  "000101" when aluop = "000" and funct = "011000" else --mul
						  "000110" when aluop = "000" and funct = "011001" else --mulu		
						  "000111" when aluop = "000" and funct = "011010" else --div
						  "001000" when aluop = "000" and funct = "011011" else --divu
						  "001001" when (aluop = "000" and funct = "101010") or aluop = "101" else --slt
						  "001010" when aluop = "001" else --beq
						  "001100" when aluop = "000" and funct = "100100" else --and
						  "001101" when (aluop = "000" and funct = "100101") or aluop = "11" else --or/ori
						  "001111" when aluop = "000" and funct = "100111" else --nor
						  "001110" when aluop = "000" and funct = "100110" else --xor
						  "010000" when aluop = "000" and (funct = "000100" or funct = "000000") else --sllv/sll
						  "010001" when aluop = "000" and (funct = "000110" or funct = "000010") else --srlv/srl
						  "010010" when aluop = "000" and (funct = "000111" or funct = "000011") else --srav/sra
						  "010011" when aluop = "000" and funct = "010000" else --mfhi
						  "010100" when aluop = "000" and funct = "010010" else --mflo
						  "010101" when aluop = "100" else --bgez/bgezal
						  "000000";
end behavioural;
