//============================================================
// Project : 16-bit 3-Stage Pipelined ALU
// File    : stage1_fetch.v
// Author  : Pratham Patel P
// Inst    : Dharmsinh Desai University
// Description : Stage 1 — Latches input operands and opcode
//============================================================

// Stage 1: Latch inputs
module stage1_fetch (
    input  wire        clk,
    input  wire        rst,
    input  wire [15:0] a_in,
    input  wire [15:0] b_in,
    input  wire [3:0]  op_in,

    output reg  [15:0] a_out,
    output reg  [15:0] b_out,
    output reg  [3:0]  op_out
);

    always @(posedge clk or posedge rst) begin
        if (rst) begin
            a_out  <= 16'd0;
            b_out  <= 16'd0;
            op_out <= 4'd0;
        end else begin
            a_out  <= a_in;
            b_out  <= b_in;
            op_out <= op_in;
        end
    end

endmodule
