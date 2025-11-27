import chisel3._
import chisel3.iotesters.{PeekPokeTester, Driver, ChiselFlatSpec}

class testbench(c: ALU) extends PeekPokeTester(c) {
  def testOp(op: Int, a: BigInt, b: BigInt, expected: BigInt): Unit = {
    poke(c.io.a, a)
    poke(c.io.b, b)
    poke(c.io.aluOp, op)
    step(1)
    expect(c.io.result, expected)
  }

  val a = 12
  val b = 5

  testOp(0, a, b, a)           // NOP
  testOp(1, a, b, a + b)       // ADD
  testOp(2, a, b, a - b)       // SUB
  testOp(3, a, b, a & b)       // AND
  testOp(4, a, b, a | b)       // OR
  testOp(5, a, b, a ^ b)       // XOR
  testOp(6, a, b, b)           // LD
  testOp(7, a, b, a >> 1)      // SHR
}
object ALUTester extends App {
  println("(Running TestBench for ALU)")
  chisel3.iotesters.Driver(() => new ALU(16)) { c =>
    new testbench(c)
  }
  chisel3.iotesters.Driver.execute(Array("--generate-vcd-output", "on"), () => new
      ALU(16)) {
    c => new testbench(c)
  }
}