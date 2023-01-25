`timescale 1ns / 1ps

module sync(
    input clk,
    input in,
    output out
);

wire w0, w1;

D_trig first(.clk(clk), .in(in), .en(0'b1), .out(w0));
D_trig second(.clk(clk),. in(w0), .en(0'b1),.out(w1));

assign out = in;

endmodule
