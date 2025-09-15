`timescale 1ns/1ns

module mult16_tb;

logic [15:0] a, b;
logic [31:0] y;

mult16 dut(.a(a), .b(b), .y(y));

initial begin
  for (int i=0; i<10; i++) begin
    a = $urandom_range(0,65535);
    b = $urandom_range(0,65535);
    #10;
  end
  $stop;
end

endmodule
