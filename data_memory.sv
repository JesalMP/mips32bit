module data_memory ();
    logic[31:0] mem [0:255]; // 256 words of 32-bit memory

    initial begin
        // Initialize memory with some values for testing
        mem[0] = 32'h00000005; // Address 0 contains 5
        mem[1] = 32'h0000000A; // Address 1 contains 10
        mem[2] = 32'h0000000F; // Address 2 contains 15
        // Add more initial values as needed
    end
    task automatic read(input logic [7:0] addr, output logic [31:0] data);
        data = mem[addr];
    endtask

    task automatic write(input logic [7:0] addr, input logic [31:0] data);
        mem[addr] = data;
    endtask
endmodule