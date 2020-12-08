`timescale 1 ns/10 ps  // time-unit = 1 ns, precision = 10 ps

module tb_bw_multiplier_s;

parameter numBit = 8;

logic [numBit-1:0] m_in, n_in;
logic [2*numBit-1:0] o_out;

bw_multiplier_s #(numBit) DUT (.m_in(m_in), .n_in(n_in), .o_out(o_out));

/*
initial
begin
  m_in = 4'b0000;
  n_in = 4'b0001;
  #10us;
  m_in = 4'b0111;
  n_in = 4'b0111;
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
*/
integer i;
integer j;

initial begin
  n_in = {numBit{1'b0}};
  m_in = {numBit{1'b0}};
  for(int i = 0; i < 2**numBit-1; i++)
  begin
    for(int i = 0; i < 2**numBit-1; i++)
    begin
      #10us;
      //$display("Decimal converted to signed n %d", $signed(n_in));
      //$display("Decimal converted to signed m %d", $signed(m_in));
      //$display("Decimal converted to signed o %d", $signed(o_out));
      if($signed(o_out) != $signed(n_in) * $signed(m_in))
      begin
        $display("Fail");
      end
      n_in = n_in + 1;
    end
    m_in = m_in + 1;
  end
end

endmodule
