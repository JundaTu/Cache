library ieee;
library work;
use ieee.std_logic_1164.all;
use work.mux;

entity sll2 is
port(
  a : in std_logic_vector(31 downto 0);
  z : out std_logic_vector(31 downto 0)
);
end sll2;

architecture behavior of sll2 is
begin
  z <= a(29 downto 0) & "00"; 
end behavior;