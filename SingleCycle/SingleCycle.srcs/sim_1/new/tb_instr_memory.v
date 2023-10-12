`timescale 1ns / 1ps

module tb_instr_memory;


    // Word Lengths 
    parameter AWL = 32;
    parameter DWL = 32;

    // Control Signals
    reg CLK;
    reg RST;
    
    // Input Signals
    reg [AWL-1:0] IMA;
    
    // Output Signals
    wire [DWL-1:0] IMRD;
    
    // Clock Generation
    initial CLK <= 0;
        always #10 CLK <= ~CLK;
    
    // Module Under Test
    instruction_memory IM01(
        .RST(RST),
        .IMA(IMA),
        .IMRD(IMRD)
    );
   
    // Test Bench
    initial begin 

        @(posedge CLK) begin
            IMA = 32'd0;          
        end
        @(posedge CLK);
        @(posedge CLK) begin
            IMA = 32'd1;          
        end
        @(posedge CLK);
        @(posedge CLK) begin
            IMA = 32'd2;          
        end
        @(posedge CLK);
        @(posedge CLK) begin
            IMA = 32'd3;          
        end
        @(posedge CLK);   
        @(posedge CLK) begin
            IMA = 32'd4;          
        end     
        @(posedge CLK);
    end    
    
endmodule
