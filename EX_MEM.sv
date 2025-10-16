module EX_MEM (input logic clk,
               input logic RegDst,
                input logic MemtoReg,
                input logic RegWrite,
                input logic MemRead,
                input logic MemWrite,
                input logic Branch,
                output logic RegDst,
                output logic MemtoReg,
                output logic RegWrite,
                output logic MemRead,
                output logic MemWrite,
                output logic Branch);
logic RegDst_EX;
logic MemtoReg_EX;
logic RegWrite_EX;
logic MemRead_EX;
logic MemWrite_EX;
logic Branch_EX;

endmodule
