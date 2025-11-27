import chisel3._
import chisel3.stage.ChiselStage
import chisel3.util._

class ALU(val width: Int) extends Module {
  val io = IO(new Bundle {
    val a      = Input(UInt(width.W))
    val b      = Input(UInt(width.W))
    val aluOp  = Input(UInt(3.W))           // 3-bit opcode
    val result = Output(UInt(width.W))
  })

  io.result := 0.U // default

  switch(io.aluOp) {
    is("b000".U) { io.result := io.a }            // NOP: Res = A
    is("b001".U) { io.result := io.a + io.b }     // ADD
    is("b010".U) { io.result := io.a - io.b }     // SUB
    is("b011".U) { io.result := io.a & io.b }     // AND
    is("b100".U) { io.result := io.a | io.b }     // OR
    is("b101".U) { io.result := io.a ^ io.b }     // XOR
    is("b110".U) { io.result := io.b }            // LD: Res = B
    is("b111".U) { io.result := io.a >> 1 }       // SHR: logical right shift by 1
  }
}
object ALUMaker extends App {
  println ("(Generating Verilog file for ALU)")
  (new chisel3.stage.ChiselStage).emitVerilog(new ALU(16), Array("--target-dir",
    "Verilog"))
}
