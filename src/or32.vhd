library IEEE;
use IEEE.std_logic_1164.all;
use WORK.eecs361.all;
use WORK.eecs361_gates.all;

entity or32 is
  port (
		x : in std_logic_vector(31 downto 0);
		z : out std_logic
  );
end entity ; -- or32

architecture structure of or32 is
	signal temp_out: std_logic_vector(30 downto 0);
begin
	
	or1: or_gate port map (x=>x(0), y=>x(1), z=>temp_out(0));
	or_gates : for i in 1 to 30 generate
		or2: or_gate port map (x=>temp_out(i-1), y=>x(i+1), z=>temp_out(i));
	end generate ; -- or_gates

	z <= temp_out(30);
end architecture ; -- structure