library ieee;
use ieee.std_logic_1164.all;

entity and_6in is
  port (
	x1 : in std_logic;
	x2 : in std_logic;
	x3 : in std_logic;
	x4 : in std_logic;
	x5 : in std_logic;
	x6 : in std_logic;
	z  : out std_logic
  	);
end and_6in;

architecture structure of and_6in is

component and_gate is 
         port(
              x,y : in  std_logic;
              z   : out std_logic
              );
end component and_gate;

signal t1,t2,t3,t4,t5 : std_logic;

begin
A1: and_gate port map(x1,x2,t1);
A2: and_gate port map(x3,x4,t2);
A3: and_gate port map(x5,x6,t3);
A4: and_gate port map(t1,t2,t4);
A5: and_gate port map(t4,t3,z);

end architecture structure;
