`timescale 1ns / 1ps

module data_path#(parameter AWL = 5,
                            SWL = 3,
                            DWL = 32,
                            resetValue = 0)
    (
        // control signals
        input CLK,
        // register_file  
        input RFWE,         // control signal
        input [AWL-1:0] rs, // RFRA1
        input [AWL-1:0] rt, // RFWA
        output [DWL-1:0] RFRD1,
        output [DWL-1:0] RFRD2,
        // data_memory
        input DMWE,         // control signal
        output [DWL-1:0] DMRD,
        // alu
        input [SWL-1:0] ALU_Sel,    // control signal
        input [DWL-1:0] slmm,       // control signal
        output ALU_Zero,            // status signal
        output [DWL-1:0] ALU_Out,
        // mux 01
        input sel_01,
        input [AWL-1:0] rd,
        output [AWL-1:0] rtd,
        // mux 02
        input sel_02,
        output [DWL-1:0] ALUIn2   // control signal
    );
    
    register_file RF01(
        .CLK(CLK), 
        .RFWE(RFWE), 
        .RFRA1(rs), 
        .RFRA2(rt), 
        .RFWA(rtd),
        .RFWD(DMRD), 
        .RFRD1(RFRD1), 
        .RFRD2(RFRD2)
    );
    
    data_memory DM01(
        .CLK(CLK), 
        .DMWE(DMWE), 
        .DMA(ALU_Out), 
        .DMWD(RFRD2), 
        .DMRD(DMRD)
    );                  
    
    alu ALU01(
        .A(RFRD1), 
        .B(ALUIn2), 
        .ALU_Sel(ALU_Sel), 
        .ALU_Out(ALU_Out), 
        .ALU_CARRY(ALU_Zero)
    );
    
    mux #(.WL(AWL)) MX_RFD_IN(
        .sel(sel_01), 
        .a(rd), 
        .b(rt), 
        .out(rtd)
    );
    
    mux #(.WL(DWL)) MX_ALUIn2(
        .sel(sel_02), 
        .a(slmm), 
        .b(RFRD2), 
        .out(ALUIn2)
    );

                        
endmodule
