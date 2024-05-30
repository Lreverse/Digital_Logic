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
    
    reg [23:0]count;  // ������������Ƶ
    reg [7:0]ledtemp;
    
    always @(posedge clk or negedge rstn) begin
        if(!rstn) begin
            count <= 1'b0;
            ledtemp <= 8'b00000001;     // ��������Ϊ0���򽫼�����Ϊ0��ͬʱ��led�ƻص���ʼ״̬
        end
        else begin
            count = count + 1'b1;
            if(count == 24'hffffff) begin   //��Ƶ����---ֻ�е������ﵽ2^24ʱ���Ż������λ
                if(ledtemp == 8'b10000000) begin
                    ledtemp <= 8'b00000001;   // �������10000000��״̬�������·��س�̬
                end
                else begin
                    ledtemp <= ledtemp << 1;   // ����ˮ������
                end
            end
        end
    end
    assign led = ledtemp;
endmodule