`timescale 1ns/1ns

module graycode_counter(
    input clk,
    input reset,
    input up_down,
    output [2:0] o_bin,
    output [2:0] o_gray_code
);

reg [2:0] bin_counter = 0;

always @(posedge clk or posedge reset)
    if(reset)
        bin_counter <= 0;
    else if(up_down)
        bin_counter <= bin_counter + 1;
    else
        bin_counter <= bin_counter - 1;

assign o_bin = bin_counter;

// reg [2:0] r_gc = 0;

// always @(bin_counter)
//     case (bin_counter)
//         0 : r_gc = 3'b000;
//         1 : r_gc = 3'b001;
//         2 : r_gc = 3'b011;
//         3 : r_gc = 3'b010;
//         4 : r_gc = 3'b110;
//         5 : r_gc = 3'b111;
//         6 : r_gc = 3'b101;
//         7 : r_gc = 3'b100;
//     endcase

// assign o_gray_code = r_gc;

assign o_gray_code[2] = bin_counter[2];
assign o_gray_code[1] = bin_counter[2] ^ bin_counter[1];
assign o_gray_code[0] = bin_counter[1] ^ bin_counter[0];
endmodule