library ieee;
use ieee.numeric_std.all;
use ieee.std_logic_1164.all;
use work.eecs361.one_bit_alu;
use work.eecs361_gates.all;

entity one_bit_alu_test is
end one_bit_alu_test;

architecture behavioral of one_bit_alu_test is
signal a,b:std_logic;
signal Less,Less_unsigned,shift,carryIn	: std_logic;
signal Operation : std_logic_vector(2 downto 0);
signal Result : std_logic;
signal CarryOut : std_logic;
signal Sum,Overflow:std_logic;

begin
  test_comp : one_bit_alu
	
	port map (
	  a  => a,
	  b => b,
	  Less => Less,
	  Less_unsigned=>Less_unsigned,
	  shift=>shift,
	  carryIn=>carryIn,
	  Operation=>Operation,
	  Result=>Result,
	  CarryOut=>CarryOut,
	  Sum=>Sum,
	  Overflow=>Overflow
	);
	
  testbench : process
  
  begin
	Operation <= "000";
	a <= '1';
	b <= '0';
	carryIn<='1';
	wait for 5 ns;
	
	wait for 5 ns;
	
	Operation <= "011";
   a <= '1';
   b <='0';
   carryIn<='0';
   wait for 5 ns;
   
   Operation <= "001";
   a <= '1';
   b <= '1';
   carryIn<='1';
   wait for 5 ns;
   
   Operation <= "110";
   a <= '0';
   b <= '1';
   carryIn<='1';
   wait for 5 ns;
   
   Operation <= "010";
   a <= '0';
   b <= '1';
   carryIn<='1';
   wait for 5 ns;
	
	wait for 5 ns;
	wait;
  end process;

end behavioral;
