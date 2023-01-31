library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity half_adder_tb is
-- Port ( );
end half_adder_tb;

architecture Behavioral of half_adder_tb is

component half_adder is
    Port(
        x : in STD_LOGIC;
        y : in STD_LOGIC;
        sum : out STD_LOGIC;
        carry : out STD_LOGIC
        );
end component half_adder;

signal x_tb : STD_LOGIC;
signal y_tb : STD_LOGIC;
signal sum_tb : STD_LOGIC;
signal carry_tb : STD_LOGIC;
signal clk_tb: std_logic;

begin