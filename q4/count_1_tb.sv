`timescale 1ns/1ns
module count_1_tb;

logic [3:0] a_tb;
logic [2:0] out_tb;

count_1 dut(.a(a_tb), .out(out_tb));

initial begin
  for (int i = 0; i < 16; i++) begin
    a_tb = i;
    #10;
  end
  $stop;
end

endmodule
