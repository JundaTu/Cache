library ieee;
use ieee.std_logic_1164.all;

entity alucon_tb is

end alucon_tb;

architecture behavioral of alucon_tb is

component alu_control is
  port (
	func : in std_logic_vector(5 downto 0);
	alu_op : in std_logic_vector(1 downto 0);
	aluctr : out std_logic_vector(3 downto 0)
  	);
end component alu_control;

signal func_t : std_logic_vector(5 downto 0);
signal alu_op_t : std_logic_vector(1 downto 0);
signal aluctr_t : std_logic_vector(3 downto 0);

begin
test : alu_control port map(func_t,alu_op_t,aluctr_t);

stimulus : process
begin

	func_t <= "000000";
	alu_op_t <= "00";
	wait for 10ns; 

	func_t <= "000000";
	alu_op_t <= "01";
	wait for 10ns; 

	func_t <= "100000";
	alu_op_t <= "10";
	wait for 10ns; 

	func_t <= "100001";
	alu_op_t <= "10";
	wait for 10ns; 

	func_t <= "100010";
	alu_op_t <= "10";
	wait for 10ns;

	func_t <= "100011";
	alu_op_t <= "10";
	wait for 10ns; 

	func_t <= "100100";
	alu_op_t <= "10";
	wait for 10ns; 

	func_t <= "100101";
	alu_op_t <= "10";
	wait for 10ns; 

	func_t <= "000000";
	alu_op_t <= "10";
	wait for 10ns; 

	func_t <= "101010";
	alu_op_t <= "10";
	wait for 10ns; 

	func_t <= "101011";
	alu_op_t <= "10";
	wait for 10ns; 

end process stimulus;	
end architecture behavioral;


 