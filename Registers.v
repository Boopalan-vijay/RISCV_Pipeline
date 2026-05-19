`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 25.08.2025 13:01:56
// Design Name: 
// Module Name: Registers
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


module Registers(
    input clk,rst,regwrite,
    input [4:0] ra_1,
    input [4:0]ra_2,
    input [4:0]wr,// read register 1, read register 2, write register(address)
    input [31:0] wr_data,
    output [31:0] rd_1,rd_2// read data1, read data 2;//ie two read and 1 write simultaniously 
    );
    
    integer i;
    reg [31:0] registers[31:0];
    

   always@(*)
    begin
            
            if(rst)
                    begin
                            registers[0]  = 0;
                            registers[1]  = 4;
                            registers[2]  = 2;
                            registers[3]  = 24;
                            registers[4]  = 4;
                            registers[5]  = 1;
                            registers[6]  = 44;
                            registers[7]  = 4;
                            registers[8]  = 2;
                            registers[9]  = 1;
                            registers[10] = 23;
                            registers[11] = 4;
                            registers[12] = 9;
                            registers[13] = 10;
                            registers[14] = 20;
                            registers[15] = 40;
                            registers[16] = 40;
                            registers[17] = 50;
                            registers[18] = 60;
                            registers[19] = 70;
                            registers[20] = 80;
                            registers[21] = 80;
                            registers[22] = 90;
                            registers[23] = 70;
                            registers[24] = 60;
                            registers[25] = 65;
                            registers[26] = 4;
                            registers[27] = 32;
                            registers[28] = 12;
                            registers[29] = 34;
                            registers[30] = 5;
                            registers[31] = 10;              
                    end
            else if(regwrite)
                    registers[wr]<= wr_data;     
         end
    
            assign rd_1=registers[ra_1];
            assign rd_2=registers[ra_2];    
endmodule
