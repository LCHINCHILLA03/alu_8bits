`timescale 1ns / 1ps


module flag_display(
    input  logic clk,           // Reloj de 100 MHz de la Basys 3
    input  logic rst,           // Botón de reset
    input  logic zero,          // Señal de la ALU
    input  logic carry,
    input  logic overflow,
    output logic [3:0] an,      // Anodos del display
    output logic [6:0] seg      // Segmentos del display
);

    // === Paso 1: Codificar los flags a dígitos ===
    logic [3:0] d0, d1, d2, d3;

    assign d0 = zero     ? 4'd1 : 4'd0;
    assign d1 = carry    ? 4'd1 : 4'd0;
    assign d2 = overflow ? 4'd1 : 4'd0;
    assign d3 = 4'd15;  // Muestra 'F' o puede ser 0 para dejarlo apagado

    // === Paso 2: Multiplexar y mostrar ===
    display_driver display (
        .clk(clk),
        .rst(rst),
        .d0(d0), .d1(d1), .d2(d2), .d3(d3),
        .an(an),
        .seg(seg)
    );

endmodule
