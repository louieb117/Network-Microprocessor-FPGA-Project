`timescale 1ns / 1ps

module alu_decoder
(
    input [5:0] Funct,
    input [1:0] ALUOp,
    output reg [2:0] ALUsel
);
    always @(Funct or ALUOp) begin
        case(ALUOp)
            2'b00: ALUsel = 3'b010;    // Add
            2'b01: ALUsel = 3'b110;    // Subtract
            2'b1x: begin
                if(Funct == 6'b100000) ALUsel = 010;   // Add
                if(Funct == 6'b100010) ALUsel = 110;   // Subtract
                if(Funct == 6'b100100) ALUsel = 000;   // And
                if(Funct == 6'b100101) ALUsel = 001;   // OR
                if(Funct == 6'b101010) ALUsel = 111;   // SLT
            end     
        endcase
    end
endmodule
