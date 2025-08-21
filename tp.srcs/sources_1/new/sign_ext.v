`timescale 1ns / 1ps
module sign_ext(in,out);
input [4:0]in;
output signed [4:0]out;
assign out = in;
endmodule