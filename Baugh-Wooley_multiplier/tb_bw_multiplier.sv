`timescale 1 ns/10 ps  // time-unit = 1 ns, precision = 10 ps

module tb_bw_multiplier;

parameter numBit = 4;

logic [numBit-1:0] m_in, n_in;
logic [2*numBit-1:0] o_out;

bw_multiplier #(4) DUT (.m_in(m_in), .n_in(n_in), .o_out(o_out));

initial
begin
  m_in = 4'b0000;
  n_in = 4'b0001;
  #10us;
  m_in = 4'b0101;
  n_in = 4'b1010;
  #10us;
  m_in = 4'b0000;
  n_in = 4'b0001;
  #10us;
  m_in = 4'b0001;
  n_in = 4'b0000;
  #10us;
  m_in = 4'b0011;
  n_in = 4'b0110;
  #10us;
end

endmodule
