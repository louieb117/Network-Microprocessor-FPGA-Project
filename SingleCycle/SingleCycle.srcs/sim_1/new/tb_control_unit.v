`timescale 1ns / 1ps

module tb_control_unit;

    // Control Signals
    reg CLK;
    
    // Input Signals
    reg [5:0] Opcode;
    reg [5:0] Funct;
    
    // Output Signals
    wire RFWE;
    wire RFDSel;
    wire ALUInSel;
    wire Branch;
    wire DMWE;
    wire MtoRFSel;
    
    wire [2:0] ALUSel;

    // Clock Generation
    initial CLK <= 0;
        always #10 CLK <= ~CLK;
    
    // Module Under Test
    control_unit CU01
    (
        .Opcode(Opcode),
        .Funct(Funct),
        .RFWE(RFWE),
        .RFDSel(RFDSel),
        .ALUInSel(ALUInSel),
        .Branch(Branch),
        .DMWE(DMWE),
        .MtoRFSel(MtoRFSel),
        .ALUSel(ALUSel)
    );
   
    // Test Bench
    initial begin 
        // lw
        @(posedge CLK) begin
            Opcode = 6'b100011;
            Funct = 6'b010101;          
        end
        
        // sw
        @(posedge CLK) begin
            Opcode = 6'b101011;
            Funct = 6'b010101;          
        end
        
        // R-type
        @(posedge CLK) begin
            Opcode = 6'b000000;
            Funct = 6'b100101;          
        end
        
        // beq
        @(posedge CLK) begin
            Opcode = 6'b000100;
            Funct = 6'b010101;          
        end
    end        
    
endmodule