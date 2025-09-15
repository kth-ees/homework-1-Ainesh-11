module count_1(input  logic [3:0] a,
			output logic [2:0] out);

logic [1:0] sum0, sum1;
logic [2:0] sum2;

assign sum0 = a[0] + a[1];
assign sum1 = a[2] + a[3];
assign sum2 = sum0 + sum1;
assign out = sum2;

endmodule
