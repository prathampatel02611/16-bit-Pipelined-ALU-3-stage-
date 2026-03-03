//============================================================
// Project : 16-bit 3-Stage Pipelined ALU
// File    : alu_top.v
// Author  : Pratham Patel P
// Inst    : Dharmsinh Desai University
// Description : Top-level module connecting all pipeline stages
//============================================================

// Top level: Connect 3 stages together
module alu_top (
    input  wire        clk,
    input  wire        rst,
    input  wire [15:0] a,
    input  wire [15:0] b,
    input  wire [3:0]  opcode,

    output wire [15:0] result,
    output wire        zero_flag,
    output wire        carry_flag,
    output wire        negative_flag
);

    // Wires between stages
    wire [15:0] s1_a, s1_b;
    wire [3:0]  s1_op;
    wire [15:0] s2_result;
    wire        s2_carry;

    // Stage 1: Fetch/Latch inputs
    stage1_fetch u_stage1 (
        .clk    (clk),
        .rst    (rst),
        .a_in   (a),
        .b_in   (b),
        .op_in  (opcode),
        .a_out  (s1_a),
        .b_out  (s1_b),
        .op_out (s1_op)
    );

    // Stage 2: Execute
    stage2_execute u_stage2 (
        .clk        (clk),
        .rst        (rst),
        .a          (s1_a),
        .b          (s1_b),
        .op         (s1_op),
        .result_out (s2_result),
        .carry_out  (s2_carry)
    );

    // Stage 3: Writeback
    stage3_writeback u_stage3 (
        .clk           (clk),
        .rst           (rst),
        .result_in     (s2_result),
        .carry_in      (s2_carry),
        .result_out    (result),
        .zero_flag     (zero_flag),
        .carry_flag    (carry_flag),
        .negative_flag (negative_flag)
    );

endmodule
