module MEM(input logic clk,
           input logic rst_n,
          input logic MemtoReg,
                input logic RegWrite,
                input logic MemRead,
                input logic MemWrite,
                input logic Branch,
           input logic [31:0] aluOut,
           input logic [31:0] writeData,
           output logic [31:0] readData,
           output logic [31:0] RegWriteToWB,
           output logic [31:0] MemtoRegToWB);

    data_memory data_memory_inst ();
    logic [31:0] temp_readData;

    always_ff @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
        end
        else begin    
            // $strobe("MEM Stage - ALU Out (Address): %0d, Write Data: %0d, Read Data: %0d, MemRead: %0b, MemWrite: %0b", aluOut, writeData, readData, MemRead, MemWrite);
            // $strobe("--------------------------------------------------");
            if (MemRead) begin
                data_memory_inst.read(aluOut[7:0], temp_readData);
            end
            if (MemWrite) begin
                data_memory_inst.write(aluOut[7:0], writeData);
            end
            readData <= temp_readData;
            RegWriteToWB <= RegWrite;
            MemtoRegToWB <= MemtoReg;
        end
    end
endmodule