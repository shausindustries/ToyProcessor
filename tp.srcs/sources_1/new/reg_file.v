`timescale 1ns / 1ps
module reg_file(a1,a2,wd,rd1,rd2,clk,we);
input [1:0]a1,a2;
input [2:0]wd;
input clk,we;
output reg [2:0]rd1;
output reg[2:0]rd2;

reg [2:0] mem [0:3];

always@ (posedge clk)
    begin
        if (we == 1'b1)
            mem[a1] <= wd;
        
        rd1 <= mem[a1];
        rd2 <= mem[a2];
    end
endmodule
