-- By Jianbo Liu
library ieee;
use ieee.std_logic_1164.all;
use work.eecs361.all;
use work.eecs361_gates.all;

entity extender is
  port (
    a : in std_logic_vector(15 downto 0);
    z : out std_logic_vector(31 downto 0)
  );
end entity extender;

architecture structure of extender is
begin

  z <= (31 downto 16 => a(15)) & a;

end architecture structure;