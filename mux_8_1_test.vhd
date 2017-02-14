library ieee;
use ieee.std_logic_1164.all;
use work.eecs361_gates.all;
use work.eecs361.mux_8_1;

entity mux_8_tb is
	
end mux_8_tb;

architecture behavioral of mux_8_tb is


signal sel_tb	: std_logic_vector(2 downto 0);
signal src0,src1,src2,src3,src4,src5,src6,src7:std_logic;
signal z:std_logic;


begin
  test_comp:mux_8_1
	port map (
	  sel  => sel_tb,
	  src0 => src0,
	  src1 => src1,
	  src2=>src2,
	  src3=>src3,
	  src4=>src4,
	  src5=>src5,
	  src6=>src6,
	  src7=>src7,
	  z	  => z
	);
	
	testbench : process
	 begin
	   sel_tb <= "010";
	   src0 <= '0';
	   src1 <= '0';
	   src2 <='0';
	   src3<='1';
	   src4<='0';
	   src5<='1';
	   src6<='1';
	   src7<='0';
	   wait for 5 ns;
	   wait for 5 ns;

   	sel_tb <= "011";
	   src0 <= '1';
	   src1 <= '1';
	   src2 <='0';
	   src3<='1';
	   src4<='0';
	   src5<='1';
	   src6<='1';
	   src7<='0';
	   wait for 5 ns;
	   wait for 5 ns;

      sel_tb <= "000";
	   src0 <= '1';
	   src1 <= '1';
	   src2 <='0';
	   src3<='1';
	   src4<='0';
	   src5<='1';
	   src6<='1';
	   src7<='0';
	   wait for 5 ns;
	   wait for 5 ns;
	   wait;
     end process;
end behavioral;

