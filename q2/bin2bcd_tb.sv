`timescale 1ns/1ns

module bin2bcd_tb;

logic [3:0] binary_tb;
logic [3:0] bcd_tb;
logic carry_tb;

bin2bcd uut (.binary(binary_tb), .bcd(bcd_tb), .carry(carry_tb));

initial begin
  for (int i = 0; i < 16; i++) begin
    binary_tb = i;
    #10;
  end
  $stop;
end

endmodule
