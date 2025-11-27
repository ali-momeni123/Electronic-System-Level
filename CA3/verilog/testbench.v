`timescale 1ns / 1ps

module ALU_tb;

  // Inputs
  reg clock;
  reg reset;
  reg [15:0] io_a;
  reg [15:0] io_b;
  reg [2:0] io_aluOp;

  // Output
  wire [15:0] io_result;

  // Local test variables (declare here, NOT in initial block)
  reg [15:0] a;
  reg [15:0] b;

  // Instantiate the ALU
  ALU uut (
    .clock(clock),
    .reset(reset),
    .io_a(io_a),
    .io_b(io_b),
    .io_aluOp(io_aluOp),
    .io_result(io_result)
  );

  // Clock generator
  initial begin
    clock = 0;
    forever #50 clock = ~clock; // 100ns clock period
  end

  // Task to apply one test
  task testOp;
    input [2:0] op;
    input [15:0] a;
    input [15:0] b;
    input [15:0] expected;

    begin
      io_a = a;
      io_b = b;
      io_aluOp = op;
      #100; // Wait one full clock cycle
      if (io_result !== expected)
        $display("FAILED: op=%0d a=%0d b=%0d -> expected=%0d, got=%0d", op, a, b, expected, io_result);
      else
        $display("PASSED: op=%0d a=%0d b=%0d -> result=%0d", op, a, b, io_result);
    end
  endtask

  // Main stimulus
  initial begin
    reset = 0;
    io_a = 0;
    io_b = 0;
    io_aluOp = 0;

    #15;

    a = 16'd12;
    b = 16'd5;

    testOp(3'd0, a, b, a);         // NOP
    testOp(3'd1, a, b, a + b);     // ADD
    testOp(3'd2, a, b, a - b);     // SUB
    testOp(3'd3, a, b, a & b);     // AND
    testOp(3'd4, a, b, a | b);     // OR
    testOp(3'd5, a, b, a ^ b);     // XOR
    testOp(3'd6, a, b, b);         // LD
    testOp(3'd7, a, b, a >> 1);    // SHR

    $finish;
  end

endmodule
