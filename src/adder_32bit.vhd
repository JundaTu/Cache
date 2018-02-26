library ieee;
use ieee.std_logic_1164.all;
use work.adder;

entity adder_32bit is
  port(
    a,b : in std_logic_vector(31 downto 0);
    --cin : in std_logic;
    --cout : out std_logic;
    sum : out std_logic_vector(31 downto 0)
  );
end adder_32bit;

architecture structure of adder_32bit is 
  signal cc : std_logic_vector(31 downto 0);
  signal co : std_logic;
  component adder is
    port(
    a   : in  std_logic;
    b   : in  std_logic;
    cin : in  std_logic;
    cout: out std_logic;
    sum : out std_logic
    );
  end component adder;
  
begin
  --u0: cin<='0';
  --u1: cc(0)<=cin;
  adder_1: for i in 0 to 31 generate begin
      lsb: if i=0 generate begin
      g1:  adder port map(a=>a(i), b=>b(i), cin=>'0', cout=>cc(i+1), sum=>sum(i));
           end generate;
      msb: if i=31 generate begin
      g2:   adder port map(a=>a(i), b=>b(i), cin=>cc(i), cout=>co, sum=>sum(i));
           end generate;
      mid: if i>0 AND i<31 generate begin
      g3:   adder port map(a=>a(i), b=>b(i), cin=>cc(i), cout=>cc(i+1), sum=>sum(i));
           end generate;
       end generate;
  
end structure;