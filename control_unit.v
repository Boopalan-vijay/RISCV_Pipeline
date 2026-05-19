`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 27.08.2025 10:22:12
// Design Name: 
// Module Name: control_unit
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

module control_unit(
    input  [6:0] instruction,
    output reg Branch, MemRead, MemtoReg, MemWrite, ALUSrc, RegWrite,
    output reg [1:0] ALUOp
);

always @(*) begin
    case(instruction)

        // R-type
        7'b0110011: {ALUSrc, MemtoReg, RegWrite, MemRead, MemWrite, Branch, ALUOp}
                    = 8'b001000_10;  // ALUOp = 10 ? use funct3 & funct7

        // LW
        7'b0000011: {ALUSrc, MemtoReg, RegWrite, MemRead, MemWrite, Branch, ALUOp}
                    = 8'b111100_00;  // ALUOp = 00 ? ADD

        // SW
        7'b0100011: {ALUSrc, MemtoReg, RegWrite, MemRead, MemWrite, Branch, ALUOp}
                    = 8'b100010_00;  // ALUOp = 00 ? ADD

        // BEQ
        7'b1100011: {ALUSrc, MemtoReg, RegWrite, MemRead, MemWrite, Branch, ALUOp}
                    = 8'b000001_01;  // ALUOp = 01 ? SUB
                    
        7'b0010011:  // ALL I-type ALU OPs
                        {ALUSrc,MemtoReg,RegWrite,MemRead,MemWrite,Branch,ALUOp}
                    = 8'b101000_00;
            

        default: begin
            Branch   = 1'b0;
            MemRead  = 1'b0;
            MemtoReg = 1'b0;
            MemWrite = 1'b0;
            ALUSrc   = 1'b0;
            RegWrite = 1'b0;
            ALUOp    = 2'b00;
        end
    endcase
end

endmodule

