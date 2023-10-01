`timescale 1ns / 1ps

module program_counter#(parameter DWL = 32)
    (
        input CLK,
        input [DWL-1:0] PC_IN,
        output reg [DWL-1:0] PC_OUT
    );
    
    always @( posedge CLK ) begin
        PC_OUT <= PC_IN;
    end
    
endmodule
