module registerFile(
    input clk,
    input [2:0] Read_Reg1, Read_Reg2, Write_Reg,
    input [7:0] Write_Data,
    input RegWrite,
    output reg [7:0] Read_Data1, Read_Data2
);

reg [7:0] Registers [7:0]; // 8 Registers, 8-bit each

always @(posedge clk) begin
    if (RegWrite)
        Registers[Write_Reg] <= Write_Data;
end

always @(*) begin
    Read_Data1 = Registers[Read_Reg1];
    Read_Data2 = Registers[Read_Reg2];
end

endmodule
