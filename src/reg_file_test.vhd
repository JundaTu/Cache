library ieee;
library work;
use ieee.std_logic_1164.all;
use work.dff;
use work.reg_file;

entity reg_file_test is
  
end reg_file_test;

architecture structure of reg_file_test is
  signal clk : std_logic;
  signal rd :  std_logic_vector(4 downto 0);
	signal wr :  std_logic;
	signal din:  std_logic_vector(31 downto 0);
	signal rs_sel :  std_logic_vector(4 downto 0);
	signal rt_sel :  std_logic_vector(4 downto 0);
	signal rs_out :  std_logic_vector(31 downto 0);
	signal rt_out :  std_logic_vector(31 downto 0);
  component  reg_file is
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
  end component reg_file;
  --signal t_din,t_qout : std_logic_vector(31 downto 0);
begin
  test_comp : reg_file
  port map(
    rd => rd, wr=>wr, din=>din, clk=>clk, rs_sel=>rs_sel, rt_sel=>rt_sel, rs_out=>rs_out,rt_out=>rt_out
  );
  testbench : process
  begin
    clk<='1';
    wr<='0';
    rd<="00000";
    din<="11111111000000000000000011111111";
    wait for 50ns;
    wr<='1';
    wait for 50ns;
    rd<="00001";
    wait for 50ns;
    clk<='0';
    wait for 50ns;
    din<="11111111111111111111111111111111";
    clk<='1';
    wait for 50ns;
    clk<='0';
    rt_sel<="00000";
    rs_sel<="00001";
    wait;
end process;
  
end architecture structure;









