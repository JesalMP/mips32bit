module ControlUnit (
    input  logic [5:0] opcode,
    output logic RegDst,
    output logic ALUSrc,
    output logic MemtoReg,
    output logic RegWrite,
    output logic MemRead,
    output logic MemWrite,
    output logic Branch,
    output logic [1:0] ALUOp
);
    always_comb begin
        // Default values
        RegDst   = 0;
        ALUSrc   = 0;
        MemtoReg = 0;
        RegWrite = 0;
        MemRead  = 0;
        MemWrite = 0;
        Branch   = 0;
        ALUOp    = 2'b00;

        case (opcode)
            6'b000000: begin // R-type
                RegDst   = 1;
                RegWrite = 1;
                ALUOp    = 2'b10;
            end

            6'b100011: begin // lw
                ALUSrc   = 1;
                MemtoReg = 1;
                RegWrite = 1;
                MemRead  = 1;
                ALUOp    = 2'b00;
            end

            6'b101011: begin // sw
                ALUSrc   = 1;
                MemWrite = 1;
                ALUOp    = 2'b00;
            end

            6'b000100: begin // beq
                Branch   = 1;
                ALUOp    = 2'b01;
            end

            default: begin
                // NOP / unsupported instruction
            end
        endcase
        $display("Control Unit - Opcode: %0b, RegDst: %0b, ALUSrc: %0b, MemtoReg: %0b, RegWrite: %0b, MemRead: %0b, MemWrite: %0b, Branch: %0b, ALUOp: %0b", 
                 opcode, RegDst, ALUSrc, MemtoReg, RegWrite, MemRead, MemWrite, Branch, ALUOp);
        $display("--------------------------------------------------");
    end
endmodule

