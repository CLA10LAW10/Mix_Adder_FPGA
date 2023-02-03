-- Lab 2
-- Mixed Language Adder
-- Author: Clayton Lawton
-- Date: February 3, 2023
-- ECE 524

-- Needed Libraries
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Input and Output Assignment
entity simple_and is
    Port(
        a: in STD_LOGIC;
        b: in STD_LOGIC;
        c: out STD_LOGIC);
end simple_and;

architecture Behavioral of simple_and is

begin

-- Concurrent AND using a logical operator.
c <= a AND b;

end Behavioral;