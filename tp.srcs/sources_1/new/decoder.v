`timescale 1ns / 1ps
module decoder(op,br,bre,aluop,sel,we,en);
input [2:0]op;
output reg br,bre,sel,we,en;
output reg [1:0]aluop;

always@ (*)
    case (op)
        0 : begin
                we = 1'b1;
                sel = 1'b0;
            end
        
        1 : begin
                aluop = 1'b00;
                we = 1'b0;
                sel = 1'b1;
            end
        
        2 : begin
                aluop = 1'b01;
                we = 1'b0;
            end
        
        3 : bre = 1'b1;
        4 : br = 1'b0;
        5 : en = 1'b0;
            
    endcase
endmodule
