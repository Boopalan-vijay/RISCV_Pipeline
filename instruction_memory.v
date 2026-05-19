`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 25.08.2025 11:48:24
// Design Name: 
// Module Name: instruction_memory
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

module instruction_memory(
    input  wire        clk,
    input  wire        rst,
    input  wire [31:0] read_address,
    output reg  [31:0] instruction_out
);

    integer i;
    reg [31:0] mem [0:63];

    // Load program once (ROM-style)
    initial begin
            //r type
            mem[0]  <= 32'b00000000000000000000000000000000;
            mem[1]  <= 32'b0000000_11001_10000_000_01101_0110011;//add x13 ,x16,x25
            mem[2]  <= 32'b0100000_00011_01000_000_00101_0110011;//sub x5,x8,x3
            mem[3]  <= 32'b0000000_00011_00010_111_00001_0110011;//and x1,x2,x3
            mem[4]  <= 32'b0000000_00101_00011_110_00100_0110011;//or x4,x3,x5
            
      //I type      
            mem[5]  <= 32'b000000000011_10101_000_10110_0010011;//addi x22,x21,3
            mem[6]  <= 32'b000000000001_01000_110_01001_0010011;//ori x9,x8,1
      //L-type   
                        
   
            mem[7]  <= 32'b000000001111_00011_010_01000_0000011;//lw x8,15(x3)//Mem[15+x3(content)]
            mem[8]  <= 32'b000000000011_00011_010_01001_0000011;//lw x9 3(x3)
      //s-type      
            mem[9]  <= 32'b0000000_01111_00101_010_01100_0100011;//sw x15,12(x5)
            mem[10] <= 32'b0000000_01110_00110_010_01010_0100011;//sw x14,10(x6)
            
     //sb-type       
            mem[11] <= 32'h00948663;//beq x9,x9,12

        for (i = 12; i < 64; i = i + 1)
            mem[i] = 32'h00000000;
    end

    // Synchronous output register with reset
    always @(* ) begin
        if (rst)
            instruction_out <= 32'h00;   // clear fetched instruction
        else
            instruction_out <= mem[read_address[31:2]];
    end

endmodule

