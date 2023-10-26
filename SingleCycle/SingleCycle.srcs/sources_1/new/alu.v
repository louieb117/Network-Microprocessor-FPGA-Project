`timescale 1ns / 1ps 

module alu #(
    parameter   IWL_A = 5,
    parameter   IWL_B = 32,
    parameter   SWL = 3,
    parameter   OWL = 32,
    parameter   ADD = 3'b010,
    parameter   SUB = 3'b110,
    parameter   AND = 3'b000,
    parameter   OR = 3'b001
)(     
    input signed [IWL_A-1:0] A,
    input signed [IWL_B-1:0] B,
    input [SWL-1:0] ALU_Sel,
    output reg [OWL-1:0] ALU_Out,
    output reg ALU_CARRY
);

    always @( * )begin
        case(ALU_Sel)
            ADD : ALU_Out = A + B;
            SUB : ALU_Out = A - B; 
            AND : ALU_Out = A & B; 
            OR : ALU_Out = A | B;
            default: ALU_Out = A + B;    
        endcase              
    end
    
endmodule 
