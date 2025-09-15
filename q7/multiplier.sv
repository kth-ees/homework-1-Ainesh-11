module half_adder (
    input  logic a, b,
    output logic s, c_out
);
    assign s     = a ^ b;
    assign c_out = a & b;
endmodule

module full_adder (
    input  logic a, b, c_in,
    output logic s, c_out
);
    logic s1, c1, c2;
    half_adder ha1(a, b, s1, c1);
    half_adder ha2(s1, c_in, s, c2);
    assign c_out = c1 | c2;
endmodule

module multiplier #(parameter N=5)(
    input  logic [N-1:0] a, b,
    output logic [2*N-1:0] product
);

// partial products
logic [N-1:0] pp [N-1:0]; 

genvar i, j;
generate
for (i = 0; i < N; i++) begin
	for (j = 0; j < N; j++) begin
		assign pp[i][j] = a[j] & b[i];
	end
end
endgenerate

// wires for sums and carries
logic s1,s2,s3,s4,s5,s6,s7,s8,s9;
logic c1,c2,c3,c4,c5,c6,c7,c8,c9;
logic c10,c11,c12,c13,c14,c15,c16,c17,c18,c19;

// column 0
assign product[0] = pp[0][0];

// olumn 1: pp[0][1], pp[1][0]
half_adder ha1(pp[0][1], pp[1][0], s1, c1);
assign product[1] = s1;

// column 2: pp[0][2], pp[1][1], pp[2][0] + carry
full_adder fa1(pp[0][2], pp[1][1], pp[2][0], s2, c2);
half_adder ha2(s2, c1, product[2], c3);

// column 3: pp[0][3], pp[1][2], pp[2][1], pp[3][0] + carry
full_adder fa2(pp[0][3], pp[1][2], pp[2][1], s3, c4);
full_adder fa3(s3, pp[3][0], c2, s4, c5);
half_adder ha3(s4, c3, product[3], c6);

// column 4: pp[0][4], pp[1][3], pp[2][2], pp[3][1], pp[4][0] + carry
full_adder fa4(pp[0][4], pp[1][3], pp[2][2], s5, c7);
full_adder fa5(s5, pp[3][1], pp[4][0], s6, c8);
full_adder fa6(s6, c4, c5, s7, c9);
half_adder ha4(s7, c6, product[4], c10);

// column 5: pp[1][4], pp[2][3], pp[3][2], pp[4][1] + carrys
full_adder fa7(pp[1][4], pp[2][3], pp[3][2], s8, c11);
full_adder fa8(s8, pp[4][1], c7, s9, c12);
full_adder fa9(s9, c8, c9, s10, c13);
half_adder ha5(s10, c10, product[5], c14);

// column 6: pp[2][4], pp[3][3], pp[4][2] + carrys
full_adder fa10(pp[2][4], pp[3][3], pp[4][2], s11, c15);
full_adder fa11(s11, c11, c12, s12, c16);
full_adder fa12(s12, c13, c14, product[6], c17);

// column 7: pp[3][4], pp[4][3] + carrys
full_adder fa13(pp[3][4], pp[4][3], c15, s13, c18);
full_adder fa14(s13, c16, c17, product[7], c19);

// column 8: pp[4][4] + carrys
full_adder fa15(pp[4][4], c18, c19, product[8], product[9]);

endmodule
