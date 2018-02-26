library ieee;
library work;
use ieee.std_logic_1164.all;
use work.dff;
use work.adder_32bit;

entity adder_32bit_test is
  
end adder_32bit_test;

architecture structure of adder_32bit_test is
  signal a,b : std_logic_vector(31 downto 0);
    --cin : in std_logic;
    --cout : out std_logic;
  signal sum : std_logic_vector(31 downto 0);
  
  component adder_32bit is
  port(
    a,b : in std_logic_vector(31 downto 0);
    --cin : in std_logic;
    --cout : out std_logic;
    sum : out std_logic_vector(31 downto 0)
  );
  end component adder_32bit;
  
  --signal t_din,t_qout : std_logic_vector(31 downto 0);
begin
  test_comp : adder_32bit
  port map(
    a => a,
    b => b,
    sum => sum
  );
  testbench : process
  begin
    
    a<="00000000000000000000000000000111";
    wait for 50ns;
    
    b<="00000000000000000000000000000011";
    wait for 100ns;
    --clk<='1';
    a<="00000000000000011111000000000000";
    wait for 50ns;
    b<="11100000000000000000000000000000";
    wait for 100ns;
    --clk<='0';
    wait;
end process;
  
end architecture structure;





