`timescale 1ns / 1ps
module adder_5bit(a,b,o);
input [4:0]a,b;
output reg [4:0]o;

always@ (*)
    o = a + b;
endmodule
