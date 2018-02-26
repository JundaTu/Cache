library ieee;
use ieee.std_logic_1164.all;

entity alu_control is
  port (
	func : in std_logic_vector(5 downto 0);
	alu_op : in std_logic_vector(1 downto 0);
	aluctr : out std_logic_vector(3 downto 0)
  	);
end alu_control;

architecture structure of alu_control is

component or_gate is 
         port(
              x,y : in  std_logic;
              z   : out std_logic
              );
end component or_gate;

component and_gate is 
         port(
              x,y : in  std_logic;
              z   : out std_logic
              );
end component and_gate;

component not_gate is
  port (
    x   : in  std_logic;
    z   : out std_logic
  );
end component not_gate;

component and_4in is
  port (
	x1 : in std_logic;
	x2 : in std_logic;
	x3 : in std_logic;
	x4 : in std_logic;
	z  : out std_logic
  	);
end component and_4in;

signal a0,a1,f0,f1,f2,f3,f4,f5,
       s1,s2,
       t0,t1,t2,t3,t4,t5,t6,t7,
       d0,d1,d2,d3,d4,d5,d6,
       b0,b1,b2,b3,b4,b5,b6 : std_logic;
	 	 
begin
N_A0 : not_gate port map(alu_op(0),a0);
N_A1 : not_gate port map(alu_op(1),a1);
N_f0 : not_gate port map(func(0),f0);
N_f1 : not_gate port map(func(1),f1);
N_f2 : not_gate port map(func(2),f2);
N_f3 : not_gate port map(func(3),f3);
N_f4 : not_gate port map(func(4),f4);
N_f5 : not_gate port map(func(5),f5);
A00  : and_gate port map(a0,a1,t0);
A01  : and_gate port map(alu_op(0),a1,t1);
A10  : and_gate port map(alu_op(1),a0,t2);

ctr3_1 : and_4in port map(alu_op(1),a0,f5,f4,s1);
ctr3_2 : and_4in port map(f3,f2,f1,f0,s2);
ctr3_3 : and_gate port map(s1,s2,aluctr(3));

ctr2_1 : and_4in port map(func(5),f4,f2,func(1),t3);
ctr2_2 : and_gate port map(t3,t2,t4);
ctr2_3 : or_gate port map(t1,t4,aluctr(2));

ctr1_1 : and_4in port map(func(5),f4,f3,f2,t5);
ctr1_2 : and_gate port map(t5,t2,t6);
ctr1_3 : or_gate port map(t6,t1,t7);
ctr1_4 : or_gate port map(t7,t0,aluctr(1));

ctr0_1 : and_4in port map(alu_op(1),a0,func(5),f4,d0);
ctr0_2 : and_4in port map(f3,f2,f1,f0,d1);
ctr0_3 : and_4in port map(f3,f2,f1,func(0),d2);
ctr0_4 : and_4in port map(f3,f2,func(1),f0,d3);
ctr0_5 : and_4in port map(f3,f2,func(1),func(0),d4);
ctr0_6 : and_4in port map(f3,func(2),f1,func(0),d5);
ctr0_7 : and_4in port map(func(3),f2,func(1),func(0),d6);
ctr0_8 : or_gate port map(d1,d2,b0);
ctr0_9 : or_gate port map(d3,b0,b1);
ctr0_10 : or_gate port map(d4,b1,b2);
ctr0_11 : or_gate port map(d5,b2,b3);
ctr0_12 : or_gate port map(d6,b3,b4);
ctr0_13 : and_gate port map(d0,b4,b5);
ctr0_14 : or_gate port map(t1,b5,b6);
ctr0_15 : or_gate port map(t0,b6,aluctr(0));

end architecture structure;




