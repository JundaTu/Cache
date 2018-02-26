library ieee;
library work;
use ieee.std_logic_1164.all;
use work.or_gate;
use work.and_gate;
use work.xor_gate;
entity adder is
  port (
    a   : in  std_logic;
    b   : in  std_logic;
    cin : in  std_logic;
    cout: out std_logic;
    sum : out std_logic
  );
end adder;
architecture plus of adder is
  signal a1 : std_logic;
  signal a2 : std_logic;
  signal a3 : std_logic;
  signal a4 : std_logic;
  signal a5 : std_logic;
begin
  
  u0 : entity and_gate(dataflow)
    port map(a,cin,a1);
  u1 : entity and_gate(dataflow)
    port map(b,cin,a2);
  u2 : entity and_gate(dataflow)
    port map(a,b,a3);
  u3 : entity or_gate(dataflow)
    port map(a1,a2,a4);
  u4 : entity or_gate(dataflow)
    port map(a3,a4,cout);
  u5 : entity xor_gate(dataflow)
    port map(a,b,a5);
  u6 : entity xor_gate(dataflow)
    port map(a5,cin,sum);
end architecture plus;
