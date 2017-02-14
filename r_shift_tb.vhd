library ieee;
use ieee.numeric_std.all;
use ieee.std_logic_1164.all;
use work.eecs361_gates.all;
use work.eecs361.r_shift;

entity r_shift_tb is
end r_shift_tb;

architecture behavioral of r_shift_tb is
signal a:std_logic_vector(31 downto 0);
signal y:std_logic_vector(4 downto 0);
signal z:std_logic_vector(31 downto 0);


begin
  test_comp : r_shift
	
	port map (
	  a  => a,
	--  y => y,
     z=>z
	);
	
  testbench : process
  
  begin
	a <= x"00000001";
	y <= "00001";
	wait for 5 ns;
	
	wait for 5 ns;
	
   a <= x"00000111";
   y <= "00011";

   wait for 5 ns;
   a <= x"01010101";
   y <= "10101";

    
	wait for 5 ns;
	wait;
  end process;

end behavioral;

