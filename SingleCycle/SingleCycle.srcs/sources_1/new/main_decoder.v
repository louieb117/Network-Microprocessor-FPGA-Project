`timescale 1ns / 1ps

module main_decoder
(
    input [5:0] Opcode,
    output reg [7:0] OUT
//    output RFWE,
//    output RFDSel,
//    output ALUInSel,
//    output Branch,
//    output DMWE,
//    output MtoRFSel
);
    always @(Opcode) begin
        case(Opcode)
            6'b000000: OUT = 8'b11000010; 
            6'b100011: OUT = 8'b10100100;
            6'b101011: OUT = 8'b00101000;
            6'b000100: OUT = 8'b00010001;
        endcase
    end
endmodule
