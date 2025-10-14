module ALU (input logic [31:0] srcA,
                input logic [31:0] srcB,
                input logic [2:0] aluControl,
                input logic [15:0] immediate,
                output logic [31:0] aluResult,
                output logic zeroFlag);

    always_comb begin
        case (aluControl)
            3'b010: aluResult = srcA + srcB; // ADD
            3'b110: aluResult = srcA - srcB; // SUB
            3'b000: aluResult = srcA & srcB; // AND
            3'b001: aluResult = srcA | srcB; // OR
            3'b111: aluResult = (srcA < srcB) ? 32'b1 : 32'b0; // SLT
            default: aluResult = 32'b0; // Default case
        endcase
        zeroFlag = (aluResult == 32'b0) ? 1'b1 : 1'b0; // Set zero flag
    end
endmodule