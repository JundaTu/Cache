library ieee;
library work;
use ieee.std_logic_1164.all;
use work.dff;
use work.and_gate_5;

entity and_gate_5_test is
  
end and_gate_5_test;

architecture structure of and_gate_5_test is
  signal z : std_logic;
  signal a0,a1,a2,a3,a4 : std_logic;
  component  and_gate_5 is
	 port (
    a0,a1,a2,a3,a4 : in std_logic;
    z : out std_logic
  );
  end component and_gate_5;
  --signal t_din,t_qout : std_logic_vector(31 downto 0);
begin
  test_comp : and_gate_5
  port map(
    a0 => a0,
    a1 => a1,
    a2 => a2,
    a3 => a3,
    a4 => a4,
    z => z
  );
  testbench : process
  begin
    a0<='0';
    a1<='0';
    a2<='0';
    a3<='0';
    a4<='0';
    wait for 50ns;
    a0<='1';
    a1<='0';
    a2<='0';
    a3<='0';
    a4<='0';
    wait for 50ns;
    a0<='1';
    a1<='1';
    a2<='0';
    a3<='0';
    a4<='0';
    wait for 50ns;
    a0<='1';
    a1<='1';
    a2<='1';
    a3<='0';
    a4<='0';
    wait for 50ns;
    a0<='1';
    a1<='1';
    a2<='1';
    a3<='1';
    a4<='0';
    wait for 50ns;
    a0<='1';
    a1<='1';
    a2<='1';
    a3<='1';
    a4<='1';
    wait;
end process;
  
end architecture structure;





