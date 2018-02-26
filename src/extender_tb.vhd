-- By Jianbo Liu
library ieee;
use ieee.std_logic_1164.all;

entity extender_tb is
end entity extender_tb; -- extender_tb

architecture bahavior of extender_tb is

  component extender is
    port (
      a : in std_logic_vector(15 downto 0);
      z : out std_logic_vector(31 downto 0)
    );
  end component extender;

  signal a : std_logic_vector(15 downto 0);
  signal z : std_logic_vector(31 downto 0);

begin
ext: extender port map ( a => a, z => z);
process
begin
  a <= x"0011";
  wait for 5 ns;
  a <= x"1011";
  wait for 5 ns;
  a <= x"f011";
  wait for 5 ns;
  a <= x"f031";
  wait for 5 ns;
  wait;
end process;
end architecture bahavior; -- bahavior