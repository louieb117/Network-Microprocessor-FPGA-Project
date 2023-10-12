`timescale 1ns / 1ps


module tb_mux_4;

    // Control Signals
    reg CLK;
    
    parameter WL = 32;
    parameter SWL = 2;
    
    // Input Signals
    reg [WL-1:0] a;
    reg [WL-1:0] b;
    reg [WL-1:0] c;
    reg [WL-1:0] d;
    
    // Select Signals
    reg [SWL-1:0] sel;
    
    // Output Signals
    wire [WL-1:0] out;
    
    // Clock Generation
    initial CLK <= 0;
        always #10 CLK <= ~CLK;
    
    // Module Under Test
    mux_4 MUX01(
        .sel(sel),
        .a(a), 
        .b(b),
        .c(c),
        .d(d),
        .out(out)
    );
    
    // Test Bench
    initial begin 

        @(posedge CLK) begin
            a = 32'd4;          
            b = 32'd6;
            c = 32'd8;
            d = 32'd10;     
            sel = 2'b00;
        end
        
        @(posedge CLK);
        @(posedge CLK) begin
            sel = 2'b01;
        end
        
        @(posedge CLK);
        @(posedge CLK) begin
            sel = 2'b10;
        end
        
        @(posedge CLK);
        @(posedge CLK) begin
            sel = 2'b11;
        end
                        
    end    
endmodule
