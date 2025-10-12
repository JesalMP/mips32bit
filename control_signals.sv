interface ctrl_if();
    logic reg_dst, alu_src, mem_to_reg;
    logic reg_write, mem_read, mem_write;
    logic branch, jump;
    logic [2:0] alu_op;
endinterface
