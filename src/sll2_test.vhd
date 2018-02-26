library ieee;
library work;
use ieee.std_logic_1164.all;
use work.dff;
use work.sll2;

entity sll2_test is
  
end sll2_test;

architecture structure of sll2_test is
  signal a : std_logic_vector(31 downto 0);
  signal z : std_logic_vector(31 downto 0);
  
component sll2 is
port(
  a : in std_logic_vector(31 downto 0);
  z : out std_logic_vector(31 downto 0)
);
end component sll2;
  
  --signal t_din,t_qout : std_logic_vector(31 downto 0);
begin
  test_comp : sll2
  port map(
    a => a,
    z => z
  );
  testbench : process
  begin
    a<="00000000000000000000000000000111";
    wait for 50ns;
    
    a<="00000000000000000011100000000011";
    wait for 100ns;
    --clk<='1';
    a<="00000000000000011111000000000000";
    wait for 50ns;
    a<="11100000000000000000000000000000";
    wait for 100ns;
    --clk<='0';
    wait;
end process;
  
end architecture structure;







