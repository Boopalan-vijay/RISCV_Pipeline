`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03.12.2025 18:44:42
// Design Name: 
// Module Name: ALU
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


module ALU(
    input  [31:0] A,
    input  [31:0] B,
    input  [3:0]  ALU_control,
    output reg    zero_op,
    output reg [31:0] ALU_result
    );

    // Combinational ALU
    always @(*) begin
        // default values
        ALU_result = 32'b0;
        zero_op    = 1'b0;

        case (ALU_control)
            4'b0000: begin // AND
                ALU_result = A & B;
            end

            4'b0001: begin // OR
                ALU_result = A | B;
            end

            4'b0010: begin // ADD  (lw, sw, add, addi)
                ALU_result = A + B;
            end

            4'b0110: begin // SUB (beq, sub)
                ALU_result = A - B;
            end

            default: begin
                ALU_result = 32'b0;
            end
        endcase

        // zero flag: true if result is zero (useful for beq)
        zero_op = (ALU_result == 32'b0);
    end

endmodule
