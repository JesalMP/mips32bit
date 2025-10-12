module ID (input logic clk,
               input logic [31:0] instruction,
               output logic [5:0] opcode,
               output logic [4:0] rs,
               output logic [4:0] rt,
               output logic [4:0] rd,
               output logic [5:0] shamt,
               output logic [5:0] funct,
               output logic [15:0] address);

    // Decode instruction fields
    logic [7:0] clock_number = 8'b0;
    always_ff @(posedge clk) begin
        opcode    <= instruction[31:26];
        if (instruction[31:26] == 6'b000000) begin // R-type
            rs     <= instruction[25:21];
            rt     <= instruction[20:16];
            rd     <= instruction[15:11];
            shamt  <= instruction[10:6];
            funct  <= instruction[5:0];
            address <= 16'b0; // Not used in R-type
            
        end else begin // I-type and J-type
            rs     <= instruction[25:21];
            rt     <= instruction[20:16];
            rd     <= 5'b0; // Not used in I-type and J-type
            shamt  <= 5'b0; // Not used in I-type and J-type
            funct  <= 6'b0; // Not used in I-type and J-type
            address <= instruction[15:0]; // Immediate or address field
        end
        $display("ID Stage - Clock number: %0b", clock_number);
        $display("Instruction: %b", instruction);
        $display("Opcode: %b", opcode);
        $display("RS: %b", rs);
        $display("RT: %b", rt);
        $display("RD: %b", rd);
        $display("Shamt: %b", shamt);
        $display("Funct: %b", funct);
        $display("Address/Immediate: %b", address);
        $display("--------------------------------------------------");
        clock_number <= clock_number + 1'b1; // Increment clock number
    end
endmodule