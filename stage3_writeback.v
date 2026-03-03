//============================================================
// Project : 16-bit 3-Stage Pipelined ALU
// File    : stage3_writeback.v
// Author  : Pratham Patel P
// Inst    : Dharmsinh Desai University
// Description : Stage 3 — Flag generation and result output
//============================================================

// Stage 3: Generate flags and output result
module stage3_writeback (
    input  wire        clk,
    input  wire        rst,
    input  wire [15:0] result_in,
    input  wire        carry_in,

    output reg  [15:0] result_out,
    output reg         zero_flag,
    output reg         carry_flag,
    output reg         negative_flag
);

    always @(posedge clk or posedge rst) begin
        if (rst) begin
            result_out    <= 16'd0;
            zero_flag     <= 1'b0;
            carry_flag    <= 1'b0;
            negative_flag <= 1'b0;
        end else begin
            result_out    <= result_in;
            zero_flag     <= (result_in == 16'd0);
            carry_flag    <= carry_in;
            negative_flag <= result_in[15];
        end
    end

endmodule
