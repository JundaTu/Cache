library ieee ;
use ieee.std_logic_1164.all ;
use ieee.numeric_std.all ;

entity singal_cycle_tb is
end entity ; -- singal_cycle_tb

architecture behavioral of singal_cycle_tb is
  component singal_cycle is
    port (
      clk : in std_logic;
      reset : in std_logic;
      Overflow : out std_logic;
      Zero : out std_logic;
      Carryout : out std_logic
    );
  end component singal_cycle;

  signal clk : std_logic := '1';
  signal reset : std_logic := '1';
  signal Overflow : std_logic;
  signal Zero : std_logic;
  signal Carryout : std_logic;

begin

  test_comp: singal_cycle port map (clk => clk, 
    reset => reset, 
    Overflow => Overflow , 
    Zero => Zero,
    Carryout => Carryout
    );

  clk <= not clk after 5 ns;
  
  process
  begin
    wait for 6 ns;
    reset <= not reset;
    wait for 1000 ns;
    wait;
  end process ;

end architecture ; -- behavioral