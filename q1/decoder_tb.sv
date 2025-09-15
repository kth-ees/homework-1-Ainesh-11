`timescale 1ns/1ns

module decoder_tb;

logic [3:0] binary_tb;
logic [15:0] one_hot_tb;

decoder uut (.binary(binary_tb), .one_hot(one_hot_tb));

initial begin
  for (int i = 0; i < 16; i++) begin
    binary_tb = i;
    $display("input value: %d", binary_tb, "; output value: %d", one_hot_tb);
    #10;
  end
  $stop;
end
endmodule
