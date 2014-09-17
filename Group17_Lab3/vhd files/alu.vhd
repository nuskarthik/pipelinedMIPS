library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.std_logic_unsigned.all;
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
use IEEE.NUMERIC_STD.ALL;

entity alu is
Port (	Clk			: in	STD_LOGIC;
			stall			: in std_logic;
			Control		: in	STD_LOGIC_VECTOR (5 downto 0);
			Operand1		: in	STD_LOGIC_VECTOR (31 downto 0);
			Operand2		: in	STD_LOGIC_VECTOR (31 downto 0);
			Result1		: out	STD_LOGIC_VECTOR (31 downto 0);
			Zero			: out std_logic);
end alu;

architecture Behavioral of alu is

signal Op1 : std_logic_vector (31 downto 0):= (others => '0');
signal Op2 : std_logic_vector (31 downto 0):= (others => '0');
signal Sum : std_logic_vector (31 downto 0):= (others => '0');
signal CarryIn: std_logic := '0';

signal dividend: STD_LOGIC_VECTOR(31 downto 0):= (others => '0');
signal divisor: STD_LOGIC_VECTOR(31 downto 0):= (others => '0');
signal remainder: STD_LOGIC_VECTOR (31 downto 0):= (others => '0');
signal quotient: STD_LOGIC_VECTOR (31 downto 0):= (others => '0');

component add is
Port (CarryIn		: in 	STD_LOGIC;
		Operand1		: in	STD_LOGIC_VECTOR (31 downto 0);
		Operand2		: in	STD_LOGIC_VECTOR (31 downto 0);
		Sum			: out	STD_LOGIC_VECTOR (31 downto 0));
end component;

component division is
port (
		clk 			: in std_logic;
		div_enable	: in std_logic;	
		Dividend		: in	STD_LOGIC_VECTOR (31 downto 0);
		Divisor		: in	STD_LOGIC_VECTOR (31 downto 0);
		Quotient		: out	STD_LOGIC_VECTOR (31 downto 0);
		Remainder	: out	STD_LOGIC_VECTOR (31 downto 0)
);
end component;


begin


add0 : add
PORT MAP (
	CarryIn			=>  CarryIn,
	Operand1			=>  Op1,
	Operand2			=>  Op2,
	Sum				=>  Sum
	);

div0: division 
port map(
		clk 			=> clk,
		div_enable	=> stall,	
		Dividend		=> dividend,
		Divisor		=> divisor,
		Quotient		=> quotient,
		Remainder	=> remainder
);


process (Operand1, Operand2, Sum, Control, stall)
variable temp_result : std_logic_vector (63 downto 0) := (others => '0');--"000000000000000000000000000000000";

begin  	
      if Control(5) = '1' then
         Result1 <= X"00000000";
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
				Result1 <= Sum;					
			--addu
			elsif Control = "000010" then
				Op1 <= Operand1;
				Op2 <= Operand2;
				CarryIn <= '0';
				
				Result1 <= (others => '0');
				
				Result1 <= Sum;					
			--sub
			elsif Control = "000011" then
				Op1 <= Operand1;
				Op2 <= not(Operand2);
				CarryIn <= '1';
				
				Result1 <= Sum;			
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
					
			--mul or mulu
			elsif Control = "000101" or Control = "000110" then
			-- convert to positive and then send for multiplication
				Op1 <= Operand1;
				Op2 <= Operand2;
				if  Operand1(31) = '1' and Control = "000101" then
					Op1 <= std_logic_vector(unsigned(not(Operand1)) + 1);
				end if;
				if  Operand2(31) = '1' and Control = "000101" then
					Op2 <= std_logic_vector(unsigned(not(Operand2)) + 1);
				end if;
				temp_result := Operand1 * Operand2;				
				
				--convert the multiplication result to negative 
				if (Operand1(31) XOR Operand2(31)) = '1' AND temp_result(63)='0' and Control = "000101" then
					temp_result := std_logic_vector(unsigned (not(temp_result)) + 1);
				end if;

			--divisor (both signed and unsigned)
			elsif Control = "000111" or Control = "001000"  then

					dividend <= Operand1;
					divisor <= Operand2;
					
					if (Operand1(31) = '1' and Control = "000111") then
						dividend <= std_logic_vector(unsigned(not(Operand1)) + 1);
					end if;		
						
					if (Operand2(31) = '1' and Control = "000111") then
						divisor <= std_logic_vector(unsigned(not(Operand2)) + 1);
					end if;

					temp_result := quotient & remainder;										
					if (Operand1(31) XOR Operand2(31)) = '1' and quotient(31) = '0' and Control = "000111" then
						temp_result(63 downto 32):= std_logic_vector(unsigned(not(quotient)) + 1);
					end if;
					
					if Operand1(31) = '1' and remainder(31) = '0' and Control = "000111" then
						temp_result (31 downto 0) := std_logic_vector(unsigned(not(remainder)) + 1);
					end if;

			--slt
			elsif Control = "001001" then
				Op1 <= Operand1;
				Op2 <= not(Operand2);
				CarryIn <= '1';
				Result1 <= (others => '0');
				Result1(0) <= Sum(31);
			
			--beq
			elsif Control = "001010" then
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
				if (Operand1(31) = '1') then
					Zero <= '0';
				else
					Zero <= '1';
				end if;			
			end if;
      end if;
end process;


end Behavioral;

