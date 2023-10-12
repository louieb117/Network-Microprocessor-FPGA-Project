`timescale 1ns / 1ps

module tb_data_memory;

    // Word Lengths 
    parameter AWL = 32;
    parameter DWL = 32;
    
        
    // Control Signals
    reg CLK; 
    reg DMWE;
    
    // Input Signals
    reg [AWL-1:0] DMA;
    reg [DWL-1:0] DMWD;
    
    // Output Signals
    wire [DWL-1:0] DMRD;
    
    // Clock Generation
    initial CLK <= 0;
        always #10 CLK <= ~CLK;
    
    // Module Under Test
    data_memory DM01(
        .CLK(CLK), 
        .DMWE(DMWE), 
        .DMA(DMA),
        .DMWD(DMWD),
        .DMRD(DMRD)
    );
    
    // Test Bench
    initial begin 

        // load word
        @(posedge CLK) begin
            DMA = 32'd4;          
            DMWD = 16'd64;          
            DMWE = 1;
        end
        @(posedge CLK);
                
        // load word
        @(posedge CLK) begin
            DMA = 32'd8;          
            DMWD = 16'd256;          
            DMWE = 1;
        end
        @(posedge CLK);
        
        // store word
        @(posedge CLK) begin
            DMA = 32'd4;          
            DMWD = 16'd00;          
            DMWE = 0;
        end
        
        // store word
        @(posedge CLK) begin
            DMA = 32'd8;          
            DMWD = 16'd00;          
            DMWE = 0;
        end
        
        @(posedge CLK);
    end    
endmodule