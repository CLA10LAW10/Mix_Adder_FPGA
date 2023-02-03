library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity full_adder_n_bit is
    Generic (n : integer := 4);

    Port ( x : in STD_LOGIC_VECTOR (n - 1 downto 0);
           y : in STD_LOGIC_VECTOR (n - 1 downto 0);
           sum : out STD_LOGIC_VECTOR (n - 1 downto 0);
           carry_out : out STD_LOGIC);

    end full_adder_n_bit;

architecture Behavioral of full_adder_n_bit is

component full_adder is
    Port(
        x : in STD_LOGIC;
        y : in STD_LOGIC;
        carry_in : STD_LOGIC;
        sum : out STD_LOGIC;
        carry_out : out STD_LOGIC);
end component full_adder;

signal carry_next : STD_LOGIC_VECTOR (n downto 0);

begin

carry_next(0) <= '0';
carry_out <= carry_next(n);

FA : for i in 0 to n - 1 generate
    FA_i : full_adder Port Map (
        x => x(i),
        y => y(i),
        carry_in => carry_next(i),
        sum => sum(i),
        carry_out => carry_next(i + 1));
    end generate;
end Behavioral;