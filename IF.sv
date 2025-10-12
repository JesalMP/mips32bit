module IF (input logic clk,
               input logic [7:0] pc_in,
               output logic [31:0] instruction);

    // Instruction memory: 256 words = 1 KB

    // PC register
    logic [31:0] instructionIF;
    logic [7:0] clock_number = 8'b0;
    instr_mem instr_mem_inst (
        .addr(pc_in), // Word-aligned access
        .instruction(instructionIF)
    );

    always_ff @(posedge clk) begin
        
        instruction <= instructionIF; // Fetch instruction
        $display("IF Stage - PC: %0b, Instruction: %0b, clock number: %0b", pc_in, instructionIF, clock_number);
        $display("--------------------------------------------------");
        clock_number <= clock_number + 1'b1; // Increment clock number
    end
endmodule