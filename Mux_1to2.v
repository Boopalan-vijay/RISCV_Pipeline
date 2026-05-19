`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03.12.2025 21:33:11
// Design Name: 
// Module Name: Mux_1to2
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


module Mux_1(
    input sel,
    input [31:0]A,[31:0]B,
    output [31:0]out
    );
 assign out = (sel==1'b1)? B : A;   
endmodule
