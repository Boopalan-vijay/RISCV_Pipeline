module Data_Memory(
    input              clk,
    input              rst,
    input      [31:0]  Address,     // byte address
    input      [31:0]  Write_data,
    input              Mem_write,
    input              Mem_read,
    output reg [31:0]  Read_data_out
    );

    integer i;
    reg [31:0] Mem [0:63];   // 64 words

    // helper: word index (Address is byte address; convert to word index)
    wire [5:0] word_index = Address[7:2]; // use bits [7:2] if addressable 64 words (64*4=256 bytes)
    // If memory smaller/larger, adjust indexing width accordingly. For 64 entries, 6 bits (0..63).

   
    always @(*) begin
        if (rst) begin
            for (i = 0; i < 64; i = i + 1) begin
                Mem[i] <= 32'b0;
            end
        end else begin
            if (Mem_write) begin
                Mem[word_index] <= Write_data;
            end
        end
    end

    // combinational read with write-forwarding:
    // if Mem_read asserted, return either the new Write_data (if writing same address this cycle)
    // or the current memory content otherwise.
    always @(*) begin
        if (Mem_read) begin
            if (Mem_write) begin
                // if both read & write now and addresses equal -> forward the new data
                // NOTE: here address signals for read and write are same port in your module,
                // so this check is trivial; if your design has separate read/write addresses,
                // compare them.
                Read_data_out = Write_data; 
            end 
            else begin
                Read_data_out = Mem[word_index];
            end
        end 
        
         begin
            Read_data_out = 32'b0;
        end
    end

endmodule
