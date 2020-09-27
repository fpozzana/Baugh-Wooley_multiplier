`timescale 1 ns/10 ps  // time-unit = 1 ns, precision = 10 ps

module tb_full_adder;

logic a_in, b_in, c_in, c_out, s_out;

full_adder DUT (.a_in(a_in), .b_in(b_in), .c_in(c_in), .c_out(c_out), .s_out(s_out));

initial
begin
  a_in = 1'b0;
  b_in = 1'b0;
  c_in = 1'b0;
  #10us;
  a_in = 1'b1;
  b_in = 1'b0;
  c_in = 1'b0;
  #10us;
  a_in = 1'b0;
  b_in = 1'b1;
  c_in = 1'b0;
  #10us;
  a_in = 1'b1;
  b_in = 1'b1;
  c_in = 1'b0;
  #10us;
  a_in = 1'b0;
  b_in = 1'b0;
  c_in = 1'b1;
  #10us;
  a_in = 1'b1;
  b_in = 1'b0;
  c_in = 1'b1;
  #10us;
  a_in = 1'b0;
  b_in = 1'b1;
  c_in = 1'b1;
  #10us;
  a_in = 1'b1;
  b_in = 1'b1;
  c_in = 1'b1;
  #10us;
end

endmodule
