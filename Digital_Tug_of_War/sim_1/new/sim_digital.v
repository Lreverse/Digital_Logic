`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/11/20 17:54:03
// Design Name: 
// Module Name: sim_digital
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


module sim_digital( );
    reg clk,F1, F2, L, R, S;
    wire [14:0]led;
    
    initial
        begin 
            clk <= 1;
            F1 <= 1;
            F2 <= 1;
            L <= 1;
            R <= 0;
            S <= 0;
            #40 F1 <= 0;
            #20 S <= 1;
        end
        
     always #5 clk = ~clk;
     always #100  L = ~L;
//     always #100 R = ~R;
     Digital_Tug_of_War u(clk,S,F1,F2,L,R,led);
endmodule
