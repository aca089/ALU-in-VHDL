library IEEE;
use IEEE.std_logic_1164.all;

use work.eecs361_gates.all;

entity one_bit_adder is

	port(a,b,CarryIn: in std_logic;
		sum: out std_logic;
		cout:out std_logic;
		overflow:out std_logic

	
	);
	
end one_bit_adder;
	
	
architecture structural of one_bit_adder is

	component xor_gate
		port(x,y:in std_logic;z:out std_logic);
	end component;
	
	component and_gate
		port(x,y:in std_logic;z:out std_logic);
	end component;
	
	component or_gate
		port(x,y:in std_logic;z:out std_logic);
	end component;
	
	signal sig: std_logic_vector(2 downto 0);
	signal temp_cout:std_logic;
	
	begin
	    
	u0: xor_gate port map(x=>a,y=>b,z=>sig(0));
	u1: xor_gate port map(x=>sig(0),y=>CarryIn,z=>sum);
	u2: and_gate port map(x=>CarryIn,y=>sig(0),z=>sig(1));
	u3: and_gate port map(x=>a,y=>b,z=>sig(2));
	u4: or_gate port map(x=>sig(1),y=>sig(2),z=>temp_cout);
	u5: xor_gate port map(x=>CarryIn,y=>temp_cout,z=>overflow);
	
	cout<=temp_cout;
	
	end architecture structural;
 






