`timescale 1ns / 1ps

module counter # (step = 1, mod = 8) (
    input reset,
    input clk,
    output reg [2:0] qout
);

initial
    qout = 0;

always @ (posedge clk)
    if (reset == 1)
        qout <= 0;
    else
        qout <= (qout + step) % mod;

endmodule
