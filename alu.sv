module ALU (input logic [31:0] srcA,
                input logic [31:0] srcB,
                input logic [2:0] aluControl,
                output logic [31:0] aluResult,
                output logic zeroFlag);

    always_comb begin
        case (aluControl)
            3'b010: begin aluResult = srcA + srcB;$display("ALU Control - ADD operation selected, %b", aluControl); end // ADD
            3'b110: begin aluResult = srcA - srcB;$display("ALU Control - SUB operation selected, %b", aluControl); end // SUB
            3'b000: begin aluResult = srcA & srcB;$display("ALU Control - AND operation selected, %b", aluControl); end // AND
            3'b001: begin aluResult = srcA | srcB;$display("ALU Control - OR operation selected, %b", aluControl); end // OR
            3'b111: begin aluResult = (srcA < srcB) ? 32'b1 : 32'b0;$display("ALU Control - SLT operation selected, %b", aluControl); end // SLT
            default: aluResult = 32'b0;
        endcase
        zeroFlag = (aluResult == 32'b0) ? 1'b1 : 1'b0;

        $strobe("ALU Operation: %0b, SrcA: %0d, SrcB: %0d, Result: %0d, Zero Flag: %0b", aluControl, srcA, srcB, aluResult, zeroFlag);
    end
endmodule