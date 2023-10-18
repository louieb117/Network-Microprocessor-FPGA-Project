`timescale 1ns / 1ps

module data_path#
(
    parameter AWL = 5,
    parameter SWL = 3,
    parameter DWL = 32,
    parameter resetValue = 0
)(
    // control signals
    input CLK,
    input [31:0] EEPROMDataLine,
    input [31:0] ARPDataLine    
);
    wire [31:0] Inst;
    
    wire [5:0] Opcode;    
    wire [4:0] rs;
    wire [4:0] rt;
    wire [4:0] rd;
    wire [4:0] shamt;
    wire [5:0] Funct;
    
    wire [15:0] imm;
    
    wire [25:0] jtarget;
    
    wire [31:0] sImm;
    
    assign Opcode = Inst[31:26];
    assign rs = Inst[25:21];
    assign rt = Inst[20:16];
    assign rd = Inst[15:11];
    assign shamt = Inst[10:6];
    assign Funct = Inst[5:0];
    
    assign imm = Inst[15:0];
    
    assign jtarget = Inst[25:0];
    
    assign sImm[15:0] = imm[15:0];
    assign sImm[31:16] = imm[15];
    
    control_unit CU01
    (        
        .Opcode(Opcode),
        .Funct(Funct),
        .RFWE(RFWE),
        .RFDSel(RFDSel),
        .ALUInSel(ALUInSel),
        .Branch(Branch),
        .DMWE(DMWE),
        .MtoRFSel(MtoRFSel),        
        .ALUSel(ALUSel)
    );
    
    mux #(.WL(32)) MX_PCSel
    (
        .sel(PCSel), 
        .a(PCp1), 
        .b(PCBranch), 
        .out(PCRefIn)
    );
    
    program_counter PC01
    (
        .CLK(CLK),
        .PCRefIn(PCRefIn),
        .PCRefOut(PCRefOut)
    );
    
    alu ADDER01
    (
        .A(PCRefOut), 
        .B(32'd1), 
        .ALU_Out(PCp1)
    );
    
    instruction_memory IM01
    (
        .IMA(PCRefOut),
        .IMRD(Inst)
    );
    
    register_file RF01
    (
        .CLK(CLK), 
        .RFWE(RFWE), 
        .RFRA1(rs), 
        .RFRA2(rt), 
        .RFWA(rtd),
        .RFWD(MWD), 
        .RFRD1(RFRD1), 
        .RFRD2(RFRD2)
    );
    
    mux #(.WL(AWL)) MX_RFD_IN
    (
        .sel(sel_01), 
        .a(rt), 
        .b(rd), 
        .out(rtd)
    );    
    
    mux #(.WL(DWL)) MX_ALUIn2
    (
        .sel(ALUInSel), 
        .a(RFRD2), 
        .b(sImm), 
        .out(ALUIn2)
    );    
    
    alu ADDER02
    (
        .A(sImm), 
        .B(PCp1), 
        .ALU_Out(PCp1)
    );
        
    alu ALU01
    (
        .A(RFRD1), 
        .B(ALUIn2), 
        .ALU_Sel(ALU_Sel), 
        .ALU_Out(ALU_Out), 
        .ALU_CARRY(ALU_Zero)
    );
 
    data_memory DM01
    (
        .CLK(CLK), 
        .DMWE(DMWE), 
        .DMA(ALU_Out), 
        .DMWD(RFRD2), 
        .DMRD(DMOut)
    );                  
    
    mux_4 MX_RFSel
    (
        .sel(MtoRFSel),
        .a(ALUOut),
        .b(DMOut),
        .c(),
        .d(),
        .out(MWD)
    );    

                        
endmodule
