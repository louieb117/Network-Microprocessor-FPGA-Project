`timescale 1ns / 1ps

module control_unit(
    input [5:0] Opcode,
    input [5:0] Funct,
    output RFWE,
    output RFDSel,
    output ALUInSel,
    output ALUSel,
    output Branch,
    output DMWE,
    output MtoRFSel
);
    reg [7:0] OUT;
    
    main_decoder MDC01(
        .Opcode(Opcode),
        .OUT(OUT)
    );
    
    alu_decoder ADC01(
        .Funct(Funct),
        .ALUOp(ALUOp),
        .ALUsel(ALUsel)
    ); 
    
    
    
    assign DMWE = OUT[4];
    assign MtoRFSel = OUT[3];
    assign ALUOp = OUT[2:0];
    
    
    
    
    
endmodule
