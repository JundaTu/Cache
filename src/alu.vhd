library IEEE;
use IEEE.std_logic_1164.all;
use WORK.eecs361.all;
use WORK.eecs361_gates.all;

entity alu is
	port (
		A,B : in std_logic_vector (31 downto 0);
		ALUOp : in std_logic_vector (3 downto 0);
		-- 0000 and
		-- 0001 or
		-- 0010 xor
		-- 0011 add
		-- 0111 sub
		-- 0100 slt
		-- 0101 sltu
		-- 1000 sll
		-- 1001 srl
  	SHAMT : in std_logic_vector (4 downto 0);
		R : out std_logic_vector(31 downto 0);
		Overflow : out std_logic;
		Zero : out std_logic;
		Carryout : out std_logic
		);
end entity alu;

architecture structure of alu is
	component alu_bit is
		port (
	  	a,b : in std_logic;
	  	cin : in std_logic;
	  	less : in std_logic;
	  	b_invert : in std_logic;
	  	s_sel : in std_logic_vector(2 downto 0);
	  	cout : out std_logic;
	  	r : out std_logic
  	);
  end component alu_bit;

  component left_shifter is
  	port (
			A : in std_logic_vector(31 downto 0);
			shamt : in std_logic_vector(4 downto 0);
			D : out std_logic_vector(31 downto 0)
  	);
  end component left_shifter;

  component right_shifter is
  	port (
			A : in std_logic_vector(31 downto 0);
			shamt : in std_logic_vector(4 downto 0);
			D : out std_logic_vector(31 downto 0)
  	);
  end component right_shifter;

  component or32 is
	  port (
			x : in std_logic_vector(31 downto 0);
			z : out std_logic
	  );
	end component or32; -- or32

	signal bnegate: std_logic;
  signal slt_t :std_logic;
  signal sltu_t :std_logic;
  signal less_in : std_logic;
  signal ov : std_logic;
  signal temp_r : std_logic_vector(31 downto 0);
  signal temp_cout : std_logic_vector(31 downto 0);
  signal temp_d1 : std_logic_vector(31 downto 0);
  signal temp_d2 : std_logic_vector(31 downto 0);
  signal temp_s : std_logic_vector(31 downto 0);
  signal result : std_logic_vector(31 downto 0);
  signal temp_z :std_logic;
  signal temp_less : std_logic_vector(31 downto 0);
  signal arithmatic_out : std_logic_vector(31 downto 0);
  signal a1 : std_logic;
  signal re_sel : std_logic;

begin
	
	bnegate <= ALUOp(2);
	bit0: alu_bit port map (a=>A(0), b=>b(0), 
													cin=>bnegate, 
													less=>less_in, 
													b_invert=>bnegate,
													s_sel=>ALUOp(2 downto 0),
													cout=>temp_cout(0),
													r=>temp_r(0)
													);

	mid_bits: for i in 1 to 30 generate
		bits: alu_bit port map (a=>A(i), b=>B(i),
														cin=>temp_cout(i-1),
														less=>'0',
														b_invert=>bnegate,
														s_sel=>ALUOp(2 downto 0),
														cout=>temp_cout(i),
														r=>temp_r(i)
														);
	end generate ; -- middle_bits

	bit31: alu_bit port map (a=>A(31), b=>b(31), 
													cin=>temp_cout(30),
													less=>'0', 
													b_invert=>bnegate,
													s_sel=>ALUOp(2 downto 0),
													cout=>temp_cout(31),
													r=>temp_r(31)
													);

	OVF: xor_gate port map (x=>temp_cout(30), y=>temp_cout(31), z=>ov);
	Overflow <= ov;
	Carryout <= temp_cout(31);
	SLT_D: xor_gate port map (x=>ov, y=>temp_r(31), z=>slt_t);
	SLTU_D: not_gate port map (x=>temp_cout(31), z=>sltu_t);
	Less_mux: mux port map(sel=>ALUOp(0), src0=>slt_t, src1=>sltu_t, z=>less_in);
  temp_less <= (0 => less_in, others => '0');
  NOT1: not_gate port map (x=>ALUOp(1), z=>a1);
  AND1: and_gate port map (x=>ALUOp(2), y=>a1, z=> re_sel);
  MUX1: mux_32 port map (sel=>re_sel, src0=>temp_r, src1=>temp_less, z=>arithmatic_out);

	Shift_L: left_shifter port map (A=>B, shamt=>SHAMT, D=>temp_d1);
	Shift_R: right_shifter port map (A=>B, shamt=>SHAMT, D=>temp_d2);
	Shift: mux_32 port map(sel=>ALUOp(0), src0=>temp_d1, src1=>temp_d2, z=>temp_s);

	Result_mux: mux_32 port map(sel=>ALUOp(3), src0=>arithmatic_out, src1=>temp_s, z=>result);
	Zero1: or32 port map (x=>result, z=>temp_z);
	Zero2: not_gate port map (x=>temp_z, z=>Zero);
	R<=result;
end architecture ; -- structure