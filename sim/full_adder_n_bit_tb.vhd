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
entity full_adder_n_bit_tb is
-- Port ( );
end full_adder_n_bit_tb;

architecture Behavioral of full_adder_n_bit_tb is

-- Instantiate the component intended to be simulated 
-- Commented out all carry_in_tb signals as the full_adder_n_bit
-- does not have any capable input port.
component full_adder_n_bit is
    Generic (n : integer := 4);

    Port ( x : in STD_LOGIC_VECTOR (n - 1 downto 0);
           y : in STD_LOGIC_VECTOR (n - 1 downto 0);
           -- carry_in : STD_LOGIC;
           sum : out STD_LOGIC_VECTOR (n - 1 downto 0);
           carry_out : out STD_LOGIC);

end component full_adder_n_bit;

-- Constants and signals the represent the instantiated components used.
constant n : integer := 4;
constant CP : time := 10ns;

signal x_tb : STD_LOGIC_VECTOR (n-1 downto 0);
signal y_tb : STD_LOGIC_VECTOR (n-1 downto 0);
-- signal carry_in_tb : STD_LOGIC;
signal sum_tb : STD_LOGIC_VECTOR (n-1 downto 0);
signal carry_out_tb : STD_LOGIC;
signal clk_tb: std_logic;

begin

-- Map the component signals to the signals made within the testbench.
uut_nbit_adder : full_adder_n_bit
    generic map (n => n)
    port map (
        x => x_tb,
        y => y_tb,
        -- carry_in => carry_in_tb,
        sum => sum_tb,
        carry_out => carry_out_tb);

-- Process made to toggle the clock every  5ns.
process 
begin
    clk_tb <= '1';
    wait for CP/2;
    clk_tb <= '0';
    wait for CP/2;
end process;

-- Simulation inputs.
process 
begin
    wait for CP;
    x_tb <= "0001";
    y_tb <= "0001";
    -- carry_in_tb <= '0';
    wait for CP;
    x_tb <= "0010";
    y_tb <= "0001";
    -- carry_in_tb <= '0';
    wait for CP;
    x_tb <= "0010";
    y_tb <= "0010";
    -- carry_in_tb <= '0';
    wait for CP;
    x_tb <= "0011";
    y_tb <= "0011";
    -- carry_in_tb <= '0';
    wait for CP;
    x_tb <= "1011";
    y_tb <= "1011";
    -- carry_in_tb <= '0';
    wait for CP;
    x_tb <= "1111";
    y_tb <= "1111";
    -- carry_in_tb <= '1';
    wait for CP;
    stop;
end process;

end Behavioral;
