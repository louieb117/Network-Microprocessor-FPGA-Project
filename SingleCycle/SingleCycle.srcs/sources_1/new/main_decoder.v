`timescale 1ns / 1ps

module main_decoder
(
    input [5:0] Opcode,
    output reg [7:0] OUT
);
    always @(Opcode) begin
        OUT = (Opcode == 6'b000000) ? 8'b11000010: 
                (Opcode == 6'b100011) ? 8'b10100100:
                (Opcode == 6'b101011) ? 8'b00101000:
                (Opcode == 6'b000100) ? 8'b00010001: 8'bxxxxxxxx;
    end
endmodule
