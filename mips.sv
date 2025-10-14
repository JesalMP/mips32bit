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
                gprs gprs_inst ();
    always_ff @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            pc <= 8'b0; // Reset PC to 0
            end else begin
            $display("INIT PC: %0b, clock number: %0b", pc, clock_number);
            $display("--------------------------------------------------");
            gprs_inst.read_reg(rs, rs_data);
            gprs_inst.read_reg(rt, rt_data);
            $display("RS Data: %0d, RT Data: %0d", rs_data, rt_data);
            $display("--------------------------------------------------");
            clock_number <= clock_number + 1'b1; // Increment clock number
            
            end
            pc <= pc + 1'b1;
    end
    assign instruction_to_ID = instruction;

    logic [31:0] rs_data;
    logic [31:0] rt_data;

    logic [2:0] aluControl;
    logic [31:0] aluOut;
    logic [2:0] alu_op;

    

    logic RegDst;
    logic ALUSrc;
    logic MemtoReg;
    logic RegWrite;
    logic MemRead;
    logic MemWrite;
    logic Branch;
    logic [1:0] ALUOp;

    
    ControlUnit controlUnit_inst (
        .opcode(opcode),
        .RegDst(RegDst),
        .ALUSrc(ALUSrc),
        .MemtoReg(MemtoReg),
        .RegWrite(RegWrite),
        .MemRead(MemRead),
        .MemWrite(MemWrite),
        .Branch(Branch),
        .ALUOp(ALUOp)
    );
    

    alu_control aluControl_inst (
        .alu_op(ALUOp),
        .funct(funct),
        .alu_control(aluControl)
    );
    
    EX ex_inst (
        .clk(clk),
        .rst_n(rst_n),
        .aluControl(aluControl),
        .srcA(rs_data),
        .srcB(rt_data),
        .aluOut(aluOut)
    );

endmodule