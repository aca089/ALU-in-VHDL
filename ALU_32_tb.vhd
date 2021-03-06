library ieee;
use ieee.numeric_std.all;
use ieee.std_logic_1164.all;
use work.eecs361.one_bit_alu;
use work.eecs361.ALU_32;
use work.eecs361_gates.all;
use work.eecs361.r_shift;

entity ALU_32_tb is
end ALU_32_tb;

architecture behavioral of ALU_32_tb is
signal a,b:std_logic_vector(31 downto 0);
signal Operation : std_logic_vector(2 downto 0);
signal Result : std_logic_vector(31 downto 0);
signal Zero,Overflow,CarryOut : std_logic;


begin
  test_comp : ALU_32
	
	port map (
	  a  => a,
	  b => b,
	  Operation=>Operation,
	  Result=>Result,
	  Zero=>Zero,
	  Overflow=>Overflow,
	  CarryOut=>CarryOut
	);
	
  testbench : process
  
  begin
	Operation <= "000";
	a <= x"00000001";
	b <= x"00000001";
	wait for 5 ns;
	
	wait for 5 ns;
	
	Operation <= "110";
   a <= x"00000111";
   b <= x"00000011";

   wait for 5 ns;
   
   Operation <= "011";
   a <= x"01010101";
   b <= x"11110101";
   wait for 5 ns;
   
   Operation <= "010";
   a <= x"00111010";
   b <= x"11101010";
   
   wait for 5 ns;
   
    Operation <= "001";
    a <= x"01010101";
    b <= x"11010101";
    wait for 5 ns;
	
	 Operation <= "101";
    a <= x"01010101";
    b <= x"11110101";
    wait for 5 ns;
    
  	 Operation <= "100";
  	 a <= x"01010101";
    b <= x"00001011";
    wait for 5 ns;
    
  	 Operation <= "100";
  	 a <= x"00000101";
  	 b <= x"00001011";
    wait for 5 ns;
    
    
  	 Operation <= "010";
  	 a <= x"FFFFFFFF";
  	 b <= x"FFFFFFFF";
    wait for 5 ns;
    
    Operation <="111";
    a<=x"11010010";
    b<="00000000000000000000000000000001";
    wait for 5 ns;
    
      	 Operation <= "010";
  	     a <= x"00000000";
  	     b <= x"00000000";
        wait for 5 ns;
    
    
      	 Operation <= "010";
  	     a <= "01111111111111110000000111110000";
  	     b <= "01010101000000000000000000000000";
        wait for 5 ns;
        
        
        
    
	wait for 5 ns;
	wait;
  end process;

end behavioral;

