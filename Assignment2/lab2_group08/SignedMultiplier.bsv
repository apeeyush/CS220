import MultiplierTypes::*;
import Multiplier::*;

module mkSignedMultiplyN (MultiplyN#(n))
   provisos (Add#(1, m, n));

   MultiplyN#(n) mul <- mkMultiplyN;
   
   Reg#(Bit#(n)) i <- mkReg(1);
   Reg#(Bit#(n)) a <- mkRegU();
   Reg#(Bit#(n)) b <- mkRegU();
   Reg#(Bit#(TAdd#(n,n))) res <- mkRegU();
   Reg#(Bit#(1)) asign <- mkReg(0);
   Reg#(Bit#(1)) bsign <- mkReg(0);


   // You need to implement guards and bodies for methods
   
   method Action start(Bit#(n) aIn, Bit#(n) bIn) /* if ( i != 0) */ ;
      if (aIn[valueOf(n)-1] == 1)
         asign <= 1;
      if (bIn[valueOf(n)-1] == 1)
         bsign <= 1;
      if (asign == 0 && bsign == 0)
         mul.start(aIn, bIn);
	  else if (asign == 0 && bsign == 1)
         mul.start(aIn,-bIn);
	  else if (asign == 1 && bsign == 0)
         mul.start(-aIn,bIn);
      else
         mul.start(-aIn,-bIn);
      i <= 0;
   endmethod

   method Bit#(TAdd#(n,n)) result() /* if ( i == 0) */ ;
      return (asign == bsign) ? mul.result : -mul.result;
/*      if ( asign==0 && bsign == 0)
         return mul.result;
	  else if (asign == 0 && bsign == 1)
         return (~mul.result)+1;
      else if (asign == 1 && bsign == 0)
         return (~mul.result)+1;
      else
         return mul.result;
*/
   endmethod 
endmodule
