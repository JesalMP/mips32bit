module alu_control (
    input  logic [5:0] funct,      // funct field from instruction
    input  logic [1:0] alu_op,     // ALUOp from control unit
    output logic [2:0] alu_control  // control signal to ALU
);
    always_comb begin
        case (alu_op)
            2'b00: alu_control = 3'b010; // ADD (for lw, sw)
            2'b01: alu_control = 3'b110; // SUB (for beq)
            2'b10: begin                  // R-type instructions
                case (funct)
                    6'b100000: alu_control = 3'b010; // ADD
                    6'b100010: alu_control = 3'b110; // SUB
                    6'b100100: alu_control = 3'b000; // AND
                    6'b100101: alu_control = 3'b001; // OR
                    6'b101010: alu_control = 3'b111; // SLT
                endcase
                if (funct == 6'b100000) begin
                    //$display("ALU Control - ADD operation selected, %b",alu_control);

                end
            end
            default: alu_control = 3'bxxx;
        endcase
        // $display("ALU Control - ALUOp: %0b, Funct: %0b, ALU Control: %0b", alu_op, funct, alu_control);
        // $display("--------------------------------------------------");
    end
endmodule
