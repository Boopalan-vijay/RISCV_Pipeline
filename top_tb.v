`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05.12.2025 18:48:35
// Design Name: 
// Module Name: top_tb
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


module top_tb();

reg clk,rst;

Top_level utt(.clk(clk),.rst(rst));

initial begin
clk=0;
rst=1;
#10;
rst=0;
#400;
end

always begin
#5 clk=~clk;
end

endmodule
