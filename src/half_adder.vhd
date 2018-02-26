library IEEE;
use IEEE.std_logic_1164.all;
use WORK.eecs361.all;
use WORK.eecs361_gates.all;

entity half_adder is
  port (
		signal x,y : in std_logic;
		signal s,cout : out std_logic
  );
end entity half_adder; -- half_adder

architecture structure of half_adder is



begin

	EX : xor_gate port map(x => x, y => y, z => s);
	AND1: and_gate port map(x => x, y => y, z => cout);

end architecture structure; -- structure