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

**Module Description**

**1. Program Counter (PC)**
Responsible for storing and updating the address of the next instruction to be fetched.
Functions
Holds current instruction address
Increments PC
Handles branch/jump updates

**2. Instruction Memory**
Stores the machine instructions executed by the processor.
Functions
Fetches instruction using PC address
Sends instruction to Decode stage

**3. IF/ID Pipeline Register**
Pipeline register between Fetch and Decode stages.
Functions
Stores fetched instruction
Stores PC value for next stage

**4. Control Unit**
Generates control signals based on opcode and instruction type.
Functions
ALU control generation
Memory control signals
Register write control
Branch control logic

**5. Register File**
Contains general-purpose registers used during instruction execution.
Functions
Reads source registers
Writes back destination register data
Supports simultaneous read/write operations

**6. Immediate Generator**
Extracts and sign-extends immediate values from instructions.
Functions
Decodes immediate formats
Generates signed immediate values

**7. ID/EX Pipeline Register**
Transfers decoded information from Decode stage to Execute stage.
Stores
Register values
Immediate data
Control signals
Destination register details

**8. ALU (Arithmetic Logic Unit)**
Performs arithmetic and logical operations.
Supported Operations
Addition
Subtraction
AND
OR
XOR
Comparison operations

**9. Forwarding Unit**
Handles data hazards by forwarding results from later stages.
Purpose
Avoids unnecessary stalls and improves pipeline efficiency.

**10. Hazard Detection Unit**
Detects pipeline hazards that cannot be solved through forwarding.
Functions
Detects load-use hazards
Inserts stalls/NOPs when required

**11. EX/MEM Pipeline Register**
Stores execution stage outputs before memory access.
Stores
ALU result
Memory control signals
Register destination info

**12. Data Memory**
Handles load and store instructions.
Functions
Read data from memory
Write data to memory

**13. MEM/WB Pipeline Register**
Transfers data from Memory stage to Write Back stage.
Stores
ALU output
Memory read data
Register write signals

**14. Write Back Unit**
Writes final processed data back into the register file.
Functions
Selects memory/ALU output
Updates destination register

**Tools Used**
Verilog HDL
vivado
