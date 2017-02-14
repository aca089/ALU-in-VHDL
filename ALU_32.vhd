library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

use work.eecs361_gates.all;
use work.eecs361.one_bit_alu;
use work.eecs361.not_gate;
use work.eecs361.or_16;
use work.eecs361.r_shift;

entity ALU_32 is

	port(a,b:in std_logic_vector(31 downto 0);
	    Operation:in std_logic_vector(2 downto 0);
	    Result:out std_logic_vector(31 downto 0);
	    Zero:out std_logic;
	    Overflow:out std_logic;
	    CarryOut:out std_logic
	    );
	
end ALU_32;
	
	
architecture structural of ALU_32 is
 
	component xor_gate
		port(x,y:in std_logic;z:out std_logic);
	end component;
	
	component and_gate
		port(x,y:in std_logic;z:out std_logic);
	end component;
	
	component or_gate
		port(x,y:in std_logic;z:out std_logic);
	end component;
	
	component one_bit_adder
		port(a,b,CarryIn: in std_logic;sum: out std_logic;cout:out std_logic;overflow:out std_logic);
	end component;
	
   component mux
		port(sel,src0,src1:in std_logic;z:out std_logic);
	end component;
	
	component mux_4_1
	    port (sel: in std_logic_vector(1 downto 0);src0,src1,src2,src3:in std_logic;z:out std_logic);
	end component;
	

	
	component one_bit_alu
	    
	          port(a,b,Less,Less_unsigned,shift,carryIn: in std_logic;
		       Operation: in std_logic_vector(2 downto 0);
		       Result, CarryOut,Sum,Overflow:out std_logic
	       
	       );
	       
	end component;
	
	component or_16 is
     port (
       x:in std_logic_vector(15 downto 0);
       z:out std_logic
     );
  end component or_16;
	
	  
   component not_gate is
     port (
       x   : in  std_logic;
       z   : out std_logic
     );
   end component;
   

 

   signal c:std_logic_vector(30 downto 0);
   signal Less:std_logic_vector(31 downto 0);
   signal Less_unsigned:std_logic_vector(31 downto 0);
	signal set:std_logic;
	signal set_u:std_logic;
	signal temp_sum:std_logic_vector(31 downto 0);
	signal temp_sltu:std_logic;
	signal temp_overflow:std_logic_vector(31 downto 0);
	signal temp_shift:std_logic_vector(31 downto 0);
	signal temp_cin:std_logic;
	signal temp_carryout:std_logic;
	signal temp_nor:std_logic_vector(31 downto 0);
	signal temp_result:std_logic_vector(31 downto 0);
	signal zero_temp:std_logic_vector(31 downto 0);
	signal temp1_or:std_logic;
	signal temp2_or:std_logic;
	signal temp3_or:std_logic;
	
	begin
	    
	    Less<=x"00000000";
	    Less_unsigned<=x"00000000";
	    temp_nor<= x"00000000";
	    
	    temp_cin<=Operation(2);
	    
	    A1:one_bit_alu port map(a(0),b(0),temp_sum(31),set,temp_shift(0),temp_cin,Operation,temp_result(0),c(0),temp_sum(0),temp_overflow(0));
	    G1:for i in 1 to 30 generate
	       ALUs:one_bit_alu port map(a(i),b(i),Less(i),Less_unsigned(i),temp_shift(i),c(i-1),Operation,temp_result(i),c(i),temp_sum(i),temp_overflow(i));
	    end generate;
--	    A32:ALU_31 port map(a(31),b(31),Less(31),Less_unsigned(31),temp_shift,c(30),Operation,Result(31),Overflow,Carryout,temp_sum);
	    A32:one_bit_alu port map(a(31),b(31),Less(31),Less_unsigned(31),temp_shift(31),c(30),Operation,temp_result(31),temp_carryout,temp_sum(31),temp_overflow(31));
	 
	 
	    G2: not_gate port map(temp_carryout,set);
	    G3: or_16 port map(temp_result(15 downto 0),temp1_or);
	    G4: or_16 port map(temp_result(31 downto 16),temp2_or);
	    G5: or_gate port map(temp1_or,temp2_or,temp3_or);
	    G6: not_gate port map(temp3_or,Zero); 
	    G7: r_shift port map(a,temp_shift);
	    
 
	    
	 --   G3: or_gate port map(c(30),temp_carryout,Overflow);
	 
	 
	
	    Overflow<=temp_overflow(31);
	    Result<=temp_result;
 
	    CarryOut<=temp_carryout;
	  --  Overflow<=temp_overflow;
	    
	  
	    
	       
	
end architecture structural;	


