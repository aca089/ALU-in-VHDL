library IEEE;
use IEEE.std_logic_1164.all;
use ieee.numeric_std.all;

use work.eecs361_gates.all;

entity r_shift is

	port(a:in std_logic_vector(31 downto 0);
	  --  y:in std_logic_vector(4 downto 0);
	    z:out std_logic_vector(31 downto 0) 
	
	);
	
end r_shift;
	
	
architecture structural of r_shift is



--signal declarations go here

	
	begin
	
	  
	  z(31)<='0';
	  z(30)<=a(31);
	  z(29)<=a(30);
	  z(28)<=a(29);
	  z(27)<=a(28);
	  z(26)<=a(27);
     z(25)<=a(26);
	  z(24)<=a(25);
	  z(23)<=a(24);
	  z(22)<=a(23);
	  z(21)<=a(22);
	  z(20)<=a(21);
	  z(19)<=a(20);
	  z(18)<=a(19);
	  z(17)<=a(18);
	  z(16)<=a(17);
	  z(15)<=a(16);
	  z(14)<=a(15);
	  z(13)<=a(14);
	  z(12)<=a(13);
	  z(11)<=a(12);
	  z(10)<=a(11);
	  z(9)<=a(10);
	  z(8)<=a(9);
	  z(7)<=a(8);
	  z(6)<=a(7);
	  z(5)<=a(6);
	  z(4)<=a(5);
	  z(3)<=a(4);
	  z(2)<=a(3);
	  z(1)<=a(2);
	  z(0)<=a(1);

	
	end architecture structural;

