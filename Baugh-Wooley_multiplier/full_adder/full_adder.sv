module full_adder
(
  input logic     a_in,
  input logic     b_in,
  input logic     c_in,
  output logic    s_out,
  output logic    c_out
);

//support signals
logic first_xor;
logic second_xor;
logic first_and;
logic second_and;
logic first_or;

//full adder
assign first_xor = a_in ^ b_in;
assign second_xor = first_xor ^ c_in;
assign first_and = first_xor && c_in;
assign second_and = a_in && b_in;
assign first_or = first_and || second_and;

//output assignment
assign s_out = second_xor;
assign c_out = first_or;

endmodule
