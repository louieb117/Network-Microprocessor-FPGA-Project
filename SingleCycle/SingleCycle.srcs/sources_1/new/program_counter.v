`timescale 1ns / 1ps

module program_counter#(parameter DWL = 32)
    (
        input CLK,
        input [DWL-1:0] PCRefIn,
        output reg [DWL-1:0] PCRefOut
    );
    
    initial PCRefOut = 32'd0; 
    
    always @( posedge CLK ) begin
        PCRefOut <= PCRefIn;
    end
    
endmodule
