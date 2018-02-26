library ieee;
use ieee.std_logic_1164.all;

entity control_tb is
end entity control_tb;

architecture behavioral of control_tb is

signal	instr_t  :    std_logic_vector(31 downto 0);
signal	RegDst_t :    std_logic;
signal	ALUSrc_t :    std_logic;
signal	MemtoReg_t :  std_logic;
signal	RegW_t :      std_logic;
signal	MemR_t :      std_logic;
signal	MemW_t :      std_logic;
signal	Branch_t :    std_logic;
signal	Bne_t  :    std_logic;
signal	Bgtz_t :    std_logic;
signal	aluctr_t:     std_logic_vector(3 downto 0);

component control_unit is
  port (
	instr  : in std_logic_vector(31 downto 0);
	RegDst : out std_logic;
	ALUSrc : out std_logic;
	MemtoReg : out std_logic;
	RegW : out std_logic;
	MemR : out std_logic;
	MemW : out std_logic;
	Branch : out std_logic;
	Bne    : out std_logic;
	Bgtz   : out std_logic;
	aluctr: out std_logic_vector(3 downto 0)
	);
end component control_unit;

begin
test : control_unit port map(instr_t, RegDst_t, ALUsrc_t, MemtoReg_t, RegW_t, MemR_t, MemW_t, Branch_t,Bne_t,Bgtz_t,aluctr_t);

stimulus : process

begin
	instr_t <= "00000000000000000000000000100000"; --add
	wait for 10ns; 

	instr_t <= "00100000000000000000000000000000"; --addi
	wait for 10ns; 

	instr_t <= "00000000000000000000000000100001"; --addu
	wait for 10ns;  

	instr_t <= "00000000000000000000000000100010"; --sub
	wait for 10ns;  

	instr_t <= "00000000000000000000000000100011"; --subu
	wait for 10ns;  

	instr_t <= "00000000000000000000000000100100"; --and
	wait for 10ns;  

	instr_t <= "00000000000000000000000000100101"; --or
	wait for 10ns; 

	instr_t <= "00000000000000000000000000000000"; --sll
	wait for 10ns;  

	instr_t <= "10001100000000000000000000000000"; --lw
	wait for 10ns;  

	instr_t <= "10101100000000000000000000000000"; --sw
	wait for 10ns;  

	instr_t <= "00010000000000000000000000000000"; --beq
	wait for 10ns;  

	instr_t <= "00010100000000000000000000000000"; --bne
	wait for 10ns;  

	instr_t <= "00011100000000000000000000000000"; --bgtz
	wait for 10ns;  

	instr_t <= "00000000000000000000000000101010"; --slt
	wait for 10ns;  

	instr_t <= "00000000000000000000000000101011"; --sltu
	wait for 10ns;  

end process stimulus;	
end architecture behavioral;




