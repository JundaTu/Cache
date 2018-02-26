library ieee;
use ieee.std_logic_1164.all;
use work.dff;

entity reg_32bit is
  port (
	clk	: in  std_logic;
	d	: in  std_logic_vector(31 downto 0);
	q	: out std_logic_vector(31 downto 0)
  );
end reg_32bit;

architecture structure of reg_32bit is
  component dff is
    port(
      clk : in std_logic;
      d   : in std_logic;
      q   : out std_logic
    );
  end component dff;
begin
  reg_1:for i in 0 to 31 generate begin
    u1 : dff port map(clk=>clk,d=>d(i),q=>q(i));
  end generate;
  
end structure;