module instr_mem (
    input  logic [7:0] addr,
    output logic [31:0] instruction
);
    logic [31:0] instr_mem [0:255];



    // Optional initialization from a file
    // initial begin
    //     $readmemh("instr_mem_init.hex", instr_mem);
    // end

    initial for(int i=0; i<256; i=i+1) begin
        if(i==0)
            instr_mem[i] = 32'b00000001001010100100000000100000;
        else if(i==1)
            instr_mem[i] = 32'b00000010010100111000100000100010;
        // else if(i==2)    
        //     instr_mem[i] = 32'b00001000000000000000000000111111; 
        // else if(i==3)
        //     instr_mem[i] = 32'b00001100000000000000000000010000; 
        else begin
            instr_mem[i] = 32'b00000000000000000000000000000000; 
        end
    end
    assign instruction = instr_mem[addr[7:0]];


    
endmodule