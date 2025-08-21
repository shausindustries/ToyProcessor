`timescale 1ns / 1ps
module mux_5bit(a,b,s,o);
    input [4:0]a,b;
    input s;
    output reg [4:0]o;
    
    always@ (*)
        begin
            case (s)
                0 : o = a;
                1 : o = b;
                default: o = a;
            endcase
        end
endmodule
