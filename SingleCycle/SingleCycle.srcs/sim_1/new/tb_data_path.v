`timescale 1ns / 1ps

module tb_data_path;
    
    parameter AWL = 5;
    parameter SWL = 3;
    parameter DWL = 32;
        
    // control signals
    reg CLK; 
    reg RFWE;
    reg DMWE;
    reg [SWL-1:0] ALU_Sel;
    reg sel_01;
    reg sel_02;
    // input signals
    reg [AWL-1:0] rt;
    reg [AWL-1:0] rs;
    reg [AWL-1:0] rd;
    reg [DWL-1:0] slmm;
    // output signals
    wire [DWL-1:0] RFRD1;
    wire [DWL-1:0] RFRD2;
    wire [DWL-1:0] DMRD;
    wire ALU_Zero;
    wire [DWL-1:0] ALU_Out;
    wire [AWL-1:0] rtd;
    wire [AWL-1:0] ALUIn2;
    
    // Clock generation
    initial CLK <= 0;
        always #10 CLK <= ~CLK;
        
    data_path DP01(
        .CLK(CLK), 
        .RFWE(RFWE), 
        .DMWE(DMWE), 
        .ALU_Sel(ALU_Sel), 
        .rt(rt), 
        .rs(rs), 
        .sel_01(sel_01), 
        .rtd(rtd),
        .slmm(slmm),
        .RFRD1(RFRD1), 
        .RFRD2(RFRD2), 
        .ALUIn2(ALUIn2),
        .ALU_Zero(ALU_Zero), 
        .ALU_Out(ALU_Out), 
        .DMRD(DMRD), 
        .rd(rd), 
        .sel_02(sel_02)
    );
                    
    // Test Bench
    initial begin 

        // load word
        @(posedge CLK) begin
            
            rs = 5'd0;          // $0
            rt = 5'd8;          // $t0
            ALU_Sel = 3'b000;
            sel_01 = 0;         // mux select
            sel_02 = 1;
            RFWE = 1;
            slmm = 32'd0; 
            
        end
        @(posedge CLK) begin
            
            rs = 5'd0;          // $0
            rt = 5'd9;          // $t1
            slmm = 32'd1;       // 1( )
            
        end 
        @(posedge CLK) begin
            
            rs = 5'd0;          // $0
            rt = 5'd10;          // $t2
            slmm = 32'd2;       // 2( )
            
        end 
        @(posedge CLK) begin
            
            rs = 5'd0;          // $0
            rt = 5'd11;          // $t3
            slmm = 32'd3;       // 3( )
            
        end 
        @(posedge CLK) begin
            
            rs = 5'd0;          // $0
            rt = 5'd12;          // $t4
            slmm = 32'd4;       // 4( )
            
        end 
        
        // Store Word
        @(posedge CLK) begin
            
            DMWE = 1;
            RFWE = 0;
            rs = 5'd0;          // $0
            rt = 5'd8;          // $t0
            sel_01 = 1;         // mux select
            sel_02 = 0;
            
        end
        @(posedge CLK) begin
            DMWE = 1;
            RFWE = 0;
            rs = 5'd0;          // $0
            rt = 5'd9;          // $t1
                        
        end 
        @(posedge CLK) begin
            DMWE = 1;
            RFWE = 0;
            rs = 5'd0;          // $0
            rt = 5'd10;          // $t2
            
        end
        @(posedge CLK) begin
            DMWE = 1;
            RFWE = 0;
            rs = 5'd0;          // $0
            rt = 5'd11;          // $t3
            
        end 
        @(posedge CLK) begin
            DMWE = 1;
            RFWE = 0;
            rs = 5'd0;          // $0
            rt = 5'd12;          // $t4
                        
        end
        @(posedge CLK); 
        @(posedge CLK);

    end 

endmodule
