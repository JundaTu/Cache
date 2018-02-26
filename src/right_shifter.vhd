library IEEE;
use IEEE.std_logic_1164.all;
use WORK.eecs361.all;
use WORK.eecs361_gates.all;

entity right_shifter is
  port (
		signal A : in std_logic_vector(31 downto 0);
		signal shamt : in std_logic_vector(4 downto 0);
		signal D : out std_logic_vector(31 downto 0)
  ) ;
end entity ; -- shifter

architecture structure of right_shifter is
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
	Ain_1 <= '0' & A(31 downto 1);
	stage1: mux_32 port map (sel=>shamt(0), src0=>A, src1=>Ain_1, z=>Aout_1);
	Ain_2 <= "00" & Aout_1(31 downto 2);
	stage2: mux_32 port map (sel=>shamt(1), src0=>Aout_1, src1=>Ain_2, z=>Aout_2);
	Ain_3 <= "0000" & Aout_2(31 downto 4);
	stage3: mux_32 port map (sel=>shamt(2), src0=>Aout_2, src1=>Ain_3, z=>Aout_3);
	Ain_4 <= "00000000" & Aout_3(31 downto 8);
	stage4: mux_32 port map (sel=>shamt(3), src0=>Aout_3, src1=>Ain_4, z=>Aout_4);
	Ain_5 <= "0000000000000000" & Aout_4(31 downto 16);
	stage5: mux_32 port map (sel=>shamt(4), src0=>Aout_4, src1=>Ain_5, z=>D);

end architecture ; -- structure