library ieee;
library work;
use ieee.std_logic_1164.all;
use work.dff;
use work.reg_32bit;

entity reg_32bit_test is
  
end reg_32bit_test;

architecture structure of reg_32bit_test is
  signal din,qout : std_logic_vector(31 downto 0);
  signal clk : std_logic;
  component  reg_32bit is
  port (
	 clk	: in  std_logic;
	 d	: in  std_logic_vector(31 downto 0);
	 q	: out std_logic_vector(31 downto 0)
  );
  end component reg_32bit;
  --signal t_din,t_qout : std_logic_vector(31 downto 0);
begin
  test_comp : reg_32bit
  port map(
    clk => clk,
    d => din,
    q => qout
  );
  testbench : process
  begin
    clk<='1';
    din<="00000000000000000000000000000000";
    wait for 50ns;
    clk<='0';
    wait for 50ns;
    din<="00000000000000000000000000000011";
    wait for 100ns;
    clk<='1';
    din<="00000000000000011111000000000000";
    wait for 50ns;
    din<="11100000000000000000000000000000";
    wait for 100ns;
    clk<='0';
    wait;
end process;
  
end architecture structure;



