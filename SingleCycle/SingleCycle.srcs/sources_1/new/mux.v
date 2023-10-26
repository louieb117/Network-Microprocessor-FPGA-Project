`timescale 1ns / 1ps

module mux 
#(
    parameter WL_a = 5,
    parameter WL_b = 32 
)(
    input sel,   
    input [WL_a-1:0] a,
    input [WL_b-1:0] b,
    output [WL_b-1:0] out
);
    
    assign out = sel ? b : a;
    
endmodule
