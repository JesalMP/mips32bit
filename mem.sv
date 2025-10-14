module MEM(logic clk,
           logic rst_n,
           logic MemRead,
           logic MemWrite,
           logic [31:0] aluOut,
           logic [31:0] writeData,
           output logic [31:0] readData);

    // Data memory: 256 words = 1 KB
    data_mem data_mem_inst (
        .clk(clk),
        .rst_n(rst_n),
        .addr(aluOut[7:0]), // Word-aligned access
        .write_data(writeData),
        .MemRead(MemRead),
        .MemWrite(MemWrite),
        .read_data(readData)
    );

    always_ff @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            // Reset logic if needed
        end
        else begin    
            $strobe("MEM Stage - ALU Out (Address): %0d, Write Data: %0d, Read Data: %0d, MemRead: %0b, MemWrite: %0b", aluOut, writeData, readData, MemRead, MemWrite);
            $strobe("--------------------------------------------------");
        end
    end
endmodule