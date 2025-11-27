circuit ALU :
  module ALU :
    input clock : Clock
    input reset : UInt<1>
    input io_a : UInt<16>
    input io_b : UInt<16>
    input io_aluOp : UInt<3>
    output io_result : UInt<16>

    node _T = eq(UInt<1>("h0"), io_aluOp) @[Conditional.scala 37:30]
    node _T_1 = eq(UInt<1>("h1"), io_aluOp) @[Conditional.scala 37:30]
    node _T_2 = add(io_a, io_b) @[ALU.scala 17:38]
    node _T_3 = tail(_T_2, 1) @[ALU.scala 17:38]
    node _T_4 = eq(UInt<2>("h2"), io_aluOp) @[Conditional.scala 37:30]
    node _T_5 = sub(io_a, io_b) @[ALU.scala 18:38]
    node _T_6 = tail(_T_5, 1) @[ALU.scala 18:38]
    node _T_7 = eq(UInt<2>("h3"), io_aluOp) @[Conditional.scala 37:30]
    node _T_8 = and(io_a, io_b) @[ALU.scala 19:38]
    node _T_9 = eq(UInt<3>("h4"), io_aluOp) @[Conditional.scala 37:30]
    node _T_10 = or(io_a, io_b) @[ALU.scala 20:38]
    node _T_11 = eq(UInt<3>("h5"), io_aluOp) @[Conditional.scala 37:30]
    node _T_12 = xor(io_a, io_b) @[ALU.scala 21:38]
    node _T_13 = eq(UInt<3>("h6"), io_aluOp) @[Conditional.scala 37:30]
    node _T_14 = eq(UInt<3>("h7"), io_aluOp) @[Conditional.scala 37:30]
    node _T_15 = shr(io_a, 1) @[ALU.scala 23:38]
    node _GEN_0 = mux(_T_14, _T_15, UInt<1>("h0")) @[Conditional.scala 39:67 ALU.scala 23:30 ALU.scala 13:13]
    node _GEN_1 = mux(_T_13, io_b, _GEN_0) @[Conditional.scala 39:67 ALU.scala 22:30]
    node _GEN_2 = mux(_T_11, _T_12, _GEN_1) @[Conditional.scala 39:67 ALU.scala 21:30]
    node _GEN_3 = mux(_T_9, _T_10, _GEN_2) @[Conditional.scala 39:67 ALU.scala 20:30]
    node _GEN_4 = mux(_T_7, _T_8, _GEN_3) @[Conditional.scala 39:67 ALU.scala 19:30]
    node _GEN_5 = mux(_T_4, _T_6, _GEN_4) @[Conditional.scala 39:67 ALU.scala 18:30]
    node _GEN_6 = mux(_T_1, _T_3, _GEN_5) @[Conditional.scala 39:67 ALU.scala 17:30]
    node _GEN_7 = mux(_T, io_a, _GEN_6) @[Conditional.scala 40:58 ALU.scala 16:30]
    io_result <= _GEN_7
