library IEEE;
use IEEE.std_logic_1164.all;

use work.eecs361_gates.all;
use work.eecs361.mux_4_to_1;
use work.eecs361.mux;

entity mux_8_1 is
	port(
		sel: in std_logic_vector(2 downto 0);
		src0: in std_logic;
		src1: in std_logic;
		src2: in std_logic;
		src3: in std_logic;
		src4: in std_logic;
		src5: in std_logic;
		src6: in std_logic;
		src7: in std_logic;
		z: out std_logic
	
	
	);
	
end mux_8_1;

architecture structural of mux_8_1 is

	component mux_4_to_1 is
		port(
			sel: in std_logic_vector(1 downto 0);
			src0: in std_logic;
			src1: in std_logic;
			src2: in std_logic;
			src3: in std_logic;
			z: out std_logic);
	end component;
	
	component mux
		  port(sel,src0,src1:in std_logic;
			  z:out std_logic
		  );
	end component;
	
	
	signal sig_a,sig_b,sig_output:std_logic;
	
begin
	u1:mux_4_to_1 port map(sel(1 downto 0),src0,src1,src2,src3,sig_a);
	u2:mux_4_to_1 port map(sel(1 downto 0),src4,src5,src6,src7,sig_b);
	u3:mux port map(sel(2),sig_a,sig_b,z);




end structural;
