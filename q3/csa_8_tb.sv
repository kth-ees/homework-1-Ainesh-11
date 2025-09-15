`timescale 1ns/1ns

module CSA_8_tb;

logic [7:0] w, x;  
logic [7:0] S;      
logic carry; 

CSA_8 UUT (.A(w), .B(x), .S(S), .carry(carry));

initial begin

    w = 8'b0;
    x = 8'b0;

    #10;
    // Test case 1: A = 25 (00011001), B = 37 (00100101)
    w = 8'b00011001;
    x = 8'b00100101;   
    #10;
    $display("Test 1 at: A=%0d, B=%0d, SUM=%0d, Carry=%b", w, x, S, carry);

    // Test case 2: A = 200 (11001000), B = 100 (01100100)
    w = 8'b11001000; 
    x = 8'b01100100;
    #10;
    $display("Test 2 at: A=%0d, B=%0d, SUM=%0d, Carry=%b", w, x, S, carry);

    $stop;
end
endmodule
