`timescale 1ns / 1ps

module instruction_memory #(
    parameter AWL = 32,
    parameter DWL = 32,
    parameter resetValue = 0
)(
    input RST,
    input [AWL-1:0] IMA,
    output reg [DWL-1:0] IMRD
);

    reg [DWL-1:0] ROM [2**5-1:0]; // Memory Array
    
    initial begin
                                                            // 101011 <base> <rt> <offset>
        ROM[0] = 32'b10101110011010000000000000100000;       // sw $t0, 32($s3)
//        ROM[0] = 32'b00000001001010100100000000100000;
        ROM[1] = 32'b00000001100011010111100000100010;
        ROM[2] = 32'b10001110001011000000000001100100;
        ROM[3] = 32'b00010001000010011111111111111100;
    end
    
    always @( IMA ) begin
        if ( RST ) IMRD <= resetValue;
        else IMRD <= ROM [IMA];    // Read
    end
    
endmodule
