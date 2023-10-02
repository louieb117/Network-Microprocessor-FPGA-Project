`timescale 1ns / 1ps

// Read-First Mode with reset
module data_memory #(
    parameter   AWL = 32,
    parameter   DWL = 32,
    parameter   resetValue = 32'd0
)(
    input CLK, 
    input DMWE, 
    input [AWL-1:0] DMA,
    input [DWL-1:0] DMWD,
    output wire [DWL-1:0] DMRD
);
        
    reg [DWL-1:0] RAM [AWL-1:0];    // Memory array
//    integer i;
     
//    initial begin 
//        i = 0;
//        RAM [i] = 32'd17;
//        RAM [i + 1] = 32'd31;
//        RAM [2] = -32'd5;
//        RAM [32'd3] = -32'd2;
//        RAM [32'd4] = 32'd250;
//    end
    // synchronous
    always @( posedge CLK ) begin
        if ( DMWE )begin
             RAM [DMA] <= DMWD;    // Write
        end
    end
    
    // asynchronous
    assign DMRD = RAM [DMA];    // Read

endmodule
