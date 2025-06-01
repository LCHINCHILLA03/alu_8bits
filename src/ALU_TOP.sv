`timescale 1ns / 1ps

module tt_um_alu(
               input logic clk,
               input logic btnC, btnU,
               input logic [15:0] sw,
               output logic [7:0] led,
               output logic [3:0] an,
               output logic [6:0] seg
               );
               
    logic clk_1;
    clck_psc clck_psc(.clk(clk), .clk_scaled(clk_1));
    logic [7:0]a;
    logic [7:0]b;
    logic [7:0] Y, ANDD, ORR;
    logic carry, cero, overflow;
    Registros bits_entrada(.clk(clk_1), .rst(btnU), .btn_load(btnC), .sw1(sw[8:0]), .reg_a(a), .reg_b(b));
    ALU ALU(.A(a), .B(b), .Shift(sw[15:12]), .S(sw[11:9]), .Y(led[7:0]), .ANDD(ANDD), .ORR(ORR), .Cero(cero), .Carry(carry), .Overflow(overflow));
    flag_display flag(.clk(clk), .rst(btnU), .zero(cero), .carry(carry), .overflow(overflow),.an(an[3:0]), .seg(seg[6:0]));
endmodule
