module pc_adder (
    input  logic [7:0] pc_in,     
    output logic [7:0] pc_out 
);
    assign pc_out = pc_in + 8'd1;
endmodule