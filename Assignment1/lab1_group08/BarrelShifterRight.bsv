import Multiplexer::*;

interface BarrelShifterRight;
  method ActionValue#(Bit#(32)) rightShift(Bit#(32) val, Bit#(5) shiftAmt, Bit#(1) shiftValue);
endinterface

module mkBarrelShifterRight(BarrelShifterRight);
  method ActionValue#(Bit#(32)) rightShift(Bit#(32) val, Bit#(5) shiftAmt, Bit#(1) shiftValue);
    Bit#(32) sValue = 0;
    for (Integer i=0 ; i<5 ; i=i+1)
    begin
	  sValue = val;
	  for(Integer j=0 ; j<exp(2,i) ; j=j+1 )
	  begin
	    sValue = {shiftValue, truncateLSB(sValue)};
	  end
      val = multiplexer32(shiftAmt[i], val , sValue);
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
    Bit#(32) valF <- bsr.rightShift(val,shiftAmt,0);
    return valF;
  endmethod
endmodule

typedef BarrelShifterRightLogical BarrelShifterRightArithmetic;

module mkBarrelShifterRightArithmetic(BarrelShifterRightArithmetic);
  let bsr <- mkBarrelShifterRight;
  method ActionValue#(Bit#(32)) rightShift(Bit#(32) val, Bit#(5) shiftAmt);
    Bit#(32) valF <- bsr.rightShift(val,shiftAmt,val[31]);
    return valF;
  endmethod
endmodule

