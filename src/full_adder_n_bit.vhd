-- Lab 2
-- Mixed Language Adder
-- Author: Clayton Lawton
-- Date: February 3, 2023
-- ECE 524

-- Needed Libraries
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Input and output assignment
entity full_adder_n_bit is
    Generic (n : integer := 4);

    Port ( x : in STD_LOGIC_VECTOR (n - 1 downto 0);
           y : in STD_LOGIC_VECTOR (n - 1 downto 0);
           sum : out STD_LOGIC_VECTOR (n - 1 downto 0);
           carry_out : out STD_LOGIC);

    end full_adder_n_bit;

architecture Behavioral of full_adder_n_bit is

-- Instantiate Full Adder Component
component full_adder is
    Port(
        x : in STD_LOGIC;
        y : in STD_LOGIC;
        carry_in : STD_LOGIC;
        sum : out STD_LOGIC;
        carry_out : out STD_LOGIC);
end component full_adder;

-- Internal Signal to pass carry bits.
signal carry_next : STD_LOGIC_VECTOR (n downto 0);

begin

-- Initial carry gets a 0.
carry_next(0) <= '0';

-- Last carry will get set to the carry_out port.
carry_out <= carry_next(n);

-- Generate statement to instantiate the full adder component.
-- Component instantiated 4 times.
FA : for i in 0 to n - 1 generate
    FA_i : full_adder Port Map (
        x => x(i),
        y => y(i),
        carry_in => carry_next(i),
        sum => sum(i),
        carry_out => carry_next(i + 1));
    end generate;
    
end Behavioral;