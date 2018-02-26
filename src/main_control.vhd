library ieee;
use ieee.std_logic_1164.all;

entity main_control is
  port (
	op : in std_logic_vector(5 downto 0);
	alu_op : out std_logic_vector(1 downto 0);
	RegDst : out std_logic;
	ALUSrc : out std_logic;
	MemtoReg : out std_logic;
	RegW : out std_logic;
	MemR : out std_logic;
	MemW : out std_logic;
	Branch : out std_logic;
	Bne    : out std_logic;
	Bgtz   : out std_logic
	);
end main_control;
 
architecture structure of main_control is

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

component and_6in is
  port (
	x1 : in std_logic;
	x2 : in std_logic;
	x3 : in std_logic;
	x4 : in std_logic;
	x5 : in std_logic;
	x6 : in std_logic;
	z  : out std_logic
  	);
end component and_6in;

signal o0,o1,o2,o3,o4,o5,t1,t2,t3,t4,t5,t6,t7,
       b0,b1,b2,b3 : std_logic;
       


begin
N_0: not_gate port map(op(0),o0);
N_1: not_gate port map(op(1),o1);
N_2: not_gate port map(op(2),o2);
N_3: not_gate port map(op(3),o3);
N_4: not_gate port map(op(4),o4);
N_5: not_gate port map(op(5),o5);

Rt : and_6in port map(o0,o1,o2,o3,o4,o5,t1);
Lw : and_6in port map(op(0),op(1),o2,o3,o4,op(5),t2);
Sw : and_6in port map(op(0),op(1),o2,op(3),o4,op(5),t3);
Ad : and_6in port map(o0,o1,o2,op(3),o4,o5,t4);
BEQ :and_6in port map(o0,o1,op(2),o3,o4,o5,t5);
BNE1 :and_6in port map(op(0),o1,op(2),o3,o4,o5,t6);
BGTZ1:and_6in port map(op(0),op(1),op(2),o3,o4,o5,t7);

RegDst <= t1;

alusrc_1: or_gate port map(t2,t3,b0);
alusrc_2: or_gate port map(b0,t4,ALUSrc);

MemtoReg <= t2;

regw_1 : or_gate port map(t1,t2,b1);
regw_2 : or_gate port map(b1,t4,RegW);

MemR <= t2;

MemW <= t3;

Branch <= t5;

Bne <= t6;

Bgtz <= t7;

alu_op(1) <= t1;

alu_1: or_gate port map(t5,t6,b3);
alu_2: or_gate port map(b3,t7,alu_op(0));

end architecture structure;





