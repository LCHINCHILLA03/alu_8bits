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
    logic [7:0] Y, ANDD, ORR;
    logic carry, cero, overflow;
    Registros bits_entrada(.clk(clk_1), .rst(rst_n), .btn_load(ena), .sw1({uio_in[0],ui_in[7:0]}), .reg_a(a), .reg_b(b));
    ALU ALU(.A(a), .B(b), .Shift(uio_in[4:1]), .S(uio_in[7:5]), .Y(uo_out[7:0]), .ANDD(ANDD), .ORR(ORR), .Cero(cero), .Carry(carry), .Overflow(overflow));
    flag_display flag(.clk(clk), .rst(btnU), .zero(cero), .carry(carry), .overflow(overflow),.an(sio_oe[3:0]), .seg(uio_out[6:0]));
endmodule
