module alu_control (
    input  logic [5:0] funct,      // funct field from instruction
    input  logic [2:0] alu_op,     // ALUOp from control unit
    output logic [2:0] alu_control  // control signal to ALU
);
    always_comb begin
        case (alu_op)
            3'b000: alu_control = 3'b010; // ADD (for lw, sw)
            3'b001: alu_control = 3'b110; // SUB (for beq)
            3'b010: begin                  // R-type instructions
                case (funct)
                    6'b100000: alu_control = 3'b010; // ADD
                    6'b100010: alu_control = 3'b110; // SUB
                    6'b100100: alu_control = 3'b000; // AND
                    6'b100101: alu_control = 3'b001; // OR
                    6'b101010: alu_control = 3'b111; // SLT
                endcase
            end
            default: alu_control = 3'bxxx; // Undefined ALUOp
        endcase
    end
endmodule
