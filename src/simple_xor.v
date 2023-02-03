// Lab 2
// Mixed Language Adder
// Author: Clayton Lawton
// Date: February 3, 2023
// ECE 524
`timescale 1ns / 1ps

// Input and output assignment.
module simple_xor(
    input wire a,
    input wire b,
    output wire c
    );

// Concurrent code for an XOR gate.
assign c = a ^ b;

endmodule