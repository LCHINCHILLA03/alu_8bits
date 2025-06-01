//`timescale 1ns / 1ps


module clck_psc(
                input logic clk,
                output logic clk_scaled
                );
                logic [31:0] myreg;
                always @(posedge clk)
                    myreg <= myreg + 1;
                    assign clk_scaled = myreg[26];
endmodule
