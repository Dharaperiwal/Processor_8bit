module Processor(
    input clk,
    input [3:0] Opcode,
    input [2:0] Rs, Rt, Rd,
    output [7:0] ALU_Result
);

wire [7:0] Read_Data1, Read_Data2, ALU_Out;
wire RegWrite;
wire [2:0] ALU_Sel;

registerFile regFile(
    .clk(clk),
    .Read_Reg1(Rs),
    .Read_Reg2(Rt),
    .Write_Reg(Rd),
    .Write_Data(ALU_Out),
    .RegWrite(RegWrite),
    .Read_Data1(Read_Data1),
    .Read_Data2(Read_Data2)
);

ALU alu(
    .A(Read_Data1),
    .B(Read_Data2),
    .ALU_Sel(ALU_Sel),
    .ALU_Out(ALU_Out)
);

ControlUnit control(
    .Opcode(Opcode),
    .ALU_Sel(ALU_Sel),
    .RegWrite(RegWrite),
    .MemRead(),
    .MemWrite()
);

assign ALU_Result = ALU_Out;

endmodule
