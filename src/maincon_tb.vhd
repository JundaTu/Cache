library ieee;
use ieee.std_logic_1164.all;

entity maincon_tb is

end maincon_tb;

architecture behavioral of maincon_tb is
 
component main_control is
 port (
	op : in std_logic_vector(5 downto 0);
	alu_op : out std_logic_vector(1 downto 0);
	RegDst : out std_logic;
	ALUSrc : out std_logic;
	MemtoReg : out std_logic;
	RegW : out std_logic;
	MemR : out std_logic;
	MemW : out std_logic;
	Branch : out std_logic;
	Bne    : out std_logic;
	Bgtz   : out std_logic
	); 
end component main_control;

signal 	op_t :      std_logic_vector(5 downto 0);
signal	alu_op_t :  std_logic_vector(1 downto 0);
signal	RegDst_t :  std_logic;
signal	ALUSrc_t :  std_logic;
signal	MemtoReg_t :  std_logic;
signal	RegW_t :      std_logic;
signal	MemR_t :      std_logic;
signal	MemW_t :      std_logic;
signal	Branch_t :    std_logic;
signal	Bne_t  :    std_logic;
signal	Bgtz_t :    std_logic;

begin
test : main_control port map(op_t,alu_op_t,RegDst_t,ALUSrc_t,MemtoReg_t,RegW_t,MemR_t,MemW_t,Branch_t,Bne_t,Bgtz_t);

stimulus : process
begin

	op_t <= "000000";
	wait for 10ns;

	op_t <= "100011";
	wait for 10ns;

	op_t <= "101011";
	wait for 10ns;

	op_t <= "001000";
	wait for 10ns;

	op_t <= "000100";
	wait for 10ns;

	op_t <= "000101";
	wait for 10ns;

	op_t <= "000111";
	wait for 10ns;

end process stimulus;	
end architecture behavioral;



