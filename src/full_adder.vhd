library IEEE;
use IEEE.std_logic_1164.all;
use WORK.eecs361.all;
use WORK.eecs361_gates.all;

entity full_adder is
  port (
		signal a,b : in std_logic;
		signal carryin : in std_logic;
		signal sum : out std_logic;
		signal carryout : out std_logic
  );
end entity full_adder; -- full_adder

architecture structure of full_adder is
	component half_adder is
		port (
			signal x,y : in std_logic;
			signal s,cout : out std_logic
  		);
	end component half_adder;

	signal s1 : std_logic;
	signal s2 : std_logic;
	signal s3 : std_logic;
begin
	
	HA1: half_adder port map(x => a, y => b, s => s1, cout => s3);
	HA2: half_adder port map(x => s1, y => carryin, s => sum, cout => s2);
	OR1: or_gate port map(x => s2, y => s3, z => carryout);
	

end architecture ; -- structure