module mips (input logic clk,
               input logic rst_n);

    logic [7:0] pc = 8'b0;
    logic [31:0] instruction = 32'b0;
    logic [7:0] clock_number = 8'b0;
    
    IF if_inst (
        .clk(clk),
        .pc_in(pc),
        .instruction(instruction)
    );
    logic [31:0] instruction_to_ID;
    logic [5:0] opcode;
    logic [4:0] rs;
    logic [4:0] rt;
    logic [4:0] rd;
    logic [5:0] shamt;
    logic [5:0] funct;
    logic [15:0] address;

    ID id_inst (
        .clk(clk),
        .instruction(instruction_to_ID),
        .opcode(opcode),
        .rs(rs),
        .rt(rt),
        .rd(rd),
        .shamt(shamt),
        .funct(funct),
        .address(address)
    );

    always_ff @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            pc <= 8'b0; // Reset PC to 0
            end else begin
            $display("INIT PC: %0b, clock number: %0b", pc, clock_number);
            $display("--------------------------------------------------");
             // Pass instruction to ID stage
            clock_number <= clock_number + 1'b1; // Increment clock number
        end
        // Simple PC increment (no branching/jumping for now)
        pc <= pc + 1'b1;
    end
    assign instruction_to_ID = instruction;

endmodule