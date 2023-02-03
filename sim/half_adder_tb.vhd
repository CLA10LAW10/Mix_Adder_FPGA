-- Lab 2
-- Mixed Language Adder
-- Author: Clayton Lawton
-- Date: February 3, 2023
-- ECE 524

-- Needed Libraries
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use std.env.stop;

-- No module ports needed for a testbench.
entity half_adder_tb is
-- Port ( );
end half_adder_tb;

architecture Behavioral of half_adder_tb is

-- Instantiate the component intended to be simulated 
component half_adder is
    Port(
        x : in STD_LOGIC;
        y : in STD_LOGIC;
        sum : out STD_LOGIC;
        carry : out STD_LOGIC
        );
end component half_adder;

-- Constants and signals the represent the instantiated components used.
signal x_tb : STD_LOGIC;
signal y_tb : STD_LOGIC;
signal sum_tb : STD_LOGIC;
signal carry_tb : STD_LOGIC;
signal clk_tb: std_logic;

begin

-- Map the component signals to the signals made within the testbench.
uut : half_adder port map (
    x => x_tb,
    y => y_tb,
    sum => sum_tb,
    carry => carry_tb);

-- Process made to toggle the clock every  5ns.
process 
begin
    clk_tb <= '1';
    wait for 5ns;
    clk_tb <= '0';
    wait for 5ns;
end process;

-- Simulation inputs.
process
    begin
        x_tb <= '0';
        y_tb <= '0';
        wait for 10ns;
        x_tb <= '0';
        y_tb <= '1';
        wait for 10ns;
        x_tb <= '1';
        y_tb <= '0';
        wait for 10ns;
        x_tb <= '1';
        y_tb <= '1';
        wait for 10ns;
        stop;
end process;

end Behavioral;