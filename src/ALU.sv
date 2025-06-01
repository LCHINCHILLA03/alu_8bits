
module ALU(
           input logic [7:0]A, B,
           input logic [3:0]Shift,
           input logic [2:0]S,
           output logic [7:0]Y, ANDD, ORR,
           output logic Cero, Carry, Overflow
           );
           logic [7:0]ymux21;
           logic [7:0]ysum;
           logic Cout;
           logic S0;
           assign S0 = ~(S[2] ^ ~S[0]) & S[0];
           logic [7:0]yASL;
           logic [7:0]yASR;
           logic yzero;
           MUX2X1 MUX2(B, ~B, S0,ymux21);
           carry_lookahead_adder Sumador1(.i_add1(A), .i_add2(ymux21), .carry(S0), .o_result(ysum), .cout(Cout));
           Shift_Left ShiftLeft(.A(ysum), .Shift(Shift), .ASL(yASL));
           Shift_Right ShiftRight(.A(ysum), .Shift(Shift), .ASL(yASR));
           assign ANDD = A & B;
           assign ORR = A | B;
           Zero Zero1(.A(ysum), .C(yzero));
           MUX6X1 MUX6(.d0(ysum), .d1(ysum) ,.d2(ANDD), .d3(ORR), .d4(yASL), .d5(yASR), .s(S), .y(Y));
           assign Cero = yzero;
           assign Carry = ~S[0] & Cout;
           assign Overflow = (ysum[7] ^ A[7]) & ~(B[7] ^ A[7] ^ S0) & ~S[0] ;
endmodule
