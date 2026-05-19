`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04.12.2025 09:28:19
// Design Name: 
// Module Name: Top_level
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


module Top_level(input clk,rst);


     wire [31:0]PC_out,instruction_out;
     
     
     wire Branch,MemRead,MemtoReg,MemWrite,ALUSrc,RegWrite;
     wire [1:0] ALUOp;
     wire [3:0] ALU_control_out;
     
     wire [31:0]rd_1;//register op to ALU 
     wire [31:0]rd_2;//register op to ALU 
     
     wire [31:0] immop;//immediate_gen op
     
     wire [31:0]ALU_MUX_OP;
     
     wire [31:0] Next_PC;//pc=pc+4;
    
     wire [31:0]adder_op;
    
     wire [31:0]mux_2_out;//ie ip of PC
    
     wire zero_op,And_out;
     wire [31:0] ALU_result;
    
     wire [31:0] Read_data_out;
     
     wire [31:0]mux_3_out;
     
     wire [4:0]ra_1_in,ra_2_in,wr_in;
     
     assign ra_1_in=instruction_out[19:15];
     
     assign ra_2_in=instruction_out[24:20];
     
     assign wr_in=instruction_out[11:7];
     
     wire [6:0]opcode_in;
     
     assign opcode_in=instruction_out[6:0];
     
     wire [2:0]fun_3_in;
     
     assign fun_3_in=instruction_out[14:12];
     
     wire fun_7_in;
     
     assign fun_7_in=instruction_out[30];
     
    program_counter PC(.clk(clk), .rst(rst), .din(mux_2_out), .dout(PC_out));
    
    instruction_memory IM(.clk(clk),.rst(rst),.read_address(PC_out),.instruction_out(instruction_out));
    
    Pc_plus4 PC_next(.Pc(PC_out),.Next_PC(Next_PC));
    
    Registers Reg(.clk(clk),.rst(rst),.regwrite(RegWrite), .ra_1(ra_1_in),.ra_2(ra_2_in),.wr(wr_in), .wr_data(mux_3_out),.rd_1(rd_1),.rd_2(rd_2) );

    Immediate_generator IM_GEN(.opcode(opcode_in),.instruction(instruction_out),.immop(immop));
    
    control_unit ctrl_unit(.instruction(opcode_in),.Branch(Branch),.MemRead(MemRead),.MemtoReg(MemtoReg),.MemWrite(MemWrite),.ALUSrc(ALUSrc),.RegWrite(RegWrite),.ALUOp(ALUOp));
   
    ALU_control ALU_ctrl(.ALU_op(ALUOp),.fun_3(fun_3_in),.fun_7(fun_7_in),.ALU_control_out(ALU_control_out));
   
    ALU ALU_main(.A(rd_1),.B(ALU_MUX_OP),. ALU_control(ALU_control_out),.zero_op(zero_op),.ALU_result(ALU_result));
   
    Mux_1 ALU_MUX(.sel(ALUSrc),.A(rd_2),.B(immop),.out(ALU_MUX_OP));
    
    adder_logic adder(.in1(PC_out),.in2(immop),.out(adder_op)); 
    
    And_logic and_gate(.Branch(Branch),.Zero_ip(zero_op),.And_out(And_out));
    
    mux_2 mux2(.sel(And_out),.A(Next_PC),.B(adder_op),.out(mux_2_out));
    
    Data_Memory Data_mem(.clk(clk),.rst(rst),.Address(ALU_result),.Write_data(rd_2),.Mem_write(MemWrite),.Mem_read(MemRead),.Read_data_out(Read_data_out) );
       
     mux_3 mux3(.sel(MemtoReg),.A(ALU_result),.B(Read_data_out),.out(mux_3_out));

   endmodule 
