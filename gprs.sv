module gprs();
const reg[31:0] regZero = 32'b0; // $zero
reg[31:0] regAt; // $at 
reg[31:0] regV [1:0]; // $v0-v1
reg[31:0] regA [3:0]; // $a0-a3
reg[31:0] regT [9:0]; // $t0-t9
reg[31:0] regS [7:0]; // $s0-s7
reg[31:0] regK [1:0]; // $k0-k1
reg[31:0] regGP; // $gp
reg[31:0] regSP; // $sp
reg[31:0] regFP; // $fp
reg[31:0] regRA; // $ra

initial begin
    // Initialize all registers to random values except $zero
    regAt = $random;
    for (int i = 0; i < 2; i++) regV[i] = $random;
    for (int i = 0; i < 4; i++) regA[i] = $random;
    for (int i = 0; i < 10; i++) regT[i] = $random;
    for (int i = 0; i < 8; i++) regS[i] = $random;
    for (int i = 0; i < 2; i++) regK[i] = $random;
    regGP = $random;
    regSP = $random;
    regFP = $random;
    regRA = $random;
    $display("Initial Register File State:");
    print_regs();
end

task read_reg(input logic [4:0] reg_num, output logic [31:0] reg_data);
    case (reg_num)
        5'd0: reg_data = regZero;
        5'd1: reg_data = regAt;
        5'd2: reg_data = regV[0];
        5'd3: reg_data = regV[1];
        5'd4: reg_data = regA[0];
        5'd5: reg_data = regA[1];
        5'd6: reg_data = regA[2];
        5'd7: reg_data = regA[3];
        5'd8: reg_data = regT[0];
        5'd9: reg_data = regT[1];
        5'd10: reg_data = regT[2];
        5'd11: reg_data = regT[3];
        5'd12: reg_data = regT[4];
        5'd13: reg_data = regT[5];
        5'd14: reg_data = regT[6];
        5'd15: reg_data = regT[7];
        5'd16: reg_data = regT[8];
        5'd17: reg_data = regT[9];
        5'd18: reg_data = regS[0];
        5'd19: reg_data = regS[1];
        5'd20: reg_data = regS[2];
        5'd21: reg_data = regS[3];
        5'd22: reg_data = regS[4];
        5'd23: reg_data = regS[5];
        5'd24: reg_data = regS[6];
        5'd25: reg_data = regS[7];
        5'd26: reg_data = regK[0];
        5'd27: reg_data = regK[1];
        5'd28: reg_data = regGP;
        5'd29: reg_data = regSP;
        5'd30: reg_data = regFP;
        5'd31: reg_data = regRA;
        default: reg_data = 32'b0;
    endcase
endtask

task write_reg(input logic [4:0] reg_num, input logic [31:0] reg_data);
    if (reg_num != 5'd0) begin // $zero is read-only
        case (reg_num)
            5'd1: regAt = reg_data;
            5'd2: regV[0] = reg_data;
            5'd3: regV[1] = reg_data;
            5'd4: regA[0] = reg_data;
            5'd5: regA[1] = reg_data;
            5'd6: regA[2] = reg_data;
            5'd7: regA[3] = reg_data;
            5'd8: regT[0] = reg_data;
            5'd9: regT[1] = reg_data;
            5'd10: regT[2] = reg_data;
            5'd11: regT[3] = reg_data;
            5'd12: regT[4] = reg_data;
            5'd13: regT[5] = reg_data;
            5'd14: regT[6] = reg_data;
            5'd15: regT[7] = reg_data;
            5'd16: regT[8] = reg_data;
            5'd17: regT[9] = reg_data;
            5'd18: regS[0] = reg_data;
            5'd19: regS[1] = reg_data;
            5'd20: regS[2] = reg_data;
            5'd21: regS[3] = reg_data;
            5'd22: regS[4] = reg_data;
            5'd23: regS[5] = reg_data;
            5'd24: regS[6] = reg_data;
            5'd25: regS[7] = reg_data;
            5'd26: regK[0] = reg_data;
            5'd27: regK[1] = reg_data;
            5'd28: regGP = reg_data;
            5'd29: regSP = reg_data;
            5'd30: regFP = reg_data;
            5'd31: regRA = reg_data;
        endcase
    end
endtask

task print_regs();
    $display("Register File State:");
    $display("$zero: %d", regZero);
    $display("$at:   %d", regAt);
    $display("$v0:   %d", regV[0]);
    $display("$v1:   %d", regV[1]);
    $display("$a0:   %d", regA[0]);
    $display("$a1:   %d", regA[1]);
    $display("$a2:   %d", regA[2]);
    $display("$a3:   %d", regA[3]);
    for (int i = 0; i < 10; i++) begin
        $display("$t%d:   %d", i, regT[i]);
    end
    for (int i = 0; i < 8; i++) begin
        $display("$s%d:   %d", i, regS[i]);
    end
    $display("$k0:   %d", regK[0]);
    $display("$k1:   %d", regK[1]);
    $display("$gp:   %d", regGP);
    $display("$sp:   %d", regSP);
    $display("$fp:   %d", regFP);
    $display("$ra:   %d", regRA);
    $display("-------------------------");
endtask
endmodule