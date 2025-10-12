module pc_adder (
    input  logic [7:0] pc_in,      // Current PC
    output logic [7:0] pc_out      // PC + 4
);
    assign pc_out = pc_in + 8'd1; // Increment PC by 1
endmodule