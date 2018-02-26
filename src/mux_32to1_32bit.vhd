library ieee;
use ieee.std_logic_1164.all;
use work.eecs361.mux_n;
use work.mux_32;

entity mux_32to1_32bit is
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
end mux_32to1_32bit;

architecture structural of mux_32to1_32bit is
  signal L1_0,L1_1,L1_2,L1_3,L1_4,L1_5,L1_6,L1_7 : std_logic_vector(31 downto 0);
  signal L1_8,L1_9,L1_10,L1_11,L1_12,L1_13,L1_14,L1_15 : std_logic_vector(31 downto 0);
  signal L2_0,L2_1,L2_2,L2_3,L2_4,L2_5,L2_6,L2_7:std_logic_vector(31 downto 0);
  signal L3_0,L3_1,L3_2,L3_3 :std_logic_vector(31 downto 0);
  signal L4_0,L4_1 :std_logic_vector(31 downto 0);
  signal L5_0 :std_logic_vector(31 downto 0);
  component mux_32 is
    port (
	  sel   : in  std_logic;
	  src0  : in  std_logic_vector(31 downto 0);
	  src1  : in  std_logic_vector(31 downto 0);
	  z	    : out std_logic_vector(31 downto 0)
  );
  end component;
begin
  u0: mux_32 port map(sel(0),src0,src1,L1_0);
  u1: mux_32 port map(sel(0),src2,src3,L1_1);
  u2: mux_32 port map(sel(0),src4,src5,L1_2);
  u3: mux_32 port map(sel(0),src6,src7,L1_3);
  u4: mux_32 port map(sel(0),src8,src9,L1_4);
  u5: mux_32 port map(sel(0),src10,src11,L1_5);
  u6: mux_32 port map(sel(0),src12,src13,L1_6);
  u7: mux_32 port map(sel(0),src14,src15,L1_7);
  u8: mux_32 port map(sel(0),src16,src17,L1_8);
  u9: mux_32 port map(sel(0),src18,src19,L1_9);
  u10: mux_32 port map(sel(0),src20,src21,L1_10);
  u11: mux_32 port map(sel(0),src22,src23,L1_11);
  u12: mux_32 port map(sel(0),src24,src25,L1_12);
  u13: mux_32 port map(sel(0),src26,src27,L1_13);
  u14: mux_32 port map(sel(0),src28,src29,L1_14);
  u15: mux_32 port map(sel(0),src30,src31,L1_15);
    
  v0:mux_32 port map(sel(1),L1_0,L1_1,L2_0);
  v1:mux_32 port map(sel(1),L1_2,L1_3,L2_1);
  v2:mux_32 port map(sel(1),L1_4,L1_5,L2_2);
  v3:mux_32 port map(sel(1),L1_6,L1_7,L2_3);
  v4:mux_32 port map(sel(1),L1_8,L1_9,L2_4);
  v5:mux_32 port map(sel(1),L1_10,L1_11,L2_5);
  v6:mux_32 port map(sel(1),L1_12,L1_13,L2_6);
  v7:mux_32 port map(sel(1),L1_14,L1_15,L2_7);
  
  w0:mux_32 port map(sel(2),L2_0,L2_1,L3_0);
  w1:mux_32 port map(sel(2),L2_2,L2_3,L3_1);  
  w2:mux_32 port map(sel(2),L2_4,L2_5,L3_2);
  w3:mux_32 port map(sel(2),L2_6,L2_6,L3_3);
    
  x0:mux_32 port map(sel(3),L3_0,L3_1,L4_0);
  x1:mux_32 port map(sel(3),L3_2,L3_3,L4_1);
    
  y0:mux_32 port map(sel(4),L4_0,L4_1,L5_0);
  z<=L5_0;
end structural;


