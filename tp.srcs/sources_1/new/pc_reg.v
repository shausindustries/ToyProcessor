`timescale 1ns / 1ps
module pc_reg(in,o,en);
input [4:0]in;
input en;
output reg [4:0]o;

always@ (*)
    if(en == 1'b1)
        o <= in;
endmodule
