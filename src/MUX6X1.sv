//`timescale 1ns / 1ps

module MUX6X1(
              input logic [7:0]d0, d1, d2, d3, d4, d5,
              input logic [2:0]s,
              output logic [7:0]y
              );
        assign y = s[2] ? (s[1] ? (s[0] ? 0:0):(s[0] ? d5:d4)):(s[1] ? (s[0] ? d3:d2):(s[0] ? d1:d0));
endmodule
