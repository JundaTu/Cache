library ieee;
use ieee.std_logic_1164.all;
use work.eecs361.all;

entity pc_reg is
  port (
  	clk	: in  std_logic;
    reset : in std_logic;
  	d	: in  std_logic_vector(31 downto 0);
  	q	: out std_logic_vector(31 downto 0)
  );
end pc_reg;

architecture structure of pc_reg is

  component dff is
    port(
      clk : in std_logic;
      d   : in std_logic;
      q   : out std_logic
    );
  end component dff;

  signal td : std_logic_vector(31 downto 0);

begin
  mux1: mux_32 port map (sel => reset, src0 => d, src1 => x"00400020", z => td);

  reg_1:for i in 0 to 31 generate begin
    u1 : dff port map(clk=>clk,d=>td(i),q=>q(i));
  end generate;
  
end structure;