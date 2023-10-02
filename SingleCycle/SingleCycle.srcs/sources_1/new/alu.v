`timescale 1ns / 1ps 

module alu #(
    parameter   IWL = 32,
    parameter   SWL = 3,
    parameter   OWL = 32,
    parameter   ADD = 3'b000,
    parameter   SUB = 3'b001,
    parameter   MUL = 3'b010,
    parameter   DIV = 3'b011
)(     
    input signed [IWL-1:0] A,
    input signed [IWL-1:0] B,
    input [SWL-1:0] ALU_Sel,
    output reg [OWL-1:0] ALU_Out,
    output reg ALU_CARRY
);

    always @( * )begin
        case(ALU_Sel)
            ADD : ALU_Out = A + B;
            SUB : ALU_Out = A - B; 
            MUL : ALU_Out = A * B; 
            DIV : ALU_Out = A / B;
            default: ALU_Out = A + B;    
        endcase              
    end
endmodule 
