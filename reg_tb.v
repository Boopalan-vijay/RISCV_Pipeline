`timescale 1ns / 1ps

module tb_registers;

    // DUT inputs
    reg clk;
    reg rst;
    reg regwrite;
    reg [4:0] ra_1, ra_2, wr;
    reg [31:0] wr_data;

    // DUT outputs
    wire [31:0] rd_1, rd_2;

    // Instantiate DUT
    Registers dut (
        .clk(clk),
        .rst(rst),
        .regwrite(regwrite),
        .ra_1(ra_1),
        .ra_2(ra_2),
        .wr(wr),
        .wr_data(wr_data),
        .rd_1(rd_1),
        .rd_2(rd_2)
    );

    // Clock generation
    always #5 clk = ~clk;

    initial begin
        $display("===== REGISTER FILE TEST START =====");

        // Initialize signals
        clk = 0;
        rst = 0;
        regwrite = 0;
        ra_1 = 0; ra_2 = 0;
        wr = 0;
        wr_data = 0;

        // Apply reset
        #5 rst = 1;
        #10 rst = 0;     // release reset

        // Now read some registers after reset
        #5;
        ra_1 = 1; 
        ra_2 = 2;
        #10;
        $display("After reset: rd_1(Reg1) = %d, rd_2(Reg2) = %d", rd_1, rd_2);

        // Write to register 5
        #5;
        regwrite = 1;
        wr = 5;
        wr_data = 99;
        #10 regwrite = 0;

        // Read register 5
        #5;
        ra_1 = 5;
        ra_2 = 0;
        #10;
        $display("After write: rd_1(Reg5) = %d", rd_1);

        // Write to register 10
        #5;
        regwrite = 1;
        wr = 10;
        wr_data = 1234;
        #10 regwrite = 0;

        // Read register 10
        #5;
        ra_1 = 10;
        #10;
        $display("After write: rd_1(Reg10) = %d", rd_1);

        // Multiple reads
        ra_1 = 3;
        ra_2 = 4;
        #10;
        $display("Reg3 = %d, Reg4 = %d", rd_1, rd_2);

        $display("===== REGISTER FILE TEST END =====");
        $finish;
    end

    // Monitor activity
    initial begin
        $monitor("TIME=%0t | rst=%b ra1=%d ra2=%d wr=%d wr_data=%d | rd1=%d rd2=%d",
                 $time, rst, ra_1, ra_2, wr, wr_data, rd_1, rd_2);
    end

endmodule
