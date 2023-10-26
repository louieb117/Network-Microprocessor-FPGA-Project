`timescale 1ns / 1ps

module control_unit
(
    input [5:0] Opcode,
    input [5:0] Funct,
    output RFWE,
    output RFDSel,
    output ALUInSel,
    output Branch,
    output DMWE,
    output [1:0] MtoRFSel,
    output [2:0] ALUSel

);
    wire [7:0] OUT;
    wire [1:0] ALUOp;
    
    assign RFWE = OUT[7];
    assign RFDSel = OUT[6];
    assign ALUInSel = OUT[5];
    assign Branch = OUT[4];
    assign DMWE = OUT[3];
    assign MtoRFSel = OUT[2];
    assign ALUOp = OUT[1:0];
    
    main_decoder MDC01
    (
        .Opcode(Opcode),
        .OUT(OUT)
    );
    
    alu_decoder ADC01
    (
        .Funct(Funct),
        .ALUOp(ALUOp),
        .ALUSel(ALUSel)
    );
    
endmodule
