`timescale 1ns / 1ps

module alu_decoder
(
    input [5:0] Funct,
    input [1:0] ALUOp,
    output reg [2:0] ALUSel
);
    always @(ALUOp || Funct) begin
        case(ALUOp)
            2'b00: ALUSel = 3'b010;    // Add
            2'b01: ALUSel = 3'b110;    // Subtract
            2'b10: begin
                ALUSel = (Funct == 6'b100000) ? 3'b010 :    // Add
                        (Funct == 6'b100010) ? 3'b110 :   // Subtract
                        (Funct == 6'b100100) ? 3'b000 :   // And
                        (Funct == 6'b100101) ? 3'b001 :   // OR
                        (Funct == 6'b101010) ? 3'b111 : 3'bxxx;    // SLT
            end
            2'b11: begin
                ALUSel = (Funct == 6'b100000) ? 3'b010 :    // Add
                        (Funct == 6'b100010) ? 3'b110 :   // Subtract
                        (Funct == 6'b100100) ? 3'b000 :   // And
                        (Funct == 6'b100101) ? 3'b001 :   // OR
                        (Funct == 6'b101010) ? 3'b111 : 3'bxxx;    // SLT
            end     
        endcase
    end
endmodule
