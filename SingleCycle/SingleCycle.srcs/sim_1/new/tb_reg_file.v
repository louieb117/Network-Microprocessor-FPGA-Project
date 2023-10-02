`timescale 1ns / 1ps

module tb_reg_file;

    // Word Lengths 
    parameter AWL = 5;
    parameter SWL = 3;
    parameter DWL = 16;
    
        
    // Control Signals
    reg CLK; 
    reg RFWE;
    
    // Input Signals
    reg [AWL-1:0] rt;
    reg [AWL-1:0] rs;
    reg [DWL-1:0] slmm;
    
    // Output Signals
    wire [DWL-1:0] RFRD1;
    wire [DWL-1:0] RFRD2;
    
    // Clock Generation
    initial CLK <= 0;
        always #10 CLK <= ~CLK;
    
    // Module Under Test
    register_file RF01(
        .CLK(CLK), 
        .RFWE(RFWE), 
        .RFRA1(rs),
        .RFRA2(rt),
        .RFWA(rt),
        .RFWD(slmm),
        .RFRD1(RFRD1),
        .RFRD2(RFRD2)
    );
    
    // Test Bench
    initial begin 

        // load word
        @(posedge CLK) begin
            rs = 5'd0;          // $0
            rt = 5'd8;          // $t0
            slmm = 16'd5;       // Data
            RFWE = 1;
        end
        @(posedge CLK);
                
         // load word
        @(posedge CLK) begin
            rs = 5'd0;          // $0
            rt = 5'd9;          // $t1
            slmm = 16'd10;       // Data
            RFWE = 1;
        end
        @(posedge CLK);
        
        // store word
        @(posedge CLK) begin
            rs = 5'd0;          // $0
            rt = 5'd8;          // $t0
            slmm = 16'd0;
            RFWE = 0;
        end
        
        // store word
        @(posedge CLK) begin
            rs = 5'd0;          // $0
            rt = 5'd9;          // $t1
            slmm = 16'd0;
            RFWE = 0;
        end
        
        @(posedge CLK);
    end    
endmodule