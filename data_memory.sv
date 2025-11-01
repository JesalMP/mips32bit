module data_memory ();
    logic[31:0] mem [0:255]; 

    initial begin
        mem[0] = 32'h00000005;
        mem[1] = 32'h0000000A; 
        mem[2] = 32'h0000000F; 
    end
    task automatic read(input logic [7:0] addr, output logic [31:0] data);
        data = mem[addr];
    endtask

    task automatic write(input logic [7:0] addr, input logic [31:0] data);
        mem[addr] = data;
    endtask
endmodule