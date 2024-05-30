`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/11/03 14:33:29
// Design Name: 
// Module Name: JK
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


module JK(          // JK触发器
    input clk,
    input reset,
    input set,
    input J,
    input K,
    output reg Q
    );
    always @(posedge clk or negedge reset or negedge set) begin
        if(reset == 1'b0)    // 异步清零
            begin
            Q <= 1'b0; 
            end
        else if(set == 1'b0)   // 异步置位
            begin
                Q <= 1'b1; 
            end
        else if(J == 1'b0 && K == 1'b0)
            begin
                Q <= Q;
            end
        else if(J == 1'b0 && K == 1'b1)
            begin
                Q <= 0;
            end            
        else if(J == 1'b1 && K == 1'b0)
            begin
                Q <= 1;
            end
        else
            begin
                Q <= ~Q;
            end
    end
endmodule
