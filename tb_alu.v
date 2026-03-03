//============================================================
// Project : 16-bit 3-Stage Pipelined ALU
// File    : tb_alu.v
// Author  : Pratham Patel P
// Inst    : Dharmsinh Desai University
// Description : Testbench for functional verification
//============================================================

`timescale 1ns / 1ps

module tb_alu;

    reg         clk, rst;
    reg  [15:0] a, b;
    reg  [3:0]  opcode;
    wire [15:0] result;
    wire        zero_flag, carry_flag, negative_flag;

    // Instantiate ALU
    alu_top uut (
        .clk           (clk),
        .rst           (rst),
        .a             (a),
        .b             (b),
        .opcode        (opcode),
        .result        (result),
        .zero_flag     (zero_flag),
        .carry_flag    (carry_flag),
        .negative_flag (negative_flag)
    );

    // Clock: 10ns period
    always #5 clk = ~clk;

    // Dump waveform
    initial begin
        $dumpfile("alu.vcd");
        $dumpvars(0, tb_alu);
    end

    initial begin
        clk = 0; rst = 1;
        a = 0; b = 0; opcode = 0;

        // Release reset
        #20 rst = 0;

        // Wait 3 cycles for pipeline to fill before checking results
        // Each result appears 3 cycles after input

        // --- Test ADD ---
        #10 a = 16'h000A; b = 16'h0005; opcode = 4'd0;
        $display("Input: ADD  A=0x%h B=0x%h", a, b);

        // --- Test SUB ---
        #10 a = 16'h0010; b = 16'h0003; opcode = 4'd1;
        $display("Input: SUB  A=0x%h B=0x%h", a, b);

        // --- Test AND ---
        #10 a = 16'hFF00; b = 16'h0F0F; opcode = 4'd2;
        $display("Input: AND  A=0x%h B=0x%h", a, b);

        // --- Test OR ---
        #10 a = 16'hFF00; b = 16'h00FF; opcode = 4'd3;
        $display("Input: OR   A=0x%h B=0x%h", a, b);

        // --- Test XOR ---
        #10 a = 16'hAAAA; b = 16'h5555; opcode = 4'd4;
        $display("Input: XOR  A=0x%h B=0x%h", a, b);

        // --- Test NOT ---
        #10 a = 16'hAAAA; b = 16'h0000; opcode = 4'd5;
        $display("Input: NOT  A=0x%h", a);

        // --- Test Shift Left ---
        #10 a = 16'h0001; b = 16'h0004; opcode = 4'd6;
        $display("Input: SLL  A=0x%h B=%0d", a, b);

        // --- Test Shift Right ---
        #10 a = 16'h0080; b = 16'h0003; opcode = 4'd7;
        $display("Input: SRL  A=0x%h B=%0d", a, b);

        // --- Edge case: ADD with carry ---
        #10 a = 16'hFFFF; b = 16'h0001; opcode = 4'd0;
        $display("Input: ADD  A=0x%h B=0x%h (carry test)", a, b);

        // --- Edge case: SUB to zero ---
        #10 a = 16'h0005; b = 16'h0005; opcode = 4'd1;
        $display("Input: SUB  A=0x%h B=0x%h (zero test)", a, b);

        // Wait for pipeline to drain
        #50;

        $display("\n--- Simulation Complete ---");
        $finish;
    end

    // Monitor outputs
    always @(posedge clk) begin
        if (!rst) begin
            $display("  Output: result=0x%h  Z=%b C=%b N=%b",
                     result, zero_flag, carry_flag, negative_flag);
        end
    end

endmodule
