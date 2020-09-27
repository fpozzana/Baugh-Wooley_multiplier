module and_bw_block
(
  input logic     a_in,
  input logic     b_in,
  input logic     c_in,
  input logic     s_in,
  output logic    s_out,
  output logic    c_out
);

//support signals
logic inputs_and_wire;

//inputs AND
assign inputs_and_wire = a_in && b_in;

//full adder
full_adder f0 (.a_in(inputs_and_wire), .b_in(c_in), .c_in(s_in), .s_out(s_out), .c_out(c_out));

endmodule
