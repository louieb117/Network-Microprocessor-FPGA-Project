`timescale 1ns / 1ps

module tb_data_path;
    
    // word lengths 
    parameter DWL = 32;
        
    // control signals
    reg CLK; 
//    reg [DWL-1:0] PCRefIn;
    // Clock generation
    initial CLK <= 0;
        always #5 CLK <= ~CLK;
        
    data_path DP01
    (
        .CLK(CLK)
//        .PCRefIn(PCRefIn)
    );
                    
    // Test Bench
    initial begin 

        // load word
//        @(posedge CLK) PCRefIn = 32'd0;

        @(posedge CLK);
        @(posedge CLK);
        @(posedge CLK);
        @(posedge CLK);
    end 

endmodule
