`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/11/03 14:35:12
// Design Name: 
// Module Name: sim_JK
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


module sim_JK( );
    reg clk, reset, set, J, K;
    wire Q;
    initial
        begin
            clk <= 1'b0;
            set <= 1'b1;
            J <= 1'b0;
            K <= 1'b0;
            reset = 1'b0;
            #20 
            reset = 1'b1;
        end
    always #10 clk = ~clk;
    always #20 {J,K} = {J,K} + 1'b1;
    always #400 set = set + 1'b1;
    JK u(clk,reset,set,J,K,Q);
endmodule
