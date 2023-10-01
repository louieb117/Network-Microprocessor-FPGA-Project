`timescale 1ns / 1ps

module instruction_memory #(parameter AWL = 32,
                                DWL = 32,
                                resetValue = 0)
   (
        input RST,
        input [AWL-1:0] IMA,
        output reg [DWL-1:0] IMRD
    );
    reg [DWL-1:0] ROM [2**AWL-1:0];
    
    initial $readmemb ("init.dat", ROM);
    always @( IMA ) begin
        if ( RST ) IMRD <= resetValue;
        else IMRD <= ROM [IMA];    // Read
    end
    
endmodule
