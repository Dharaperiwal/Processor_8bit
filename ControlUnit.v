module ControlUnit(
    input [3:0] Opcode,
    output reg [2:0] ALU_Sel,
    output reg RegWrite, MemRead, MemWrite
);

always @(*) begin
    case(Opcode)
        4'b0000: begin // ADD
            ALU_Sel = 3'b000;
            RegWrite = 1;
            MemRead = 0;
            MemWrite = 0;
        end
        4'b0001: begin // SUB
            ALU_Sel = 3'b001;
            RegWrite = 1;
            MemRead = 0;
            MemWrite = 0;
        end
        // Add cases for other operations
        default: begin
            ALU_Sel = 3'b000;
            RegWrite = 0;
            MemRead = 0;
            MemWrite = 0;
        end
    endcase
end

endmodule
