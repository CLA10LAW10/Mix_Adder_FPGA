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
entity top_module_tb is
--  Port ( );
end top_module_tb;

architecture Behavioral of top_module_tb is

-- Constants and signals the represent the instantiated components used.
constant n : integer := 2;

signal x_tb:std_logic_vector(n-1 downto 0);
signal y_tb:std_logic_vector(n-1 downto 0);
signal clk_tb:std_logic;
signal rst_tb:std_logic;
signal s_tb:std_logic_vector(n downto 0);

constant CP : time := 10ns;

-- Instantiate the top module component
component top_module
   Port ( x : in STD_LOGIC_VECTOR (n-1 downto 0);
          y : in STD_LOGIC_VECTOR (n-1 downto 0);
          clk : in STD_LOGIC;
          rst : in STD_LOGIC;
          s : out STD_LOGIC_VECTOR (n downto 0));
end component top_module;

begin

-- Map the component signals to the signals made within the testbench.
top_module_i: top_module
port map(
   x => x_tb,
   y => y_tb,
   clk => clk_tb,
   rst => rst_tb,
   s => s_tb
);

-- Process made to toggle the clock every CP/2.
process
begin
   clk_tb <= '1';
   wait for CP/2;
   clk_tb <= '0';
   wait for CP/2;
end process;

-- Set and Reset the reset pin value.
process
begin
   wait for CP;
   rst_tb <= '1';
   wait for CP;
   rst_tb <= '0';
   wait;
end process;

-- Simulation inputs.
process
begin
   wait for 4*CP;
   x_tb <= "01";
   y_tb <= "01";
   wait for CP;
   x_tb <= "10";
   y_tb <= "01";
   wait for CP;
   x_tb <= "10";
   y_tb <= "10";
   wait for CP;
   x_tb <= "11";
   y_tb <= "11";
   wait for CP;
   x_tb <= "10";
   y_tb <= "10";
   wait for CP;
   x_tb <= "00";
   y_tb <= "11";
   wait for 2*CP;
   stop;
end process;

end Behavioral;