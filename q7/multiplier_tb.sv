`timescale 1ns/1ps
module tb_multiplier;

localparam N=5;
logic [N-1:0] a,b;
logic [2*N-1:0] product;

multiplier #(N) dut(.a(a),.b(b),.product(product));
initial begin
	a=5'b00101; b=5'b00011; #5;
	$display("a=%b (%0d), b=%b (%0d) -> product=%b (%0d)",a,$signed(a),b,$signed(b),product,$signed(product));

	a=5'b11101; b=5'b00011; #5;
	$display("a=%b (%0d), b=%b (%0d) -> product=%b (%0d)",a,$signed(a),b,$signed(b),product,$signed(product));

	a=5'b11101; b=5'b11110; #5;
	$display("a=%b (%0d), b=%b (%0d) -> product=%b (%0d)",a,$signed(a),b,$signed(b),product,$signed(product));

	a=5'b01010; b=5'b00101; #5;
	$display("a=%b (%0d), b=%b (%0d) -> product=%b (%0d)",a,$signed(a),b,$signed(b),product,$signed(product));

	$stop;
end
endmodule
