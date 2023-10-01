`timescale 1ns / 1ps 

module alu #(parameter IWL = 32,
                       SWL = 3,
                       OWL = 32,
                       ADD = 3'b000,
                       SUB = 3'b001,
                       MUL = 3'b010,
                       DIV = 3'b011)
    
    ( A, B, ALU_Sel, ALU_Out, ALU_CARRY); 
    
    input signed [IWL-1:0] A;
    input signed [IWL-1:0] B;               
    input [SWL-1:0] ALU_Sel;
    output signed [OWL-1:0] ALU_Out;
    output reg ALU_CARRY;

    reg [OWL-1:0] ALU_Out;

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
