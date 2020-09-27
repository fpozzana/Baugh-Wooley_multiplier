module bw_multiplier #(integer numBit = 4)
(
  input logic [numBit-1:0]      m_in,
  input logic [numBit-1:0]      n_in,
  output logic [2*numBit-1:0]   o_out
);

//support signals
//logic [2*numBit-1:0] [numBit-1:0] support_matrix;
logic [numBit-1:0] [2*numBit-1:0] support_matrix;
logic [numBit-1:0] carry_vector;
logic [numBit-1:0] sum_vector;

//generate nested loop
genvar i;
genvar j;

generate
    for(i = 0; i < numBit; i = i + 1)
    begin
      for(j = 0; j < numBit; j = j + 1)
      begin
        if(j == numBit-1 & i == numBit-1)
          and_bw_block u0 (.a_in(n_in[numBit-1]), .b_in(m_in[numBit-1]), .c_in(1'b0), .s_in(1'b0), .s_out(support_matrix[i][2*j]), .c_out(support_matrix[i][2*j+1]));
        else if(j == numBit-1)
          nand_bw_block v0 (.a_in(n_in[i]), .b_in(m_in[numBit-1]), .c_in(1'b0), .s_in(1'b0), .s_out(support_matrix[i][2*j]), .c_out(support_matrix[i][2*j+1]));
        else if(i == numBit-1)
          nand_bw_block w0 (.a_in(n_in[numBit-1]), .b_in(m_in[j]), .c_in(support_matrix[i-1][2*j+1]), .s_in(support_matrix[i-1][2*j+2]), .s_out(support_matrix[i][2*j]), .c_out(support_matrix[i][2*j+1]));
        else if(i == 0)
          if(j == numBit-1)
            nand_bw_block w0 (.a_in(n_in[0]), .b_in(m_in[numBit-1]), .c_in(1'b0), .s_in(1'b0), .s_out(support_matrix[i][2*j]), .c_out(support_matrix[i][2*j+1]));
          else
            and_bw_block u0 (.a_in(n_in[0]), .b_in(m_in[j]), .c_in(1'b0), .s_in(1'b0), .s_out(support_matrix[i][2*j]), .c_out(support_matrix[i][2*j+1]));
        else
          and_bw_block z0 (.a_in(n_in[i]), .b_in(m_in[j]), .c_in(support_matrix[i-1][2*j+1]), .s_in(support_matrix[i-1][2*j+2]), .s_out(support_matrix[i][2*j]), .c_out(support_matrix[i][2*j+1]));
      end
    end
endgenerate

//generate last full adder row
genvar t;

generate
    for(t = 0; t < numBit; t = t + 1)
    begin
      if(t == 0)
        full_adder f0 (.a_in(1'b1), .b_in(support_matrix[numBit-1][2*t+1]), .c_in(support_matrix[numBit-1][2*t+2]), .s_out(sum_vector[t]), .c_out(carry_vector[t]));
      else if(t == numBit-1)
        full_adder f0 (.a_in(carry_vector[t-1]), .b_in(support_matrix[numBit-1][2*t+1]), .c_in(1'b1), .s_out(sum_vector[t]), .c_out(carry_vector[t]));
      else
        full_adder f0 (.a_in(carry_vector[t-1]), .b_in(support_matrix[numBit-1][2*t+1]), .c_in(support_matrix[numBit-1][2*t+2]), .s_out(sum_vector[t]), .c_out(carry_vector[t]));
    end
endgenerate

//generate output assignment
genvar f;

generate
    for(f = 0; f < 2*numBit; f = f + 1)
    begin
      if(f < numBit)
        assign o_out[f] = support_matrix[f][0];
      else
        assign o_out[f] = sum_vector[f-numBit];
    end

endgenerate

endmodule
