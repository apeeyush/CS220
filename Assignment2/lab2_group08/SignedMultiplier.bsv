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
   
   method Action start(Bit#(n) aIn, Bit#(n) bIn) if ( i != 0) ;
      if (aIn[valueOf(n)-1] == 1)
         asign <= 1;
      if (bIn[valueOf(n)-1] == 1)
         bsign <= 1;
      mul.start(aIn, bIn);
/*      if (aIn>0 && bIn>0)
         mul.start(aIn, bIn);
	  else if (aIn>0 && bIn<0)
         mul.start(aIn,-bIn);
	  else if (aIn<0 && bIn>0)
         mul.start(-aIn,bIn);
      else
         mul.start(-aIn,-bIn);
*/
      i <= 0;
   endmethod

   method Bit#(TAdd#(n,n)) result() if ( i == 0) ;
      if ( asign^bsign == 0)
         return mul.result;
	  else
         return (~mul.result)+1;
   endmethod 
endmodule
