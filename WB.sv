module WB(input logic clk,
              input logic rst_n,
              input logic MemtoReg,
              input logic RegWrite,
              input logic [31:0] readData,
              input logic [31:0] aluOut,
              output logic [31:0] writeDataToReg,
              output logic RegWriteToReg);
    
     always_ff @(posedge clk or negedge rst_n) begin
          if (!rst_n) begin
          end
          else begin
                if (MemtoReg) begin
                 writeDataToReg <= readData;
                end
                else begin
                 writeDataToReg <= aluOut;
                end
                RegWriteToReg <= RegWrite;
    
                $strobe("WB Stage - MemtoReg: %0b, RegWrite: %0b, Read Data: %0d, ALU Out: %0d, Write Data to Reg: %0d", MemtoReg, RegWrite, readData, aluOut, writeDataToReg);
                $strobe("--------------------------------------------------");
          end
     end