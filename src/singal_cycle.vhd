library ieee;
use ieee.std_logic_1164.all;
use work.eecs361.all;
use work.eecs361_gates.all;

entity singal_cycle is
  port (
    clk : in std_logic;
    reset : in std_logic;
    Overflow : out std_logic;
    Zero : out std_logic;
    Carryout : out std_logic
  );
end entity singal_cycle; -- singal_cycle

architecture structure of singal_cycle is

  component IF_unit is
    port (
      clk : in std_logic;
      rst : in std_logic;
      B_eq : in std_logic;
      B_ne : in std_logic;
      B_gtz : in std_logic;
      Rs_sign : in std_logic;
      Zero : in std_logic;
      Immd : in std_logic_vector(31 downto 0);
      Instruction : out std_logic_vector(31 downto 0)
    );
  end component;

  component control_unit is
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
  end component;

  component reg_file is
    port (
      clk: in std_logic;
      wr : in std_logic;
      rd : in std_logic_vector(4 downto 0);
      rs_sel : in std_logic_vector(4 downto 0);
      rt_sel : in std_logic_vector(4 downto 0);
      din: in std_logic_vector(31 downto 0);
      rs_out : out std_logic_vector(31 downto 0);
      rt_out : out std_logic_vector(31 downto 0)
    );
  end component;

  component extender is
  port (
    a : in std_logic_vector(15 downto 0);
    z : out std_logic_vector(31 downto 0)
  );
  end component extender;

  component alu is
    port (
      A,B : in std_logic_vector (31 downto 0);
      ALUOp : in std_logic_vector (3 downto 0);
      SHAMT : in std_logic_vector (4 downto 0);
      R : out std_logic_vector(31 downto 0);
      Overflow : out std_logic;
      Zero : out std_logic;
      Carryout : out std_logic
    );
  end component;

  signal B_eq_t : std_logic;
  signal B_ne_t : std_logic;
  signal B_gtz_t : std_logic;
  signal Rs_sign_t : std_logic;
  signal Zero_t : std_logic;
  signal Immd_t : std_logic_vector(31 downto 0);
  signal Instruction_t : std_logic_vector(31 downto 0);
  signal RegDst_t : std_logic;
  signal ALUSrc_t : std_logic;
  signal MemtoReg_t : std_logic;
  signal RegW_t : std_logic;
  signal MemR_t : std_logic;
  signal MemW_t : std_logic;
  signal aluctr_t: std_logic_vector(3 downto 0);
  signal rw_t : std_logic_vector(4 downto 0);
  signal din_t : std_logic_vector(31 downto 0);
  signal rs_out_t : std_logic_vector(31 downto 0);
  signal rt_out_t : std_logic_vector(31 downto 0);
  signal ALU_op_t : std_logic_vector(31 downto 0);
  signal ALU_result : std_logic_vector(31 downto 0);
  signal Mem_out : std_logic_vector(31 downto 0);

begin

  InstructionFetch: IF_unit
  port map (
    clk => clk,
    rst => reset,
    B_eq => B_eq_t,
    B_ne => B_ne_t,
    B_gtz => B_gtz_t,
    Rs_sign => Rs_sign_t,
    Zero => Zero_t,
    Immd => Immd_t,
    Instruction => Instruction_t
  );

  SignExtend: extender
  port map (a => Instruction_t(15 downto 0), z => Immd_t);

  CONTROL: control_unit
  port map (
    instr => Instruction_t,
    RegDst => RegDst_t,
    ALUSrc => ALUSrc_t,
    MemtoReg => MemtoReg_t,
    RegW => RegW_t,
    MemR => MemR_t,
    MemW => MemW_t,
    Branch => B_eq_t,
    Bne => B_ne_t,
    Bgtz => B_gtz_t,
    aluctr => aluctr_t
  );

  MUX1: mux_n
  generic map (n => 5)
  port map (
    sel => RegDst_t, 
    src0 => Instruction_t(20 downto 16), 
    src1 => Instruction_t(15 downto 11), 
    z => rw_t
  );

  RegAccess: reg_file
  port map (
    clk => clk,
    wr => RegW_t,
    rd => rw_t,
    rs_sel => Instruction_t(25 downto 21),
    rt_sel => Instruction_t(20 downto 16), 
    din => din_t,
    rs_out => rs_out_t,
    rt_out => rt_out_t
  );

  Rs_sign_t <= rs_out_t(31);

  MUX2: mux_32
  port map (
    sel => ALUSrc_t,
    src0 => rt_out_t,
    src1 => Immd_t,
    z => ALU_op_t
  );

  ALUComp: alu
  port map (
    A => rs_out_t,
    B => ALU_op_t,
    ALUOp => aluctr_t,
    SHAMT => Instruction_t(10 downto 6),
    R => ALU_result,
    Overflow => Overflow,
    Zero => Zero_t,
    Carryout => Carryout
  );
  Zero <= Zero_t;

  DataMem: sram
  generic map (
    mem_file => "data/unsigned_sum.dat"
  )
  port map (
    cs => '1',
    oe => MemR_t,
    we => MemW_t,
    addr => ALU_result,
    din => rt_out_t,
    dout => Mem_out
  );

  MUX3: mux_32
  port map(
    sel => MemtoReg_t,
    src0 => ALU_result,
    src1 => Mem_out,
    z => din_t
  );

end architecture structure; -- structure