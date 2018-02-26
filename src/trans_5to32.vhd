library ieee;
use ieee.std_logic_1164.all;
use work.and_gate_5;
use work.not_gate;

entity trans_5to32 is
  port (
    a0,a1,a2,a3,a4 : in std_logic;
    z : out std_logic_vector(31 downto 0)
  );
end trans_5to32;

architecture dataflow of trans_5to32 is
  signal n : std_logic_vector(4 downto 0);
  signal m : std_logic_vector(31 downto 0);
  component and_gate_5 is
    port(
      a0,a1,a2,a3,a4   : in std_logic;
      z   : out std_logic
    );
  end component and_gate_5;
  component not_gate is
  port(
    x : in std_logic;
    z : out std_logic
  );
end component;
begin
  n0: not_gate port map(a0,n(0));
  n1: not_gate port map(a1,n(1));
  n2: not_gate port map(a2,n(2));
  n3: not_gate port map(a3,n(3));
  n4: not_gate port map(a4,n(4));
  
  u0: and_gate_5 port map(n(0), n(1),n(2),n(3),n(4),m(0));
  u1: and_gate_5 port map(a0,   n(1),n(2),n(3),n(4),m(1));
  u2: and_gate_5 port map(n(0), a1,  n(2),n(3),n(4),m(2));
  u3: and_gate_5 port map(a0,   a1,  n(2),n(3),n(4),m(3));
  u4: and_gate_5 port map(n(0), n(1),a2,  n(3),n(4),m(4));
  u5: and_gate_5 port map(a0,   n(1),a2,  n(3),n(4),m(5));
  u6: and_gate_5 port map(n(0), a1,  a2,  n(3),n(4),m(6));
  u7: and_gate_5 port map(a0,   a1,  a2,  n(3),n(4),m(7));
  u8: and_gate_5 port map(n(0), n(1),n(2),a3,  n(4),m(8));
  u9: and_gate_5 port map(a0,   n(1),n(2),a3,  n(4),m(9));
  u10: and_gate_5 port map(n(0),a1,  n(2),a3,  n(4),m(10));
  u11: and_gate_5 port map(a0,  a1,  n(2),a3,  n(4),m(11));
  u12: and_gate_5 port map(n(0),n(1),a2,  a3,  n(4),m(12));
  u13: and_gate_5 port map(a0,  n(1),a2,  a3,  n(4),m(13));
  u14: and_gate_5 port map(n(0),a1,  a2,  a3,  n(4),m(14));
  u15: and_gate_5 port map(a0,  a1,  a2,  a3,  n(4),m(15));
  u16: and_gate_5 port map(n(0),n(1),n(2),n(3),a4,  m(16));
  u17: and_gate_5 port map(a0,  n(1),n(2),n(3),a4,  m(17));
  u18: and_gate_5 port map(n(0),a1,  n(2),n(3),a4,  m(18));
  u19: and_gate_5 port map(a0,  a1,  n(2),n(3),a4,  m(19));
  u20: and_gate_5 port map(n(0),n(1),a2,  n(3),a4,  m(20));
  u21: and_gate_5 port map(a0,  n(1),a2,  n(3),a4,  m(21));
  u22: and_gate_5 port map(n(0),a1,  a2,  n(3),a4,  m(22));
  u23: and_gate_5 port map(a0,  a1,  a2,  n(3),a4,  m(23));
  u24: and_gate_5 port map(n(0),n(1),n(2),a3,  a4,  m(24));
  u25: and_gate_5 port map(a0,  n(1),n(2),a3,  a4,  m(25));
  u26: and_gate_5 port map(n(0),a1,  n(2),a3,  a4,  m(26));
  u27: and_gate_5 port map(a0,  a1,  n(2),a3,  a4,  m(27));
  u28: and_gate_5 port map(n(0),n(1),a2,  a3,  a4,  m(28));
  u29: and_gate_5 port map(a0,  n(1),a2,  a3,  a4,  m(29));
  u30: and_gate_5 port map(n(0),a1,  a2,  a3,  a4,  m(30));
  u31: and_gate_5 port map(a0,  a1,  a2,  a3,  a4,  m(31));
       z<=m;
  
end dataflow;


