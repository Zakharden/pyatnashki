`timescale 1ns / 1ps

module D_trig(
    input clk,
    input in,
    input en,
    output out
);

reg w0, w1, w2, w3, wclk;

initial begin
    wclk = 0'b1;
    w0 = 1;
    w1 = 1;
    w2 = 0;
    w3 = 1;
end

always @(posedge clk) begin
    if (en == 1) begin
        w3 = !(in && w2);
        w2 = !(!in && w3);
    end
end

assign out = w2;

endmodule
