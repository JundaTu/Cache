-- By Jianbo Liu
library ieee;
use ieee.std_logic_1164.all;
use work.eecs361.all;
use work.eecs361_gates.all;

entity IF_unit is
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
end entity; -- IF_unit

architecture structure of IF_unit is

  component adder_32bit is
    port(
      a,b : in std_logic_vector(31 downto 0);
      sum : out std_logic_vector(31 downto 0)
    );
  end component adder_32bit;

  component pc_reg is
    port (
      clk : in  std_logic;
      reset : in std_logic;
      d : in  std_logic_vector(31 downto 0);
      q : out std_logic_vector(31 downto 0)
    );
  end component pc_reg;

  component sll2 is
    port(
      a : in std_logic_vector(31 downto 0);
      z : out std_logic_vector(31 downto 0)
    );
  end component sll2;

  signal pc : std_logic_vector(31 downto 0);
  signal pc_out : std_logic_vector(31 downto 0);
  signal pc_plus_4 : std_logic_vector(31 downto 0);
  signal br_immd : std_logic_vector(31 downto 0);
  signal br_addr : std_logic_vector(31 downto 0);
  signal pc_sel : std_logic;
  signal a0, b0, b1, b2, c0 : std_logic;
  signal Zero_bar, Rs_sign_bar : std_logic;

begin
  PCreg: pc_reg port map (clk => clk, reset => rst, d => pc, q => pc_out);
  Plus4: adder_32bit port map (a => pc_out, b => x"00000004", sum => pc_plus_4);
  SLL0: sll2 port map (a => Immd, z => br_immd);
  BR: adder_32bit port map (a => pc_plus_4, b => br_immd, sum => br_addr);
  AND1 : and_gate port map (x => B_eq, y => Zero, z => b0);
  NOT1 : not_gate port map (x => Zero, z => Zero_bar);
  AND2 : and_gate port map (x => B_ne, y => Zero_bar, z => b1);
  NOT2 : not_gate port map (x => Rs_sign, z => Rs_sign_bar);
  AND3 : and_gate port map (x => B_gtz, y => Zero_bar, z => c0);
  AND4 : and_gate port map (x => c0, y => Rs_sign_bar, z => b2);
  OR1 : or_gate port map (x => b0, y => b1, z => a0);
  OR2 : or_gate port map (x => a0, y => b2, z => pc_sel);
  PCNEXT: mux_32 port map (sel => pc_sel, src0 => pc_plus_4, src1 => br_addr, z => pc);
  InstMem : sram
  generic map (
    mem_file => "data/unsigned_sum.dat"
  )
  port map (
    cs => '1',
    oe => '1',
    we => '0',
    addr => pc_out,
    din => x"00000000",
    dout => Instruction
  );


end architecture; -- structure