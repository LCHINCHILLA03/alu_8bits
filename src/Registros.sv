//`timescale 1ns / 1ps

module Registros(
  input  logic        clk,
  input  logic        rst,
  input  logic        btn_load,     // botón de avance
  input  logic [8:0]  sw1,           // sw[7:0] = datos, sw[8] = A/B
  output logic [7:0] reg_a,
  output logic [7:0] reg_b
  );
  
  always_ff @(posedge clk or posedge rst) begin
    if (rst) begin
      reg_a <= 8'd0;
      reg_b <= 8'd0;
    end else if (btn_load) begin
      if (sw1[8] == 1'b0)
        reg_a <= sw1[7:0];
      else
        reg_b <= sw1[7:0];
    end
  end
endmodule
