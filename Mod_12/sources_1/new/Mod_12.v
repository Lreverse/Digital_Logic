`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/11/02 22:33:37
// Design Name: 
// Module Name: Mod_12
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


module Mod_12(
    input clk,
    input reset,
    output [3:0]Q
    );
    JK_0 u0(clk,reset,1'b1,1'b1,1'b1,Q[0]);
    JK_0 u1(clk,reset,1'b1,Q[0],Q[0],Q[1]);
    JK_0 u2(clk,reset,1'b1,(~Q[3])&Q[1]&Q[0],Q[1]&Q[0],Q[2]);
    JK_0 u3(clk,reset,1'b1,Q[2]&Q[1]&Q[0],Q[1]&Q[0],Q[3]);
endmodule