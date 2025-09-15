module sum_prod #(parameter N=4) (
  input  logic [N-1:0] X [5:0],
  output logic [2*N+2:0] result
);

logic [2*N-1:0] p0, p1, p2;

assign p0 = X[0] * X[1];
assign p1 = X[2] * X[3];
assign p2 = X[4] * X[5];
assign result = p0 + p1 + p2;

endmodule
