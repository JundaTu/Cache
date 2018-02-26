library IEEE;
use IEEE.std_logic_1164.all;
use WORK.eecs361.all;
use WORK.eecs361_gates.all;

entity left_shifter is
  port (
		A : in std_logic_vector(31 downto 0);
		shamt : in std_logic_vector(4 downto 0);
		D : out std_logic_vector(31 downto 0)
  );
end entity; -- shifter

architecture structure of left_shifter is
	signal Ain_1 : std_logic_vector(31 downto 0);
	signal Aout_1 : std_logic_vector(31 downto 0);
	signal Ain_2 : std_logic_vector(31 downto 0);
	signal Aout_2 : std_logic_vector(31 downto 0);
	signal Ain_3 : std_logic_vector(31 downto 0);
	signal Aout_3 : std_logic_vector(31 downto 0);
	signal Ain_4 : std_logic_vector(31 downto 0);
	signal Aout_4 : std_logic_vector(31 downto 0);
	signal Ain_5 : std_logic_vector(31 downto 0);
begin
	Ain_1 <= A(30 downto 0) & '0';
	stage1: mux_32 port map (sel=>shamt(0), src0=>A, src1=>Ain_1, z=>Aout_1);
	Ain_2 <= Aout_1(29 downto 0) & "00";
	stage2: mux_32 port map (sel=>shamt(1), src0=>Aout_1, src1=>Ain_2, z=>Aout_2);
	Ain_3 <= Aout_2(27 downto 0) & "0000";
	stage3: mux_32 port map (sel=>shamt(2), src0=>Aout_2, src1=>Ain_3, z=>Aout_3);
	Ain_4 <= Aout_3(23 downto 0) & "00000000";
	stage4: mux_32 port map (sel=>shamt(3), src0=>Aout_3, src1=>Ain_4, z=>Aout_4);
	Ain_5 <= Aout_4(15 downto 0) & "0000000000000000";
	stage5: mux_32 port map (sel=>shamt(4), src0=>Aout_4, src1=>Ain_5, z=>D);

end architecture ; -- structure