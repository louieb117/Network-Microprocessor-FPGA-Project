`timescale 1ns / 1ps

// Read-First Mode with reset
module register_file 
#(
    parameter   AWL = 5,
    parameter   DWL = 32,
    parameter   resetValue = 0
)(
    input CLK, 
    input RFWE,
    input [AWL-1:0] RFRA1,
    input [AWL-1:0] RFRA2,
    input [AWL-1:0] RFWA,
    input [DWL-1:0] RFWD,
    output [DWL-1:0] RFRD1,
    output [DWL-1:0] RFRD2
);
    reg [DWL-1:0] RAM [2**AWL-1:0];    // Memory array
    integer i;
    
    initial begin 
        for(i = 0; i < DWL-1; i = i + 1)begin
            RAM [i] = 0;
        end
    end
        
    always @( posedge CLK ) begin
        if ( RFWE ) RAM [RFWA] <= RFWD;    // Write
    end
    
    assign RFRD1 = RAM [RFRA1];           // Read
    assign RFRD2 = RAM [RFRA2];
    
endmodule
