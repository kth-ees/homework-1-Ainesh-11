module mult4 (
  input  logic [3:0] a, b,
  output logic [7:0] y
);
assign y = a * b;
endmodule

module mult16 (
  input  logic [15:0] a, b,
  output logic [31:0] y
);

logic [7:0] p [3:0][3:0];
logic [31:0] sum;

always_comb begin
  sum = 0;
  for (int i=0; i<4; i++) begin
    for (int j=0; j<4; j++) begin
      sum += (p[i][j] << (4*(i+j)));
    end
  end
end

generate
  for (genvar i=0; i<4; i++) begin
    for (genvar j=0; j<4; j++) begin
      mult4 m(.a(a[4*i+3:4*i]), .b(b[4*j+3:4*j]), .y(p[i][j]));
    end
  end
endgenerate

assign y = sum;

endmodule
