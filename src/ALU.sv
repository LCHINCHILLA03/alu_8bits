
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
           carry_lookahead_adder Sumador1(A, ymux21, S0, ysum, Cout);
           Shift_Left ShiftLeft(ysum, Shift, yASL);
           Shift_Right ShiftRight(ysum, Shift, yASR);
           assign ANDD = A & B;
           assign ORR = A | B;
           Zero Zero1(ysum, yzero);
           MUX6X1 MUX6(ysum, ysum ,ANDD, ORR, yASL, yASR, S, Y);
           assign Cero = yzero;
           assign Carry = ~S[0] & Cout;
           assign Overflow = (ysum[7] ^ A[7]) & ~(B[7] ^ A[7] ^ S0) & ~S[0] ;
endmodule
