//`timescale 1ns / 1ps

 module full_adder(input logic a, b, cin,
        output logic s, cout);
        logic p, g;     // internal nodes
        assign p = a ^ b;
        assign g = a & b;
        assign s = p ^ cin; 
        assign cout = g | (p & cin);
 endmodule
