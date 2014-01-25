import Multiplexer::*;

interface BarrelShifterRight;
  method ActionValue#(Bit#(32)) rightShift(Bit#(32) val, Bit#(5) shiftAmt, Bit#(1) shiftValue);
endinterface

module mkBarrelShifterRight(BarrelShifterRight);
  method ActionValue#(Bit#(32)) rightShift(Bit#(32) val, Bit#(5) shiftAmt, Bit#(1) shiftValue);
    Bit#(32) sValue = 0;
    for (Integer i=0 ; i<32 ; i=i+1)
    begin
      sValue[i]=shiftValue;
    end
    for (Integer i=0 ; i<5 ; i=i+1)
    begin
      val = multiplexer32(shiftAmt[i], val , val)
    end
    return val;
  endmethod
endmodule

interface BarrelShifterRightLogical;
  method ActionValue#(Bit#(32)) rightShift(Bit#(32) val, Bit#(5) shiftAmt);
endinterface

module mkBarrelShifterRightLogical(BarrelShifterRightLogical);
  let bsr <- mkBarrelShifterRight;
  method ActionValue#(Bit#(32)) rightShift(Bit#(32) val, Bit#(5) shiftAmt);
    return mkBarrelShifterRight.rightShift(val,shiftAmt,0);
  endmethod
endmodule

typedef BarrelShifterRightLogical BarrelShifterRightArithmetic;

module mkBarrelShifterRightArithmetic(BarrelShifterRightArithmetic);
  let bsr <- mkBarrelShifterRight;
   method ActionValue#(Bit#(32)) rightShift(Bit#(32) val, Bit#(5) shiftAmt);
      return ?;
  endmethod
endmodule

