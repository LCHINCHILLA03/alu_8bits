//`timescale 1ns / 1ps

module tt_um_alu(
               input clk,
               input rst_n,
               input ena,
               input [7:0] ui_in,
               input [7:0] uio_in,
               output [7:0] uo_out,
               output [7:0] uio_out,
               output [7:0] uio_oe
               );
               
    logic clk_1;
    clck_psc clck_psc(.clk(clk), .clk_scaled(clk_1));
    logic [7:0]a;
    logic [7:0]b;
    logic [6:0]out1;
    logic [3:0]out2;
    logic carry, cero, overflow;
    Registros bits_entrada(.clk(clk_1), .rst(rst_n), .btn_load(ena), .sw1({uio_in[0],ui_in[7:0]}), .reg_a(a), .reg_b(b));
  ALU ALU(.A(a), .B(b), .Shift(uio_in[4:1]), .S(uio_in[7:5]), .Y(uo_out[7:0]), .ANDD(uio_out[7:0]), .ORR(uio_oe[7:0]), .Cero(cero), .Carry(carry), .Overflow(overflow));
  flag_display flag(.clk(clk), .rst(rst_n), .zero(cero), .carry(carry), .overflow(overflow),.an(out2[3:0]), .seg(out1[6:0]));
endmodule
