library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity IF_tb is
end entity IF_tb;

architecture behavioral of IF_tb is

  component IF_unit is
    port (
      clk : in std_logic;
      rst : in std_logic;
      B_eq : in std_logic;
      B_ne : in std_logic;
      B_gtz : in std_logic;
      Rs_sign : in std_logic;
      Zero : in std_logic;
      Immd : in std_logic_vector(31 downto 0);
      Instruction : out std_logic_vector(31 downto 0)
    );
  end component IF_unit;

  signal clk : std_logic := '1';
  signal Instruction : std_logic_vector(31 downto 0);
  signal reset : std_logic := '1';

begin
  test_comp : IF_unit port map (clk, reset, '0', '0', '0', '0', '0', x"00000011", Instruction);

  process
  begin
    wait for 5 ns;
    clk <= not clk;
    wait for 1 ns;
    reset <= not reset;
    wait for 4 ns;
    clk <= not clk;
    wait for 5 ns;
    clk <= not clk;
    wait for 5 ns;
    clk <= not clk;
    wait for 5 ns;
    clk <= not clk;
    wait for 5 ns;
    clk <= not clk;
    wait for 5 ns;
    clk <= not clk;
    wait for 5 ns;
    clk <= not clk;
    wait;
    
  end process ; -- testbench


end architecture behavioral;