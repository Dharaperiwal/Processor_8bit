module Processor_Testbench;

// Inputs
reg clk;
reg [3:0] Opcode;
reg [2:0] Rs, Rt, Rd;

// Outputs
wire [7:0] ALU_Result;

// Instantiate the Processor
Processor uut (
    .clk(clk),
    .Opcode(Opcode),
    .Rs(Rs),
    .Rt(Rt),
    .Rd(Rd),
    .ALU_Result(ALU_Result)
);

// Clock Generation
initial begin
    clk = 0;
    forever #5 clk = ~clk; // 10ns clock period
end

// Test Sequence
initial begin
    $dumpfile("Processor_Testbench.vcd");
    $dumpvars(0,Processor_Testbench);
    // Test ADD operation: Rs = 3, Rt = 2, Rd = 1 (Registers 3 and 2 added and stored in Register 1)
    Opcode = 4'b0000; Rs = 3'b011; Rt = 3'b010; Rd = 3'b001;
    #10; // Wait for a few clock cycles
    
    // Test SUB operation: Rs = 3, Rt = 2, Rd = 1 (Registers 3 and 2 subtracted and stored in Register 1)
    Opcode = 4'b0001; Rs = 3'b011; Rt = 3'b010; Rd = 3'b001;
    #10;

    // Test AND operation: Rs = 1, Rt = 2, Rd = 0 (Registers 1 and 2 ANDed and stored in Register 0)
    Opcode = 4'b0010; Rs = 3'b001; Rt = 3'b010; Rd = 3'b000;
    #10;

    // Test OR operation: Rs = 1, Rt = 2, Rd = 0 (Registers 1 and 2 ORed and stored in Register 0)
    Opcode = 4'b0011; Rs = 3'b001; Rt = 3'b010; Rd = 3'b000;
    #10;

    // Test XOR operation: Rs = 1, Rt = 2, Rd = 0 (Registers 1 and 2 XORed and stored in Register 0)
    Opcode = 4'b0100; Rs = 3'b001; Rt = 3'b010; Rd = 3'b000;
    #10;

    // Test NOT operation: Rs = 1, Rt = don't care, Rd = 0 (NOT of Register 1 stored in Register 0)
    Opcode = 4'b0101; Rs = 3'b001; Rt = 3'b000; Rd = 3'b000;
    #10;

    // Test left shift operation: Rs = 1, Rt = don't care, Rd = 0 (Left shift of Register 1 stored in Register 0)
    Opcode = 4'b0110; Rs = 3'b001; Rt = 3'b000; Rd = 3'b000;
    #10;

    // Test right shift operation: Rs = 1, Rt = don't care, Rd = 0 (Right shift of Register 1 stored in Register 0)
    Opcode = 4'b0111; Rs = 3'b001; Rt = 3'b000; Rd = 3'b000;
    #10;

    $finish; // End simulation
end

endmodule
