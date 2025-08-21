`timescale 1ns / 1ps
module pc(pci,pco,clk);
input [4:0]pci;
input clk;
output reg [4:0]pco;

always@ (posedge clk)
    begin
        pco <= pci;
    end
endmodule
