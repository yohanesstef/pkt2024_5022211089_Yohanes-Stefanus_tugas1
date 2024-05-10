`timescale 1ns/1ns
`include "graycode_counter.v"

module graycode_counter_tb;
    reg clk;
    reg reset;
    reg up_down;
    wire [2:0] gray_code;
    wire [2:0] bin_count;

    graycode_counter gc(.clk(clk), .reset(reset), .up_down(up_down), .o_bin(bin_count), .o_gray_code(gray_code));

    always #1 clk = ~clk;
    always #10 up_down = ~up_down;

    initial begin

        $dumpfile("graycode_counter_tb.vcd");
        $dumpvars(0,graycode_counter_tb);

        clk = 0;
        up_down = 1;
        reset = 1;
        #2;
        reset = 0;


        #40;
        $display("Test complete");
        $finish;
    end

endmodule   