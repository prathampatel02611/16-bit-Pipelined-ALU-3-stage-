//============================================================
// Project : 16-bit 3-Stage Pipelined ALU
// File    : stage2_execute.v
// Author  : Pratham Patel P
// Inst    : Dharmsinh Desai University
// Description : Stage 2 — Performs ALU operation
//============================================================

// Stage 2: Perform ALU operation
module stage2_execute (
    input  wire        clk,
    input  wire        rst,
    input  wire [15:0] a,
    input  wire [15:0] b,
    input  wire [3:0]  op,

    output reg  [15:0] result_out,
    output reg         carry_out
);

    reg [16:0] temp;  // 17-bit to capture carry

    always @(posedge clk or posedge rst) begin
        if (rst) begin
            result_out <= 16'd0;
            carry_out  <= 1'b0;
        end else begin
            case (op)
                4'd0: temp = a + b;          // ADD
                4'd1: temp = a - b;          // SUB
                4'd2: temp = {1'b0, a & b};  // AND
                4'd3: temp = {1'b0, a | b};  // OR
                4'd4: temp = {1'b0, a ^ b};  // XOR
                4'd5: temp = {1'b0, ~a};     // NOT A
                4'd6: temp = {1'b0, a << b[3:0]};  // Shift left
                4'd7: temp = {1'b0, a >> b[3:0]};  // Shift right
                default: temp = 17'd0;
            endcase

            result_out <= temp[15:0];
            carry_out  <= temp[16];
        end
    end

endmodule
