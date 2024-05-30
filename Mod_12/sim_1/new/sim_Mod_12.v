`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/11/03 11:04:54
// Design Name: 
// Module Name: sim_Mod_12
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


module sim_Mod_12( );
    reg clk, reset;
    wire [3:0]led;
    initial
        begin
            clk = 1'b0;
            reset = 1'b0;
            #20
            reset = 1'b1;
        end
    always #10 clk = ~clk;
    Mod_12 u(clk,reset,led);
endmodule
