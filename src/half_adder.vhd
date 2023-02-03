-- Lab 2
-- Mixed Language Adder
-- Author: Clayton Lawton
-- Date: February 3, 2023
-- ECE 524

-- Needed Libraries
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Input and output assignments
entity half_adder is
    Port(
        x : in STD_LOGIC;
        y : in STD_LOGIC;
        sum : out STD_LOGIC;
        carry : out STD_LOGIC
        );
end half_adder;

architecture Behavioral of half_adder is

-- A half adder requires an XOR as well as an AND gate.
-- These components will be instantiated fro it's "simple" module designed.

-- Instantiate the AND gate.
component simple_and is
    Port(
        a: in STD_LOGIC;
        b: in STD_LOGIC;
        c: out STD_LOGIC);
end component simple_and;

-- Instantiate the XOR gate.
component simple_xor is
    Port(
        a: in STD_LOGIC;
        b: in STD_LOGIC;
        c: out STD_LOGIC);
end component simple_xor;

begin

-- Assign the module ports to the component posts.
-- Output of XOR will be the SUM value.
-- Output of the AND will be the Carry out value.

xor_i : simple_xor port map (
    a => x,
    b => y,
    c => sum
);

and_i : simple_and port map (
    a => x,
    b => y,
    c => carry
);

end Behavioral;