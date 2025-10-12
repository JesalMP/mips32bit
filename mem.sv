module data_memory (
  input  logic        clk,
  input  logic        mem_read,
  input  logic        mem_write,
  input  logic [7:0] addr,
  input  logic [31:0] data_in,
  output logic [31:0] data_out,
  input  logic        rst_n
);
  // 256 words = 1 KB of data memory
  logic [31:0] memory [0:255];


  // Optional: hold previous data_out when not reading; synchronous read & write
  // Remove any # delays for synthesizability
  int i;
  always_ff @(posedge clk or negedge rst_n) begin
    if (!rst_n) begin
      data_out <= 32'b0;
      for (i = 0; i < 256; i++) begin
        memory[i] <= 32'b0;
      end
    end else begin
      // Write when mem_write asserted and mem_read deasserted
      if (mem_write && !mem_read) begin
        memory[addr[7:0]] <= data_in;
      end

      // Read when mem_read asserted and mem_write deasserted
      if (mem_read && !mem_write) begin
        data_out <= memory[addr[7:0]];
      end
      // If both are 0 or both are 1, retain previous data_out
    end
  end
endmodule
