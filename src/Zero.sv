//`timescale 1ns / 1ps


module Zero(input logic [7:0]A,
            output logic C);
    always_comb begin
        if (A == 8'b00000000)
            C = 1;
        else
            C = 0;
    end
    
endmodule
