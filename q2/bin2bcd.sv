module bin2bcd (
  input logic [3:0] binary,
  output logic [3:0] bcd,
  output logic carry
);

always_comb begin
  case (binary)
    4'b0000: {bcd,carry} = 5'b00000;
    4'b0001: {bcd,carry} = 5'b00010;
    4'b0010: {bcd,carry} = 5'b00100;
    4'b0011: {bcd,carry} = 5'b00110;
    4'b0100: {bcd,carry} = 5'b01000;
    4'b0101: {bcd,carry} = 5'b01010;
    4'b0110: {bcd,carry} = 5'b01100;
    4'b0111: {bcd,carry} = 5'b01110;
    4'b1000: {bcd,carry} = 5'b10000;
    4'b1001: {bcd,carry} = 5'b10010;
    4'b1010: {bcd,carry} = 5'b00001;
    4'b1011: {bcd,carry} = 5'b00011;
    4'b1100: {bcd,carry} = 5'b00101;
    4'b1101: {bcd,carry} = 5'b00111;
    4'b1110: {bcd,carry} = 5'b01001;
    4'b1111: {bcd,carry} = 5'b01011;
    default: {bcd,carry} = 5'b00000;
  endcase
end

endmodule
