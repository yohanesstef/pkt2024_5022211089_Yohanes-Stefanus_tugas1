`timescale 1ns/1ns
`include "minority.v"

module minority_tb;

    reg A,B,C;
    wire Y;

    minority uut(A,B,C,Y);

    initial begin
        $dumpfile("minority_tb.vcd");
        $dumpvars(0,minority_tb);
        {A,B,C} = 3'd0; #20;
        {A,B,C} = 3'd1; #20;
        {A,B,C} = 3'd2; #20;
        {A,B,C} = 3'd3; #20;
        {A,B,C} = 3'd4; #20;
        {A,B,C} = 3'd5; #20;
        {A,B,C} = 3'd6; #20;
        {A,B,C} = 3'd7; #20;
        $display("Test is complete!");
    end

endmodule