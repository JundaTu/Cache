library ieee;
use ieee.std_logic_1164.all;

entity control_unit is
  port (
	instr  : in std_logic_vector(31 downto 0);
	RegDst : out std_logic;
	ALUSrc : out std_logic;
	MemtoReg : out std_logic;
	RegW : out std_logic;
	MemR : out std_logic;
	MemW : out std_logic;
	Branch : out std_logic;
	Bne    : out std_logic;
	Bgtz   : out std_logic;
	aluctr: out std_logic_vector(3 downto 0)
	);
end control_unit;

architecture strcuture of control_unit is

component main_control is
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
end component main_control;

component alu_control is
  port (
	func : in std_logic_vector(5 downto 0);
	alu_op : in std_logic_vector(1 downto 0);
	aluctr : out std_logic_vector(3 downto 0)
  	);
end component alu_control;

signal t1 : std_logic_vector(1 downto 0);

begin
M : main_control port map(instr(31 downto 26),t1,RegDst,ALUSrc,MemtoReg,RegW,MemR,MemW,Branch,Bne,Bgtz);
A : alu_control  port map(instr(5 downto 0),t1,aluctr);

end architecture strcuture;