**RISC-V 5-Stage Pipelined Processor**

A custom-designed 32-bit RISC-V pipelined processor implemented in Verilog HDL, built to demonstrate practical understanding of Computer Architecture, RTL Design, Pipeline Processing, and Hazard Handling.

This project was developed as a hands-on learning and implementation project to strengthen concepts in:

Processor Architecture,
Pipeline Design,
RTL Coding,
Instruction Execution Flow,
Hazard Detection & Forwarding and
Digital Design Fundamentals

**Project Overview**

This processor follows the classic 5-stage RISC-V pipeline architecture:

Instruction Fetch (IF)
Instruction Decode (ID)
Execute (EX)
Memory Access (MEM)
Write Back (WB)

The design supports RV32I-style instruction execution with pipelining concepts such as:

Pipeline Registers
Data Forwarding
Hazard Detection
Control Signal Propagation
ALU Operations
Branch Handling

The project is written completely in Verilog HDL using a modular design approach for better readability, debugging, and scalability.

**Demonstration of the data hazard resolving**

* The "memfile.hex.txt" has 16 different instructions to verify the processor.
Where first three instructions have to do operations of:

x5 = x0 + 5

x6 = x0 + 3

x7 = x5 + x6

But due to pipelining, The current value of x5 and x6 couldn't be fetched, the third instruction Result in "XXXX" ,this data hazard occurs and can be seen in the waveform **Refer Data hazard.png @ 800ns**.

**After the implementation of Hazard unit/Forwarding Logic**

 The data hazard has been resolved and can be verified **Refer Forward_unit.png**
 
 x5=5;
 
 x6=3;

 x7=x5+x6; 
 
 so 
 
 x7=8;
 
 The Result is now correct!!
 
Using directed test cases such as these, the designed modules and the complete pipelined processor were functionally verified by observing instruction execution, hazard occurrence, and proper data forwarding/stall behavior through simulation waveforms.


