----------------------------------------------------------------------------------
-- Company: NUS Group 7
-- Create Date:    10:39:18 09/18/2013 
-- Design Name: 	Arithmetic Logic Unit
-- Module Name:    alu - Behavioral 
-- Revision: 
-- Revision 0.01 - File Created
-- Additional Comments: 
--
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.std_logic_unsigned.all;
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
use IEEE.NUMERIC_STD.ALL;

entity alu is
Port (	Clk			: in	STD_LOGIC;
			Control		: in	STD_LOGIC_VECTOR (5 downto 0);
			Operand1		: in	STD_LOGIC_VECTOR (31 downto 0);
			Operand2		: in	STD_LOGIC_VECTOR (31 downto 0);
			Result1		: out	STD_LOGIC_VECTOR (31 downto 0);
			Debug			: out	STD_LOGIC_VECTOR (31 downto 0);
			Zero			: out std_logic);
end alu;

architecture Behavioral of alu is

signal Op1 : std_logic_vector (31 downto 0):= (others => '0');
signal Op2 : std_logic_vector (31 downto 0):= (others => '0');
signal Sum : std_logic_vector (31 downto 0):= (others => '0');

signal CarryIn: std_logic := '0';
signal CarryOut: std_logic;


signal temp_result : std_logic_vector (63 downto 0) := (others => '0');--"000000000000000000000000000000000";

component add is
Port (CarryIn		: in 	STD_LOGIC;
		Operand1		: in	STD_LOGIC_VECTOR (31 downto 0);
		Operand2		: in	STD_LOGIC_VECTOR (31 downto 0);
		Sum			: out	STD_LOGIC_VECTOR (31 downto 0);
		CarryOut		: out STD_LOGIC);
end component;

begin

add0 : add
PORT MAP (
	CarryIn			=>  CarryIn,
	Operand1			=>  Op1,
	Operand2			=>  Op2,
	Sum				=>  Sum,
	CarryOut			=>  CarryOut
);

process (Operand1, Operand2, Sum, Control)
variable divisor: unsigned(63 downto 0):= (others => '0');
variable remainder: unsigned (63 downto 0):= (others => '0');
variable temp_remainder: unsigned(63 downto 0):= (others => '0');
variable quotient: unsigned (31 downto 0):= (others => '0');

begin  
 --  if (Clk'event and Clk = '1') then
      if Control(5) = '1' then
         Result1 <= X"00000000";
		 	Debug   <= X"00000000";
      else
			--add
			if (Control = "000000") then
				Op1 <= x"00000000";
				Op2 <= x"00000000";
				Result1 <= x"00000000";
			elsif Control = "000001" then
				Op1 <= Operand1;
				Op2 <= Operand2;
				CarryIn <= '0';
				
				Result1 <= (others => '0');
				Debug <= (others => '0');
				Result1 <= Sum;		
				
				if (Operand1(31) XOR Operand2(31)) = '0' And  Sum(31)/= Operand1(31) then
					Debug(1) <= '1';
				else
					Debug(1) <= '0';
				end if;
			
			--addu
			elsif Control = "000010" then
				Op1 <= Operand1;
				Op2 <= Operand2;
				CarryIn <= '0';
				
				Result1 <= (others => '0');
				Debug <= (others => '0');
				
				Result1 <= Sum;		
				Debug(0) <= CarryOut;
			
			--sub
			elsif Control = "000011" then
				Op1 <= Operand1;
				Op2 <= not(Operand2);
				CarryIn <= '1';
				
				Result1 <= Sum;
				Debug(0) <= '0';
			
				if (Operand1(31) XOR Operand2(31)) = '1' And  Sum(31)/= Operand1(31) then
					Debug(1) <= '1';
				else
					Debug(1) <= '0';
				end if;
			
			--subu
			elsif Control = "000100" then
				CarryIn <= '1';
				if Operand1 > Operand2 then
					Op1 <= Operand1;
					Op2 <= not(Operand2);
				else
					Op1 <= not(Operand1);
					Op2 <= Operand2;
				end if;
					Result1 <= Sum;
					Debug(0) <= CarryOut;
					Debug(1) <= '0';
					
			--mul		
			elsif Control = "000101" then
			-- convert to positive and then send for multiplication
				if  Operand1(31) = '1' then
					Op1 <= std_logic_vector(unsigned(not(Operand1)) + 1);
				end if;
				if  Operand2(31) = '1' then
					Op2 <= std_logic_vector(unsigned(not(Operand2)) + 1);
				end if;

				temp_result <= Op1 * Op2;				
				
				--convert the multiplication result to negative 
				if (Operand1(31) XOR Operand2(31)) = '1' AND temp_result(63)='0' then
					temp_result <= std_logic_vector(unsigned (not(temp_result)) + 1);
				end if;

			--mul		
			elsif Control = "000110" then
				temp_result <= Operand1 * Operand2;				


			elsif Control = "000111" or Control = "001000" then
					remainder (31 downto 0) := unsigned(Operand1);
					divisor(63 downto 32):= unsigned(Operand2);					
					--conver the dividend and the divisor to positive for the initial calculation
					if (Operand1(31) = '1' and Control = "000111") then
						remainder(31 downto 0) := unsigned(not(Operand1)) + 1;
					end if;					
					if (Operand2(31) = '1' and Control = "000111") then
						divisor(63 downto 32) := unsigned(not(Operand2)) + 1;
					end if;
				
					for c in 0 to 32 loop
						temp_remainder:= remainder;
						remainder := remainder - divisor;
						if remainder(63)='1' then
							quotient(31 downto 0) := quotient(30 downto 0) & '0';
							remainder := temp_remainder;
						else
							quotient(31 downto 0) := quotient(30 downto 0) & '1';
						end if;
						divisor(63 downto 0) := '0' & divisor(63 downto 1);
					end loop;

					--revert the answer to negative if it is signed division
					if (Operand1(31) XOR Operand2(31)) = '1' and quotient(31) = '0' and Control = "000111" then
						quotient := not(quotient) + 1;
					end if;
					if Operand1(31) = '1' and remainder(31) = '0' and Control = "000111" then
						remainder := not(remainder) + 1;
					end if;
					
					temp_result (63 downto 32) <= std_logic_vector(remainder (31 downto 0));
					temp_result (31 downto 0) <= std_logic_vector(quotient);
--					Result2 <= std_logic_vector(quotient);
--					Result1 <= std_logic_vector(remainder (31 downto 0));
				
				
			--slt
			elsif Control = "001001" then
				Op1 <= Operand1;
				Op2 <= not(Operand2);
				CarryIn <= '1';
				Result1 <= (others => '0');
				Result1(0) <= Sum(31);
			
			--beq
			elsif Control = "001010" then
				--Op1 <= Operand1;
				--Op2 <= not(Operand2);
				--CarryIn <= '1';
				
				--Result1 <= (others => '0');				
				--if Sum = X"00000000" then
				if Operand1 = Operand2 then
					Zero <= '1';
				else
					Zero <= '0';
				end if;
				
			--bne
			elsif Control = "001011" then
				Op1 <= Operand1;
				Op2 <= not(Operand2);
				CarryIn <= '1';
				
				Result1 <= (others => '0');				
				if Sum /= X"00000000" then
					Zero <= '0';
				
				end if;
				
			--and
			elsif Control = "001100" then
				Result1 <= Operand1 AND Operand2;
			
			--or
			elsif Control = "001101" then
				Result1 <= Operand1 OR Operand2;		
			
			--xor
			elsif Control = "001110" then
				Result1 <= Operand1 XOR Operand2;
			
			--nor
			elsif Control = "001111" then
				Result1 <= Operand1 NOR Operand2;	
			
			--shift left
			elsif Control = "010000" then
				Result1 <= std_logic_vector(unsigned(Operand1) sll to_integer(unsigned(Operand2)));
			
			--shift right
			elsif Control = "010001" then
				Result1 <= std_logic_vector(unsigned(Operand1) srl to_integer(unsigned(Operand2)));
			
			--shift arith
			elsif Control = "010010" then
				Result1 <= to_stdlogicvector(to_bitvector(Operand1) sra to_integer(unsigned(Operand2)));
				
			--mfhi	
			elsif Control = "010011" then
				Result1 <= temp_result (63 downto 32);
				
			--mflo	
			elsif Control = "010100" then
				Result1 <= temp_result (31 downto 0);
			
			--bgez
			elsif Control = "010101" then
				if (Operand1 >= X"00000000") then
					Zero <= '1';
				else
					Zero <= '0';
				end if;			
			end if;
      end if;
 --  end if;
end process;


end Behavioral;

