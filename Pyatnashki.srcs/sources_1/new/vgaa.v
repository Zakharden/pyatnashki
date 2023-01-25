 module vgaa(
  input clk,
  input [2:0] i,
  output hsync, vsync,
  output [2:0] rgb
  );
  wire display_on;
  wire [10:0] hpos;
  wire [10:0] vpos;
  reg clkNew;
  reg main_gfx;  
  initial
  clkNew=0;
  always@(posedge clk)
  begin
  clkNew<=~clkNew;
    case (vpos[9:2])//Сколько пикселей по вертикали отводится на 1 строку(2=>нам надо 4 строки по 2 бита, чтобы отобразить 1 строку)
          1,2:
            if(hpos[10:4]>12 &&hpos[10:4]<25) main_gfx<=0;
      else main_gfx<=0;
   //   4,5,6,7: main_gfx <= score_gfx;
      9,10:
        if(hpos[10:4]>12 &&hpos[10:4]<25) main_gfx<=1;
      else main_gfx<=0;
    12,13,14,15: main_gfx <= score_gfx;
    16,17,18,19: main_gfx <= score_gfx;
   20,21,22,23: main_gfx <= score_gfx;
    24,25,26,27: main_gfx <= score_gfx;
    28,29,30,31: main_gfx <= score_gfx;
    32,33,34,35: main_gfx <= score_gfx;
    36,37,38,39: main_gfx <= score_gfx;
    40,41,42,43: main_gfx <= score_gfx;
    44,45,46,47: main_gfx <= score_gfx;  
      49,50:if(hpos[10:4]>12 &&hpos[10:4]<25) main_gfx<=1;
      else main_gfx<=0;
        default: main_gfx <=0;
      endcase
  end
   hvsync_generator hvsync_gen(.clk(clkNew),.hsync(hsync),.vsync(vsync),.display_on(display_on),.hpos(hpos),.vpos(vpos));
   wire score_gfx;  
   wire [2:0]colors;
   scoreboard figure_gen(.clk(clkNew),.vpos(vpos),.hpos(hpos),.board_gfx(score_gfx),.colors(colors),.i(i));


   wire r = display_on && (main_gfx) && colors[2];
   wire g = display_on && (main_gfx) && colors[1];
   wire b = display_on && (main_gfx) && colors[0];
   assign rgb = {r,g,b};

endmodule