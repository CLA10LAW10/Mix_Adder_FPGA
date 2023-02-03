// Lab 2
// Mixed Language Adder
// Author: Clayton Lawton
// Date: February 3, 2023
// ECE 524
`timescale 1ns / 1ps

// Input and output assignment.
module top_module(
   input wire [1:0] x,
   input wire [1:0] y,
   input wire clk,
   input wire rst,
   output wire [2:0] s
   );

// Input / Output Types
reg [1:0] x_i;
reg [1:0] y_i;
wire [1:0] s_i;
wire c_i;
reg [2:0] s_reg;

// Instantiate Full Adder N Bit
full_adder_n_bit #(2)
   FA_N_BIT (
   .x(x_i),
   .y(y_i),
   .sum(s_i),
   .carry_out(c_i));

// Asynchronous Reset, otherwise pass bits into register.
always @(posedge clk or posedge rst) begin
   if (rst == 1'b1) begin
       x_i <= 2'b0;
       y_i <= 2'b0;
       s_reg <= 3'b0;
   end
   else begin
       x_i <= x;
       y_i <= y;
       s_reg <= {c_i, s_i};
   end
end

// Assign Sum register output to the module Sum output.
assign s = s_reg;

endmodule
