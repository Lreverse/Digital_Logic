`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/11/02 21:51:23
// Design Name: 
// Module Name: sim_flowing_8
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


module sim_flowing_8( );
    reg clk, rstn;
    wire [7:0]led;
    initial
        begin
            clk = 1'b0;
            rstn = 1'b0;
            # 200
            rstn = 1'b1;
        end
     always #10 clk = ~clk;
     Flowing_LED_8 u(clk, rstn, led);
endmodule
