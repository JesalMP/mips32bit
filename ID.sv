module ID (input logic clk,
               input logic [31:0] instruction,
               output logic [5:0] opcode,
               output logic [31:0] rs_data,
               output logic [31:0] rt_data,
               output logic [4:0] rd,
               output logic [5:0] shamt,
               output logic [5:0] funct,
               output logic [31:0] address);

    // Decode instruction fields
    logic [7:0] clock_number = 8'b0;
    logic [31:0] immediate_ext;
    gprs gprs_inst ();
    sign_extender sign_extender_inst (
        .in(instruction[15:0]),
        .out(immediate_ext)
    );
    always_ff @(posedge clk) begin
        opcode    <= instruction[31:26];
        if (instruction[31:26] == 6'b000000) begin // R-type
            gprs_inst.read_reg(instruction[25:21], rs_data);
            gprs_inst.read_reg(instruction[20:16], rt_data);
            rd     <= instruction[15:11];
            shamt  <= instruction[10:6];
            funct  <= instruction[5:0];
            address <= 16'b0000000000000000; // Not used in R-type
            
        end else begin // I-type and J-type
            gprs_inst.read_reg(instruction[25:21], rs_data);
            gprs_inst.read_reg(instruction[20:16], rt_data);
            rd     <= 5'b00000; // Not used in I-type and J-type
            shamt  <= 5'b00000; // Not used in I-type and J-type
            funct  <= 6'b000000; // Not used in I-type and J-type
            address <= immediate_ext; // Immediate or address field
        end
        // $display("ID Stage - Clock number: %0b", clock_number);
        // $display("Instruction: %b", instruction);
        // $strobe("Opcode: %b", opcode);
        // $strobe("RS: %b", rs_data);
        // $strobe("RT: %b", rt_data);
        // $strobe("RD: %b", rd);
        // $strobe("Shamt: %b", shamt);
        // $strobe("Funct: %b", funct);
        // $strobe("Address/Immediate: %b", address);
        // $strobe("--------------------------------------------------");
        clock_number <= clock_number + 1'b1; // Increment clock number
    end
endmodule