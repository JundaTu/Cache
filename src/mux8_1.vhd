library IEEE;
use IEEE.std_logic_1164.all;
use WORK.eecs361.all;
use WORK.eecs361_gates.all;

entity mux8_1 is
  port (
		signal a0,a1,a2,a3,a4,a5,a6,a7 : in std_logic;
		signal s : in std_logic_vector (2 downto 0);
		signal sout : out std_logic
  );
end entity ; -- mux8_1

architecture structure of mux8_1 is
	component mux4_1 is
	port (
		signal x0,x1,x2,x3 : in std_logic;
		signal s : in std_logic_vector (1 downto 0);
		signal z : out std_logic
  	);
  end component mux4_1;

	signal w0, w1: std_logic;
begin
	mux1: mux4_1 port map(s=>s(1 downto 0), x0=>a0, x1=>a1, x2=>a2, x3=>a3, z=>w0);
	mux2: mux4_1 port map(s=>s(1 downto 0), x0=>a4, x1=>a5, x2=>a6, x3=>a7, z=>w1);
	mux3: mux port map(sel=>s(2), src0=>w0, src1=>w1, z=>sout);
end architecture ; -- structure