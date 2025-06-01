//`timescale 1ns / 1ps


module Registro_Salida(
                       input logic [7:0]registro_a,           // registro para bits de a
                       input logic selector_bloque,           // 00 -> bloque 1 (bits 31:24) 01 -> bloque 2 (bits 23:16) 10 -> bloque 3 (bits 15:8) 11 -> bloque 4 (bits 7:0)
                       output logic [7:0]valor_16_bits    // registro de bits para bus a
                       );
    always_comb begin
        case (selector_bloque)
            1'b0: begin
                 valor_16_bits = registro_a[7:0];
            end
            1'b1: begin
                valor_16_bits = registro_a[7:0];
            end
        endcase
    end
endmodule
