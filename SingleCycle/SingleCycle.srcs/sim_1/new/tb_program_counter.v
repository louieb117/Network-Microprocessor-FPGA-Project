`timescale 1ns / 1ps

module tb_program_counter;

    // control signals
    reg CLK;
    
    // input signal
    reg [31:0] PCRefIn; 
    
    // output signal
    wire [31:0] PCRefOut;
    
    // Clock generation
    initial CLK <= 0;
        always #10 CLK <= ~CLK;
        
    program_counter #(.DWL(32)) PC01
    (
        .CLK(CLK),
        .PCRefIn(PCRefIn),
        .PCRefOut(PCRefOut)
    );
                    
    // Test Bench
    initial begin 

        // load word
        @(posedge CLK) PCRefIn = 32'd0;

        @(posedge CLK) PCRefIn = 32'd1;
        @(posedge CLK) PCRefIn = 32'd2;
        @(posedge CLK) PCRefIn = 32'd3;
        @(posedge CLK) PCRefIn = 32'd4;
        
    end 



endmodule
