module CSA_8 (
  input  logic [7:0] A, B,
  output logic [7:0] S,
  output logic       carry
);

logic w;
logic [3:0] s0, s1;
logic c0, c1;

assign c0 = 0;
assign c1 = 1;

adder_4 v1(A[3:0], B[3:0], S[3:0], w);
adder_4 v2(A[7:4], B[7:4], s0, c0);
adder_4 v3(A[7:4], B[7:4], s1, c1);

assign {carry, S[7:4]} = (w == 0) ? {1'b0, s0} : {1'b1, s1};

endmodule
