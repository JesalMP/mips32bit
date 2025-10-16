module EX (input logic clk,
           input logic rst_n,
           input logic [31:0] srcA,
           input logic [31:0] srcB,
           input logic [31:0] immediate_ext,
           input logic RegDst,
           input logic ALUSrc,
           input logic MemtoReg,
           input logic RegWrite,
           input logic MemRead,
           input logic MemWrite,
           input logic Branch,
           input logic [1:0] ALUOp,
           input logic [5:0] funct,
           output logic [31:0] aluOut,
           output logic zeroFlag);
    logic [5:0] funct_to_alu_control;

    logic [1:0] alu_op_to_alu_control;
    logic [2:0] aluControl_from_alu_control;

    alu_control alu_control_inst (
        .funct(funct),
        .alu_op(ALUOp),
        .alu_control(aluControl_from_alu_control)
    );
    // ALU Control Unit
        logic zeroFlagEX;
        logic [31:0] aluResult;
        logic [31:0] srcB_to_alu;
        logic [31:0] srcA_to_alu;
        logic [2:0] aluControl_to_alu;
    ALU alu_inst (
        .srcA(srcA_to_alu),
        .srcB(srcB_to_alu),
        .aluControl(aluControl_to_alu),
        .aluResult(aluResult),
        .zeroFlag(zeroFlagEX)
    );
    always_comb begin
        // Select srcB based on ALUSrc
        srcB_to_alu = ALUSrc ? immediate_ext : srcB;
        // Pass srcA directly
        srcA_to_alu = srcA;
        // Pass ALU control
        aluControl_to_alu = aluControl_from_alu_control;
    end
    always_ff @(posedge clk or negedge rst_n) begin
        $display("ALU Control: %0b, SrcA: %0d, SrcB: %0d", aluControl_from_alu_control, srcA, srcB);
            
            aluOut <= aluResult;
            zeroFlag <= zeroFlagEX;
            $strobe("EX Stage - ALU Control: %0b, SrcA: %0d, SrcB: %0d, ALU Out: %0d, Zero Flag: %0b", aluControl_from_alu_control, srcA, srcB, aluOut, zeroFlag);
            $strobe("--------------------------------------------------");
    end

endmodule