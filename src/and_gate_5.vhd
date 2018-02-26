library ieee;
use ieee.std_logic_1164.all;
use work.and_gate;

entity and_gate_5 is
  port (
    a0,a1,a2,a3,a4 : in std_logic;
    z : out std_logic
  );
end and_gate_5;

architecture dataflow of and_gate_5 is
  signal s0,s1,s2,s3,s4 : std_logic;
  component and_gate is
    port(
      x   : in std_logic;
      y   : in std_logic;
      z   : out std_logic
    );
  end component and_gate;
begin
  u0: and_gate port map(x=>a0,y=>a1,z=>s0);
  u1: and_gate port map(x=>a2,y=>a3,z=>s1);
  u2: and_gate port map(x=>a4,y=>'1',z=>s2);
  u3: and_gate port map(x=>s0,y=>s1,z=>s3);
  u4: and_gate port map(x=>s2,y=>s3,z=>s4);
  u5: z<=s4;
end dataflow;

