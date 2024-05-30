`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/11/20 17:03:40
// Design Name: 
// Module Name: Digital_Tug_of_War
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module Digital_Tug_of_War(
    input clk,
    input S,
    input F1,
    input F2,
    input L,
    input R,
    output [14:0]led,
    output k_L,          // 片选信号
    output k_R,
    output [6:0]tube_L,  // 段选信号
    output [6:0]tube_R
    );
    
    reg [3:0]count;
    reg [14:0]ledtemp;
    wire L_pos, R_pos;

    key_input d1(clk,~F1,L,L_pos);
    key_input d2(clk,~F1,R,R_pos);
  
    always @(posedge clk or posedge F1 or negedge F2)
        begin
            if(F1 == 1 || F2 == 0) begin
                ledtemp <= 15'b000000010000000;
                count <= 4'h8;
                end
            else if((S == 1) && (count != 4'hf) && (count != 4'h1)) begin
                if(L_pos == 1) begin
                    count <= count + 4'h1;
                    end
                if(R_pos == 1) begin
                    count <= count - 4'h1;
                    end
                end
            case(count)
                4'h1: ledtemp <= 15'b000000000000001;
                4'h2: ledtemp <= 15'b000000000000010;
                4'h3: ledtemp <= 15'b000000000000100;
                4'h4: ledtemp <= 15'b000000000001000;
                4'h5: ledtemp <= 15'b000000000010000;
                4'h6: ledtemp <= 15'b000000000100000;
                4'h7: ledtemp <= 15'b000000001000000;
                4'h8: ledtemp <= 15'b000000010000000;
                4'h9: ledtemp <= 15'b000000100000000;
                4'ha: ledtemp <= 15'b000001000000000;
                4'hb: ledtemp <= 15'b000010000000000;
                4'hc: ledtemp <= 15'b000100000000000;
                4'hd: ledtemp <= 15'b001000000000000;
                4'he: ledtemp <= 15'b010000000000000;
                4'hf: ledtemp <= 15'b100000000000000;
                default: ;
            endcase
        end
         
    assign led = ledtemp;

         
    reg [1:0]score_L;
    reg [1:0]score_R;

    always @(posedge clk or negedge F2)
        begin
            if(!F2) begin
                score_L <= 2'b00;
                score_R <= 2'b00;
                end
            else if(count == 4'he && L_pos == 1) begin
                score_L <= score_L + 1'b1;   // 若是左移到尽头，则score_L+1，代表左边获胜一局
                end
            else if(count == 4'h2 && R_pos == 1) begin
                score_R <= score_R + 1'b1;   // 若是右移到尽头，则score_R+1，代表右边获胜一局
                end
         end

     score_cnt s1(clk,F2,score_L,k_L,tube_L);
     score_cnt s2(clk,F2,score_R,k_R,tube_R);

endmodule


module key_input(  // 边沿检测+消除抖动模块
    input clk,
    input rstn,
    input key,
    output key_pulse
    );
    reg pre, p;
    wire  key_pos;
    always @(posedge clk or negedge rstn)
        begin
            if(!rstn) begin
                pre <= 1'b0;
                p <= 1'b0;
                end
            else begin
                pre <= p;
                p <= key;
                end
        end
        
    assign key_pos = (~pre) & p;  // 获得按键的上升沿
    
    reg [19:0]cnt;
    reg key_pre, key_p;
    always @(posedge clk or negedge rstn)  // 计数
        begin
            if(!rstn) begin
                cnt <= 20'h0;
                end
            else if(key_pos) begin    // 一旦检测到上升沿，就将计数器置0
                cnt <= 20'h0;
                end
            else begin
                cnt <= cnt + 1'h1;    // 否则就开始计数
                end
        end
    
    always @(posedge clk or negedge rstn)
        begin
            if(!rstn) begin
                key_pre <= 1'b0;
                key_p <= 1'b0;
                end
            else if(cnt == 20'hf4240) begin  // 计满10ms时才读入信号(20'hf4240)
                key_p <= key;
                key_pre <= key_p;
                end
            else begin
                key_pre <= key_p;
                end
        end
        
     assign key_pulse = (~key_pre) & key_p;  
endmodule


module score_cnt(  //  计分模块
    input clk,
    input rstn,
    input [1:0]score,
    output k,
    output reg [6:0]tube
    );
    
    assign k = 1;    // 片选信号（高电平有效）
    always @(posedge clk)
    begin
        case(score)    // 共阴极
            2'b00: tube <= 7'b0111111;  // 0
            2'b01: tube <= 7'b1001111;  // 3
            2'b10: tube <= 7'b1111101;  // 6
            2'b11: tube <= 7'b1101111;  // 9
            default: tube <= 1110110;  // H
        endcase
    end
endmodule

