import MultiplierTypes::*;

module mkSignedMultiplyN (MultiplyN#(n))
   provisos (Add#(1, m, n));
   
   
   // You need to implement guards and bodies for methods
   
   method Action start(Bit#(n) aIn, Bit#(n) bIn) /* if (...) */;
      // ??
   endmethod

   method Bit#(TAdd#(n,n)) result() /* if (...) */;
      return -1; // garbage - you need to implement this
   endmethod 
endmodule
