library ieee;
use ieee.std_logic_1164.all;
use work.dff;
use work.not_gate;
use work.and_gate;
use work.trans_5to32;
use work.mux_32to1_32bit;
use work.reg_32bit;

entity reg_file is
  port (
	rd : in std_logic_vector(4 downto 0);
	wr : in std_logic;
	din: in std_logic_vector(31 downto 0);
	clk: in std_logic;
	rs_sel : in std_logic_vector(4 downto 0);
	rt_sel : in std_logic_vector(4 downto 0);
	rs_out : out std_logic_vector(31 downto 0);
	rt_out : out std_logic_vector(31 downto 0)
  );
end reg_file;

architecture structure of reg_file is
  signal t: std_logic_vector(31 downto 0);
  signal k1,k2: std_logic_vector(31 downto 0);
  signal n: std_logic_vector(31 downto 0);
  signal r0,r1,r2,r3,r4,r5,r6,r7: std_logic_vector(31 downto 0);
  signal r8,r9,r10,r11,r12,r13,r14,r15: std_logic_vector(31 downto 0);
  signal r16,r17,r18,r19,r20,r21,r22,r23: std_logic_vector(31 downto 0);
  signal r24,r25,r26,r27,r28,r29,r30,r31: std_logic_vector(31 downto 0);
  component reg_32bit is
    port (
	clk	: in  std_logic;
	d	: in  std_logic_vector(31 downto 0);
	q	: out std_logic_vector(31 downto 0)
  );
  end component reg_32bit;
  
  
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

  component  trans_5to32 is
	 port (
    a0,a1,a2,a3,a4 : in std_logic;
    z : out std_logic_vector(31 downto 0)
  );
  end component trans_5to32;
  
  component and_gate is
  port (
    x   : in  std_logic;
    y   : in  std_logic;
    z   : out std_logic
  );
end component and_gate;
  component not_gate is
    port (
    x   : in  std_logic;
    z   : out std_logic
  );
  end component not_gate;
  
begin
    a0: trans_5to32 port map(rd(0),rd(1),rd(2),rd(3),rd(4),t);
      
    trans_to_reg : for i in 0 to 31 generate begin
          and1:and_gate port map(wr,t(i),k1(i));
          and2:and_gate port map(k1(i),clk,n(i));
          --and3:and_gate port map(k1(i),k2(i),n(i));
    end generate;
    
    b0: reg_32bit port map(clk,x"00000000",r0);
    b1: reg_32bit port map(n(1),din,r1);
    b2: reg_32bit port map(n(2),din,r2);
    b3: reg_32bit port map(n(3),din,r3);
    b4: reg_32bit port map(n(4),din,r4);
    b5: reg_32bit port map(n(5),din,r5);
    b6: reg_32bit port map(n(6),din,r6);
    b7: reg_32bit port map(n(7),din,r7);
    b8: reg_32bit port map(n(8),din,r8);
    b9: reg_32bit port map(n(9),din,r9);
    b10: reg_32bit port map(n(10),din,r10);
    b11: reg_32bit port map(n(11),din,r11);
    b12: reg_32bit port map(n(12),din,r12);
    b13: reg_32bit port map(n(13),din,r13);
    b14: reg_32bit port map(n(14),din,r14);
    b15: reg_32bit port map(n(15),din,r15);
    b16: reg_32bit port map(n(16),din,r16);
    b17: reg_32bit port map(n(17),din,r17);
    b18: reg_32bit port map(n(18),din,r18);
    b19: reg_32bit port map(n(19),din,r19);
    b20: reg_32bit port map(n(20),din,r20);
    b21: reg_32bit port map(n(21),din,r21);
    b22: reg_32bit port map(n(22),din,r22);
    b23: reg_32bit port map(n(23),din,r23);
    b24: reg_32bit port map(n(24),din,r24);
    b25: reg_32bit port map(n(25),din,r25);
    b26: reg_32bit port map(n(26),din,r26);
    b27: reg_32bit port map(n(27),din,r27);
    b28: reg_32bit port map(n(28),din,r28);
    b29: reg_32bit port map(n(29),din,r29);
    b30: reg_32bit port map(n(30),din,r30);
    b31: reg_32bit port map(n(31),din,r31);
      
    m0_rs_out: mux_32to1_32bit 
      port map(rs_sel,r0,r1,r2,r3,r4,r5,r6,r7,
                      r8,r9,r10,r11,r12,r13,r14,r15,
                      r16,r17,r18,r19,r20,r21,r22,r23,
                      r24,r25,r26,r27,r28,r29,r30,r31,rs_out);
    m1_rt_out: mux_32to1_32bit 
      port map(rt_sel,r0,r1,r2,r3,r4,r5,r6,r7,
                      r8,r9,r10,r11,r12,r13,r14,r15,
                      r16,r17,r18,r19,r20,r21,r22,r23,
                      r24,r25,r26,r27,r28,r29,r30,r31,rt_out);
    
    
    
  
end structure;





