`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 18.08.2025 07:14:34
// Design Name: 
// Module Name: program_counter
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


module program_counter( input clk,rst,[31:0]din,output reg [31:0]dout);

    always@(posedge clk)
    begin 
            if(rst)
               dout<= 32'b0;
            else
                dout<=din;               
    end 
endmodule
