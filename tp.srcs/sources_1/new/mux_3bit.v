`timescale 1ns / 1ps
module mux_3bit(a,b,s,o);
    input [2:0]a,b;
    input s;
    output reg [2:0]o;
    always@ (*)
        begin
            case (s)
                0 : o = a;
                1 : o = b;
                default : o = a;
            endcase
        end
endmodule
