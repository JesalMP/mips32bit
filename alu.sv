module alu( input logic[2:0] aluControl,
            input logic[31:0] srcA,
            input logic[31:0] srcB,
            output logic[31:0] aluOut,
            output logic zeroFlag );

    always_comb begin
        case(aluControl)
            3'b000: aluOut = srcA & srcB; // AND
            3'b001: aluOut = srcA | srcB; // OR
            3'b010: aluOut = srcA + srcB; // ADD
            3'b110: aluOut = srcA - srcB; // SUB
            3'b111: aluOut = (srcA < srcB) ? 32'b1 : 32'b0; // SLT
            default: aluOut = 32'b0;
        endcase
        zeroFlag = (aluOut == 32'b0) ? 1'b1 : 1'b0;
    end
endmodule