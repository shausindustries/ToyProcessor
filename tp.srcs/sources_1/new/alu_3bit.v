`timescale 1ns / 1ps
module alu_3bit(a,b,op,o,zf,wf);
input [2:0]a;
input [2:0]b;
input [1:0]op;
output reg zf,wf;
output reg [2:0]o;

always@ (*)
    case (op)
        0 : begin
                o = a + b;
                wf = 1'b1;
            end
        1 : o = a - b;
    endcase

always@ (*)
    if (o == 3'b000)
        zf = 1'b1;
    else
        zf = 1'b0;
endmodule
