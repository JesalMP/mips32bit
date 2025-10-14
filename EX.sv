module EX (input logic clk,
           input logic rst_n,
           input logic [2:0] aluControl,
           input logic [31:0] srcA,
           input logic [31:0] srcB,
           input logic [15:0] immediate,
           output logic [31:0] aluOut,
           output logic zeroFlag);
    logic zeroFlagEX;
    logic [31:0] aluResult;
    ALU alu_inst (
        .srcA(srcA),
        .srcB(srcB),
        .aluControl(aluControl),
        .aluResult(aluResult),
        .zeroFlag(zeroFlagEX)
    );

    always_ff @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            // Reset logic if needed
            aluResult <= 32'b0;
            zeroFlagEX <= 1'b0;
            
        end
        else begin
            $display("ALU Control: %0b, SrcA: %0d, SrcB: %0d", aluControl, srcA, srcB);
            aluOut <= aluResult;
            zeroFlag <= zeroFlagEX;
            $strobe("EX Stage - ALU Control: %0b, SrcA: %0d, SrcB: %0d, ALU Out: %0d, Zero Flag: %0b", aluControl, srcA, srcB, aluOut, zeroFlag);
            $strobe("--------------------------------------------------");
        end
    end

endmodule