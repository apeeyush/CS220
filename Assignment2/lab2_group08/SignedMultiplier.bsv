import MultiplierTypes::*;
import Multiplier::*;

module mkSignedMultiplyN (MultiplyN#(n))
   provisos (Add#(1, m, n));

   let mul <- mkMultiplyN;
   
   Reg#(Bit#(n)) i <- mkReg(1);
   Reg#(Bit#(n)) a <- mkRegU();
   Reg#(Bit#(n)) b <- mkRegU();
   Reg#(Bit#(TAdd#(n,n))) res <- mkRegU();
   Reg#(Bit#(1)) asign <- mkRegU();
   Reg#(Bit#(1)) bsign <- mkRegU();


   // You need to implement guards and bodies for methods
   
   method Action start(Bit#(n) aIn, Bit#(n) bIn) /* if ( i != 0) */ ;
      asign <= aIn[valueOf(n)-1];
      bsign <= bIn[valueOf(n)-1];
      if (aIn[valueOf(n)-1] == 0 && bIn[valueOf(n)-1] == 0)
         mul.start(aIn, bIn);
	  else if (aIn[valueOf(n)-1] == 0 && bIn[valueOf(n)-1] == 1)
         mul.start(aIn,-bIn);
	  else if (aIn[valueOf(n)-1] == 1 && bIn[valueOf(n)-1] == 0)
         mul.start(-aIn,bIn);
      else
         mul.start(-aIn,-bIn);
      i <= 0;
   endmethod

   method Bit#(TAdd#(n,n)) result() /* if ( i == 0) */ ;
      return (asign == bsign) ? mul.result() : -mul.result();
   endmethod 
endmodule
