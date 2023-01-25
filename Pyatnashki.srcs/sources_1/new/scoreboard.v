`timescale 1ns / 1ps
module scoreboard(
  input [10:0] vpos,
  input [10:0] hpos,
  input clk,
  input [2:0] i,
  output reg [2:0]colors,
  output board_gfx
); 
  reg [5:0] score_digit;
  wire [7:0] score_bits;
  reg [63:0] array[7:0];
  initial
    begin
      array[0]=64'h000000000000000;
      array[1]=64'h6789ab0fc12345ed;
      array[2]=64'habc123789def4506;
      array[3]=64'h7968abfedc543210;
      array[4]=64'habcdef5678943210;
      array[5]=64'h56789abcdef01345;
      array[6]=64'h543210fbacde6789;
      array[7]=64'hfedcba9876543210;
    end
  //cоздать двумерный массив
  always @(posedge clk)
    begin
      array[0]<=64'h000000000000000;
      array[1]<=64'h6789ab0fc12345ed;
      array[2]<=64'habc123789def4506;
      array[3]<=64'h7968abfedc543210;
      array[4]<=64'habcdef5678943210;
      array[5]<=64'h56789abcdef01345;
      array[6]<=64'h543210fbacde6789;
      array[7]<=64'hfedcba9876543210;
      case (hpos[10:4])//—колько пикселей по горизонтали отводится на 1 символ
        
        13:    
        begin
          score_digit <=32;
          colors[2]<=1;
          colors[1]<=1;
          colors[0]<=1;
        end
        14:
        begin
           score_digit <=28;
           colors[2]<=1;
          colors[1]<=1;
          colors[0]<=1;
        end
           
        
        16: 
          begin
            case (vpos [9:2])
              12,13,14,15: if(array[i][63:60]==0) score_digit<=28; else score_digit<={2'b0,array[i][63:60]};
              20,21,22,23: if(array[i][47:44]==0) score_digit<=28; else score_digit<={2'b0,array[i][47:44]};
              28,29,30,31: if(array[i][31:28]==0) score_digit<=28; else score_digit<={2'b0,array[i][31:28]};
              36,37,38,39: if(array[i][15:12]==0) score_digit<=28; else score_digit<={2'b0,array[i][15:12]};
              44,45,46,47: score_digit<=35;
              default:score_digit<=23;
            endcase
          end
        18: 
          begin
            case (vpos [9:2])
              12,13,14,15: if(array[i][59:56]==0) score_digit<=28; else score_digit<={2'b0,array[i][59:56]};
              20,21,22,23: if(array[i][43:40]==0) score_digit<=28; else score_digit<={2'b0,array[i][43:40]};
              28,29,30,31: if(array[i][27:24]==0) score_digit<=28; else score_digit<={2'b0,array[i][27:24]};
              36,37,38,39: if(array[i][11:8]==0) score_digit<=28; else score_digit<={2'b0,array[i][11:8]};
              44,45,46,47: score_digit<=35;
              default:score_digit<=23;
            endcase
          end
        20: 
          begin
            case (vpos [9:2])
              12,13,14,15: if(array[i][55:52]==0) score_digit<=28; else score_digit<={2'b0,array[i][55:52]};
              20,21,22,23: if(array[i][39:36]==0) score_digit<=28; else score_digit<={2'b0,array[i][39:36]};
              28,29,30,31: if(array[i][23:20]==0) score_digit<=28; else score_digit<={2'b0,array[i][23:20]};
              36,37,38,39: if(array[i][7:4]==0) score_digit<=28; else score_digit<={2'b0,array[i][7:4]};
              44,45,46,47: score_digit<=35;
              default:score_digit<=23;
            endcase
          end
        22: 
          begin
            case (vpos [9:2])
              12,13,14,15: if(array[i][51:48]==0) score_digit<=28; else score_digit<={2'b0,array[i][51:48]};
              20,21,22,23: if(array[i][35:32]==0) score_digit<=28; else score_digit<={2'b0,array[i][35:32]};
              28,29,30,31: if(array[i][19:16]==0) score_digit<=28; else score_digit<={2'b0,array[i][19:16]};
              36,37,38,39: if(array[i][3:0]==0) score_digit<=28; else score_digit<={2'b0,array[i][3:0]};
              44,45,46,47: score_digit<=35;
              default:score_digit<=23;
            endcase
          end
        23:
        begin
           score_digit <=28;
          colors[2]<=1;colors[1]<=1;colors[0]<=1;
        end
           
        24:score_digit <= 33;

        default: score_digit <= 23;
      endcase
    end
  digits10_case digits(.clk(clk),.digit(score_digit),.yofs(vpos[3:1]),.bits(score_bits));//сколько пикселей будет занимать пикслель символа по вертикали
  assign board_gfx = score_bits[hpos[3:1]^ 3'b111];//—колько пикслей будет занимать один пиксел изображени¤(горизонтальный)2
  
endmodule