//`timescale 1ns / 1ps


module display_driver (
    input  logic clk,
    input  logic rst,
    input  logic [3:0] d0, d1, d2, d3,
    output logic [3:0] an,
    output logic [6:0] seg
    );

    logic [1:0] sel;
    logic [3:0] current_digit;
    logic [15:0] clkdiv;

    always_ff @(posedge clk or posedge rst) begin
        if (rst) clkdiv <= 0;
        else     clkdiv <= clkdiv + 1;
    end

    assign sel = clkdiv[15:14];

    always_comb begin
        case (sel)
            2'b00: begin an = 4'b1110; current_digit = d0; end
            2'b01: begin an = 4'b1101; current_digit = d1; end
            2'b10: begin an = 4'b1011; current_digit = d2; end
            2'b11: begin an = 4'b0111; current_digit = d3; end
        endcase
    end

    hex_to_7seg decoder (
        .hex(current_digit),
        .seg(seg)
    );

endmodule

