`timescale 1ns / 1ps
module top(
    input clk_old,
    input PS2_CLK,
    input PS2_DATA,
    output hsync, vsync,
    output [2:0] rgb
    );
    wire clk;
    wire reset,set;
    wire set_enable,reset_enable;
    reg [2:0] i=0;
    reg [2:0] iTemp=1;
    reg setPressed=0;

    clk_div div(.clk(clk_old), .new_clk(clk)); 
    keyboard keyboard(.PS2_CLK(PS2_CLK),.PS2_DATA(PS2_DATA), .CLK(clk),.reset(reset),.set(set));
    bounce set(.clk(clk),.in_s(set),.clock_en(0'b1),.out_signal_en(set_enable));
    bounce reset(.clk(clk),.in_s(reset),.clock_en(0'b1),.out_signal_en(reset_enable));
    vgaa vgaaaa(.clk(clk_old),.hsync(hsync),.i(i),.vsync(vsync),.rgb(rgb));
    always@(posedge clk)
        begin
            if(set_enable)
                begin
                    if(setPressed==0)
                        begin
                            setPressed<=1;
                            i<=iTemp;
                        end
                end
            if(reset_enable)
                begin
                    setPressed<=0;
                    i<=0;
                    iTemp<=1;
                end
            if(iTemp!=7)
                iTemp<=iTemp+1;
            else
                iTemp<=1;            
        end
endmodule
