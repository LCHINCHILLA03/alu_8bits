//`timescale 1ns / 1ps

module Shift_Left(
                   input logic [7:0]A,
                   input logic [3:0]Shift,
                   output logic [7:0]ASL
                   );
        always @ (A, Shift) begin
            case (Shift)
                4'b0001 : ASL = A << 1;
                4'b0010 : ASL = A << 2;
                4'b0011 : ASL = A << 3;
                4'b0100 : ASL = A << 4;
                4'b0101 : ASL = A << 5;
                4'b0110 : ASL = A << 6;
                4'b0111 : ASL = A << 7;
                4'b1000 : ASL = A << 8;
                4'b1001 : ASL = A << 9;
                4'b1010 : ASL = A << 10;
                4'b1011 : ASL = A << 11;
                4'b1100 : ASL = A << 12;
                4'b1101 : ASL = A << 13;
                4'b1110 : ASL = A << 14;
                4'b1111 : ASL = A << 15;
                default : ASL = A;
            endcase
        end

endmodule
