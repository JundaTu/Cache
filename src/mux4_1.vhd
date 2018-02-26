library IEEE;
use IEEE.std_logic_1164.all;
use WORK.eecs361.all;
use WORK.eecs361_gates.all;

entity mux4_1 is
  port (
		signal x0,x1,x2,x3 : in std_logic;
		signal s : in std_logic_vector (1 downto 0);
		signal z : out std_logic
  );
end entity ; -- mux4_1

architecture structure of mux4_1 is
	signal w0, w1: std_logic;
begin
	mux1: mux port map(sel=>s(0), src0=>x0, src1=>x1, z=>w0);
	mux2: mux port map(sel=>s(0), src0=>x2, src1=>x3, z=>w1);
	mux3: mux port map(sel=>s(1), src0=>w0, src1=>w1, z=>z);
end architecture ; -- structure