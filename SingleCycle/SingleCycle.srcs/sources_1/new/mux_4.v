`timescale 1ns / 1ps

module mux_4 #(parameter WL = 32)
(
    input [1:0] sel,   
    input [WL-1:0] a,
    input [WL-1:0] b,
    input [WL-1:0] c,
    input [WL-1:0] d,
    output reg [WL-1:0] out 
);
    
    always @(*) begin
        case(sel)
            2'b00: out = a; 
            2'b01: out = b;
            2'b10: out = c;
            2'b11: out = d;
        endcase
    end
endmodule
