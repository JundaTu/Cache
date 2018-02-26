
library ieee;
library work;
use ieee.std_logic_1164.all;
use work.dff;
use work.mux_32to1_32bit;

entity mux_32to1_32bit_test is
  
end mux_32to1_32bit_test;

architecture structure of mux_32to1_32bit_test is
  signal sel : std_logic_vector(4 downto 0);
  signal a0,a1,a2,a3,a4,a5,a6,a7,a8 : std_logic_vector(31 downto 0);
  signal a9,a10,a11,a12,a13,a14,a15 : std_logic_vector(31 downto 0);
  signal a16,a17,a18,a19,a20,a21,a22,a23 : std_logic_vector(31 downto 0);
  signal a24,a25,a26,a27,a28,a29,a30,a31 : std_logic_vector(31 downto 0);
  signal z : std_logic_vector(31 downto 0);
  component  mux_32to1_32bit is
  port (
	sel   : in  std_logic_vector(4 downto 0);
	src0  : in  std_logic_vector(31 downto 0);
	src1  : in  std_logic_vector(31 downto 0);
	src2  : in  std_logic_vector(31 downto 0);
	src3  : in  std_logic_vector(31 downto 0);
	src4  : in  std_logic_vector(31 downto 0);
	src5  : in  std_logic_vector(31 downto 0);
	src6  : in  std_logic_vector(31 downto 0);
	src7  : in  std_logic_vector(31 downto 0);
	src8  : in  std_logic_vector(31 downto 0);
	src9  : in  std_logic_vector(31 downto 0);
	src10  : in  std_logic_vector(31 downto 0);
	src11  : in  std_logic_vector(31 downto 0);
	src12  : in  std_logic_vector(31 downto 0);
	src13  : in  std_logic_vector(31 downto 0);
	src14  : in  std_logic_vector(31 downto 0);
	src15  : in  std_logic_vector(31 downto 0);
	src16  : in  std_logic_vector(31 downto 0);
	src17  : in  std_logic_vector(31 downto 0);
	src18  : in  std_logic_vector(31 downto 0);
	src19  : in  std_logic_vector(31 downto 0);
	src20  : in  std_logic_vector(31 downto 0);
	src21  : in  std_logic_vector(31 downto 0);
	src22  : in  std_logic_vector(31 downto 0);
	src23  : in  std_logic_vector(31 downto 0);
	src24  : in  std_logic_vector(31 downto 0);
	src25  : in  std_logic_vector(31 downto 0);
	src26  : in  std_logic_vector(31 downto 0);
	src27  : in  std_logic_vector(31 downto 0);
	src28  : in  std_logic_vector(31 downto 0);
	src29  : in  std_logic_vector(31 downto 0);
	src30  : in  std_logic_vector(31 downto 0);
	src31  : in  std_logic_vector(31 downto 0);
	z	    : out std_logic_vector(31 downto 0)
  );
  end component mux_32to1_32bit;
  --signal t_din,t_qout : std_logic_vector(31 downto 0);
begin
  test_comp : mux_32to1_32bit
  port map(
    sel => sel,
    src0 => a0,
    src1 => a1,
    src2 => a2,
    src3 => a3,
    src4 => a4,
    src5 => a5,
    src6 => a6,
    src7 => a7,
    src8 => a8,
    src9 => a9,
    src10 => a10,
    src11 => a11,
    src12 => a12,
    src13 => a13,
    src14 => a14,
    src15 => a15,
    src16 => a16,
    src17 => a17,
    src18 => a18,
    src19 => a19,
    src20 => a20,
    src21 => a21,
    src22 => a22,
    src23 => a23,
    src24 => a24,
    src25 => a25,
    src26 => a26,
    src27 => a27,
    src28 => a28,
    src29 => a29,
    src30 => a30,
    src31 => a31,
    z => z
  );
  testbench : process
  begin
    sel<="00000";
    a0<="00000000000000000000000110000000";
    a1<="00000000000000000000000001100000";
    a2<="00000000000000000000000001111000";
    a3<="00000000000000000000000000000111";
    wait for 50ns;
    sel<="00001";
    wait for 50ns;
    sel<="00010";
    wait for 50ns;
    sel<="00011";
    wait;
end process;
  
end architecture structure;








