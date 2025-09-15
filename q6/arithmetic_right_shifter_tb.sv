`timescale 1ns/1ps
module ArithmeticRightShifter_tb;

localparam N = 5;
logic [N-1:0] input_data;
logic [1:0] control;
logic [N-1:0] shifted_result;
  
ArithmeticRightShifter #(N) dut (.input_data(input_data), .control(control), .shifted_result(shifted_result));
  
initial begin
	input_data = 5'b01010;
	for (control = 0; control < 4; control++) begin
	#5;
	$display("input=%b (%0d), shift=%0d -> output=%b (%0d)", input_data, $signed(input_data), control, shifted_result, $signed(shifted_result));
end

input_data = 5'b10110;

	for (control = 0; control < 4; control++) begin
	#5;
	$display("input=%b (%0d), shift=%0d -> output=%b (%0d)", input_data, $signed(input_data), control, shifted_result, $signed(shifted_result));
	end

input_data = 5'b11111;

	for (control = 0; control < 4; control++) begin
	#5;
	$display("input=%b (%0d), shift=%0d -> output=%b (%0d)", input_data, $signed(input_data), control, shifted_result, $signed(shifted_result));
	end
	$stop;
end
endmodule
