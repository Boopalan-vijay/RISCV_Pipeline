`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03.12.2025 19:27:37
// Design Name: 
// Module Name: ALU_control
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


module ALU_control(
    input  [1:0] ALU_op,
    input  [2:0] fun_3,
    input        fun_7,
    output reg [3:0] ALU_control_out
    );

always @(*) begin
    case (ALU_op)

        2'b00: begin
            // LW, SW ? ADD
           ALU_control_out = 4'b0010;
        end

        2'b01: begin
            // BEQ ? SUB
            ALU_control_out = 4'b0110;
        end

        2'b10: begin
            // R-type
            case ({fun_7, fun_3})
                4'b0_000: ALU_control_out = 4'b0010; // ADD
                4'b1_000: ALU_control_out = 4'b0110; // SUB
                4'b0_111: ALU_control_out = 4'b0000; // AND
                4'b0_110: ALU_control_out = 4'b0001; // OR
                default:  ALU_control_out = 4'b0010; // default ADD
            endcase
        end

        default: ALU_control_out= 4'b0010;
    endcase
end

endmodule

