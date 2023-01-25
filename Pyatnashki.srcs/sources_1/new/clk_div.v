`timescale 1ns / 1ps

module clk_div
#(
	parameter CNT_WDT = 17,
	parameter DIVIDER = 100000
)
(
    input clk, rst,
    output reg new_clk
);
    
reg [CNT_WDT-1:0] cnt;

always@ (posedge clk, posedge rst)
	if(rst) begin
		cnt <= 0;
		new_clk <= 1'b0;
	end
	else if(cnt == DIVIDER-1) begin
		cnt <= 0;
		new_clk <= 1'b1;
	end
	else begin
		cnt <= cnt + 1'b1;
		new_clk <= 1'b0;
	end
    
endmodule
