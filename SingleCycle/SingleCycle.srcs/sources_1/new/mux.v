`timescale 1ns / 1ps

module mux #(parameter WL = 0)
    (
        input sel,   
        input [WL-1:0] a,
        input [WL-1:0] b,
        output [WL-1:0] out
    );
    
    assign out = sel ? a : b;
    
endmodule
