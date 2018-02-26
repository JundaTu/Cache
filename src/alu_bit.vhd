library IEEE;
use IEEE.std_logic_1164.all;
use WORK.eecs361.all;
use WORK.eecs361_gates.all;

entity alu_bit is
  port (
  	a,b : in std_logic;
  	cin : in std_logic;
  	less : in std_logic;
  	b_invert : in std_logic;
  	s_sel : in std_logic_vector(2 downto 0);
  	cout : out std_logic;
  	r : out std_logic
  ) ;
end entity ; -- alu_bit

architecture structural of alu_bit is
	component mux8_1 is
		port (
			a0,a1,a2,a3,a4,a5,a6,a7 : in std_logic;
			s : in std_logic_vector (2 downto 0);
			sout : out std_logic
  		);
	end component mux8_1;

	component full_adder is
		port (
			a,b : in std_logic;
			carryin : in std_logic;
			sum : out std_logic;
			carryout : out std_logic
  		);
	end component full_adder;


	signal and_s : std_logic;
	signal or_s : std_logic;
	signal xor_s : std_logic;
	signal add_s : std_logic;
	signal b_bar : std_logic;
	signal b_in : std_logic;

begin
	and_op : and_gate port map (x => a, y => b, z => and_s);

	or_op : or_gate port map (x => a, y => b, z => or_s);

	xor_op : xor_gate port map (x => a, y => b, z => xor_s);

	inverter : not_gate port map (x => b, z => b_bar);

	mux1 : mux port map (sel => b_invert, src0 => b, src1 => b_bar, z => b_in);

	add_op : full_adder port map (a => a, b => b_in, carryin => cin, sum => add_s, carryout => cout);

	result_sel : mux8_1 port map (
					a0 => and_s,
					a1 => or_s,
					a2 => xor_s,
					a3 => add_s,
					a4 => add_s,
					a5 => less,
					a6 => '0',
					a7 => add_s,
					s => s_sel,
					sout => r
					);
	
end architecture ; -- structural