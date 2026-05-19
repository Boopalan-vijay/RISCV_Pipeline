`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 26.08.2025 15:45:10
// Design Name: 
// Module Name: Immediate_generator
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


module Immediate_generator(
    input  [6:0]  opcode,
    input  [31:0] instruction,
    output reg [31:0] immop
);

  always @(*) begin
    case (opcode)
      // I-type (addi, lw, jalr, ...)
    
      7'b0000011, // load
      7'b0010011, // ALU immediate
      7'b1100111: // jalr
        immop = {{20{instruction[31]}}, instruction[31:20]}; // sign-extend instr[31:20]

      // S-type (store: sw, sb, sh)
      7'b0100011:
        immop = {{20{instruction[31]}}, instruction[31:25], instruction[11:7]}; // imm[11:0] = inst[31:25]|inst[11:7]

      // B-type (branch: beq, bne, blt, bge)
      // imm[12] = inst[31]
      // imm[11] = inst[7]
      // imm[10:5] = inst[30:25]
      // imm[4:1] = inst[11:8]
      // imm[0] = 0
      7'b1100011:
        immop = {{19{instruction[31]}}, instruction[31], instruction[7],
                 instruction[30:25], instruction[11:8], 1'b0};

      // U-type (lui, auipc) : imm[31:12] = inst[31:12], lower 12 bits zero
      7'b0110111, // LUI
      7'b0010111: // AUIPC
        immop = {instruction[31:12], 12'b0};

      // J-type (jal)
      // imm[20] = inst[31]
      // imm[10:1] = inst[30:21]
      // imm[11] = inst[20]
      // imm[19:12] = inst[19:12]
      // imm[0] = 0
      7'b1101111:
        immop = {{11{instruction[31]}},
                 instruction[31],
                 instruction[19:12],
                 instruction[20],
                 instruction[30:21],
                 1'b0};

      // default: safe zero
      default:
        immop = 32'b0;
    endcase
  end

endmodule

