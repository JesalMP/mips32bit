module EX_MEM (input logic clk,
                input logic MemtoReg,
                input logic RegWrite,
                input logic MemRead,
                input logic MemWrite,
                input logic Branch,
                output logic MemtoReg,
                output logic RegWrite,
                output logic MemRead,
                output logic MemWrite,
                output logic Branch);

logic MemtoReg_EX;
logic RegWrite_EX;
logic MemRead_EX;
logic MemWrite_EX;
logic Branch_EX;
logic MemtoReg_MEM;
logic RegWrite_MEM;
logic MemRead_MEM;
logic MemWrite_MEM;
logic Branch_MEM;

    always_ff @(posedge clk) begin
        MemtoReg_MEM <= MemtoReg_EX;
        RegWrite_MEM <= RegWrite_EX;
        MemRead_MEM <= MemRead_EX;
        MemWrite_MEM <= MemWrite_EX;
        Branch_MEM <= Branch_EX;

        MemtoReg <= MemtoReg_MEM;
        RegWrite <= RegWrite_MEM;
        MemRead <= MemRead_MEM;
        MemWrite <= MemWrite_MEM;
        Branch <= Branch_MEM;

        $strobe("EX/MEM Stage - MemtoReg: %0b, RegWrite: %0b, MemRead: %0b, MemWrite: %0b, Branch: %0b", MemtoReg_MEM, RegWrite_MEM, MemRead_MEM, MemWrite_MEM, Branch_MEM);
        $strobe("--------------------------------------------------");
    end

endmodule
