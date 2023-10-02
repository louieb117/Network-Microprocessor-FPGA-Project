`timescale 1ns / 1ps

module tb_alu;

    // Control Signals
    reg CLK;
    // Word Lengths 
    parameter IWL = 32;
    parameter SWL = 3;
    parameter OWL = 32;
    
    // Input Signals
    reg [IWL-1:0] A;
    reg [IWL-1:0] B;
    
    // Select Signals
    reg [SWL-1:0] SEL;
    
    // Output Signals
    wire [OWL-1:0] OUT;
    wire CARRY;
    
    // Clock Generation
    initial CLK <= 0;
        always #10 CLK <= ~CLK;
    
    // Module Under Test
    alu ALU01(
        .A(A), 
        .B(B), 
        .ALU_Sel(SEL),
        .ALU_Out(OUT),
        .ALU_CARRY(CARRY)
    );
    
    // Test Bench
    initial begin 

        // ADD
        @(posedge CLK) begin
            A = 32'd4;          
            B = 32'd6;          
            SEL = 3'b000;
        end
                
        // SUB
        @(posedge CLK) begin
            A = 32'd16;          
            B = 32'd6;          
            SEL = 3'b001;
        end
        
        // MUL
        @(posedge CLK) begin
            A = 32'd4;          
            B = 32'd6;          
            SEL = 3'b010;
        end
        
        // DIV
        @(posedge CLK) begin
            A = 32'd4;          
            B = 32'd2;          
            SEL = 3'b011;
        end
        
    end    
endmodule