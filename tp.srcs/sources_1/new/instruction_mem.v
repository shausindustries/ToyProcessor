`timescale 1ns / 1ps
module instruction_mem(a,rd);
input [4:0]a;
output [7:0]rd;

reg [7:0] mem [31:0];
assign rd = mem[a];
endmodule
