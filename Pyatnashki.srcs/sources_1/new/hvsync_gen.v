`timescale 1ns / 1ps
module hvsync_generator(
  input clk,
  output reg hsync, vsync,
  output wire display_on,
  output reg [10:0] hpos,
  output reg [10:0] vpos);
    initial
    begin
    vpos=0;
    hpos=0;
    hpos=0;
    vpos=0;
    end
  // declarations for TV-simulator sync parameters
  // horizontal constants
  parameter H_DISPLAY       = 800; // horizontal display width
  parameter H_BACK          =  64; // horizontal left border (back porch)
  parameter H_FRONT         =  56; // horizontal right border (front porch)
  parameter H_SYNC          =  120; // horizontal sync width
  // vertical constants
  parameter V_DISPLAY       = 600; // vertical display height
  parameter V_TOP           =  23; // vertical top border
  parameter V_BOTTOM        =  37; // vertical bottom border
  parameter V_SYNC          =   6; // vertical sync # lines
  // derived constants
  parameter H_SYNC_START    = H_DISPLAY + H_FRONT;
  parameter H_SYNC_END      = H_DISPLAY + H_FRONT + H_SYNC - 1;
  parameter H_MAX           = H_DISPLAY + H_BACK + H_FRONT + H_SYNC - 1;
  parameter V_SYNC_START    = V_DISPLAY + V_BOTTOM;
  parameter V_SYNC_END      = V_DISPLAY + V_BOTTOM + V_SYNC - 1;
  parameter V_MAX           = V_DISPLAY + V_TOP + V_BOTTOM + V_SYNC - 1;

  wire hmaxxed = (hpos == H_MAX);	// set when hpos is maximum
  wire vmaxxed = (vpos == V_MAX);	// set when vpos is maximum
  
  // horizontal position counter
  always @(posedge clk)
  begin
    hsync <= (hpos>=H_SYNC_START && hpos<=H_SYNC_END);
    if(hmaxxed)
      hpos <= 0;
    else
      hpos <= hpos + 1;
  end

  // vertical position counter
  always @(posedge clk)
  begin
    vsync <= (vpos>=V_SYNC_START && vpos<=V_SYNC_END);
    if(hmaxxed)
      if (vmaxxed)
        vpos <= 0;
      else
        vpos <= vpos + 1;
   
  end
  
  // display_on is set when beam is in "safe" visible frame
  assign display_on = (hpos<H_DISPLAY) && (vpos<V_DISPLAY);

endmodule   