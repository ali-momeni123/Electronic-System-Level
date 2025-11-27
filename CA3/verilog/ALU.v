module ALU(
  input         clock,
  input         reset,
  input  [15:0] io_a,
  input  [15:0] io_b,
  input  [2:0]  io_aluOp,
  output [15:0] io_result
);
  wire  _T = 3'h0 == io_aluOp; // @[Conditional.scala 37:30]
  wire  _T_1 = 3'h1 == io_aluOp; // @[Conditional.scala 37:30]
  wire [15:0] _T_3 = io_a + io_b; // @[ALU.scala 17:38]
  wire  _T_4 = 3'h2 == io_aluOp; // @[Conditional.scala 37:30]
  wire [15:0] _T_6 = io_a - io_b; // @[ALU.scala 18:38]
  wire  _T_7 = 3'h3 == io_aluOp; // @[Conditional.scala 37:30]
  wire [15:0] _T_8 = io_a & io_b; // @[ALU.scala 19:38]
  wire  _T_9 = 3'h4 == io_aluOp; // @[Conditional.scala 37:30]
  wire [15:0] _T_10 = io_a | io_b; // @[ALU.scala 20:38]
  wire  _T_11 = 3'h5 == io_aluOp; // @[Conditional.scala 37:30]
  wire [15:0] _T_12 = io_a ^ io_b; // @[ALU.scala 21:38]
  wire  _T_13 = 3'h6 == io_aluOp; // @[Conditional.scala 37:30]
  wire  _T_14 = 3'h7 == io_aluOp; // @[Conditional.scala 37:30]
  wire [14:0] _GEN_0 = _T_14 ? io_a[15:1] : 15'h0; // @[Conditional.scala 39:67 ALU.scala 23:30 ALU.scala 13:13]
  wire [15:0] _GEN_1 = _T_13 ? io_b : {{1'd0}, _GEN_0}; // @[Conditional.scala 39:67 ALU.scala 22:30]
  wire [15:0] _GEN_2 = _T_11 ? _T_12 : _GEN_1; // @[Conditional.scala 39:67 ALU.scala 21:30]
  wire [15:0] _GEN_3 = _T_9 ? _T_10 : _GEN_2; // @[Conditional.scala 39:67 ALU.scala 20:30]
  wire [15:0] _GEN_4 = _T_7 ? _T_8 : _GEN_3; // @[Conditional.scala 39:67 ALU.scala 19:30]
  wire [15:0] _GEN_5 = _T_4 ? _T_6 : _GEN_4; // @[Conditional.scala 39:67 ALU.scala 18:30]
  wire [15:0] _GEN_6 = _T_1 ? _T_3 : _GEN_5; // @[Conditional.scala 39:67 ALU.scala 17:30]
  assign io_result = _T ? io_a : _GEN_6; // @[Conditional.scala 40:58 ALU.scala 16:30]
endmodule
