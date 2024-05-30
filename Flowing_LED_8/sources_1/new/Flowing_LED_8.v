`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/11/02 21:08:05
// Design Name: 
// Module Name: Flowing_LED_8
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


module Flowing_LED_8(
    input clk,
    input rstn,
    output [7:0]led
    );
    
    reg [23:0]count;  // 计数，用来分频
    reg [7:0]ledtemp;
    
    always @(posedge clk or negedge rstn) begin
        if(!rstn) begin
            count <= 1'b0;
            ledtemp <= 8'b00000001;     // 如果置零端为0，则将计算置为0，同时让led灯回到初始状态
        end
        else begin
            count = count + 1'b1;
            if(count == 24'hffffff) begin   //分频功能---只有当计数达到2^24时，才会进行移位
                if(ledtemp == 8'b10000000) begin
                    ledtemp <= 8'b00000001;   // 如果到达10000000的状态，则重新返回初态
                end
                else begin
                    ledtemp <= ledtemp << 1;   // 让流水灯左移
                end
            end
        end
    end
    assign led = ledtemp;
endmodule