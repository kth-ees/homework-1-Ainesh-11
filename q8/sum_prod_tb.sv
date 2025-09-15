`timescale 1ns/1ns

module sum_prod_tb;

parameter N=4;
logic [N-1:0] X [5:0];
logic [2*N+2:0] result;

sum_prod #(N) dut(.X(X), .result(result));

initial begin
  for (int i=0; i<10; i++) begin
    for (int j=0; j<6; j++) X[j] = $urandom_range(0,(1<<N)-1);
    #10;
  end
  $stop;
end

endmodule
