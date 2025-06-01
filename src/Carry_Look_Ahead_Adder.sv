//`timescale 1ns / 1ps

module carry_lookahead_adder
  #(parameter bits = 8)
  (
   input [bits-1:0] i_add1,
   input [bits-1:0] i_add2,
   input carry,
   output [bits-1:0]  o_result,
   output cout
   );
     
  wire [bits:0]     w_C;
  wire [bits-1:0]   w_G, w_P, w_SUM, dummy_cout;;
 
  // Create the Full Adders
  genvar ii;
  generate
    for (ii=0; ii<bits; ii=ii+1) 
      begin
        full_adder full_adder_inst
            ( 
              .a(i_add1[ii]),
              .b(i_add2[ii]),
              .cin(w_C[ii]),
              .s(w_SUM[ii]),
              .cout(dummy_cout[ii])
              );
      end
  endgenerate
 
  // Create the Generate (G) Terms:  Gi=Ai*Bi
  // Create the Propagate Terms: Pi=Ai+Bi
  // Create the Carry Terms:
  genvar             jj;
  generate
    for (jj=0; jj<bits; jj=jj+1) 
      begin
        assign w_G[jj]   = i_add1[jj] & i_add2[jj];
        assign w_P[jj]   = i_add1[jj] | i_add2[jj];
        assign w_C[jj+1] = w_G[jj] | (w_P[jj] & w_C[jj]);
      end
  endgenerate
   
  assign w_C[0] = carry; // no carry input on first adder
 
  assign o_result = w_SUM;   // Verilog Concatenation
  assign cout = w_C[bits];
 
endmodule
