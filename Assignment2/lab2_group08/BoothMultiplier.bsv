import MultiplierTypes::*;

module mkBoothMultiplyN (MultiplyN#(n))
   provisos (Add#(1, m, n));

   Reg#(Bit#(TAdd#(TAdd#(n,n),1))) a <- mkRegU();
   Reg#(Bit#(TAdd#(TAdd#(n,n),1))) s <- mkRegU();
   Reg#(Bit#(TAdd#(TAdd#(n,n),1))) p <- mkRegU();
   let nv = fromInteger(valueOf(n));
   Reg#(Bit#(TAdd#(TLog#(n),1))) i <- mkReg(nv);

   // You need to implement guards and bodies for methods


   rule mulStep if (i != nv);
      let tmp = a;
      if ( p[1]==0 && p[0]==1 ) 
         tmp = { (p+a)[nv+nv],(p+a)[nv+nv:1] };
      else if ( p[1]==1 && p[0]==0 ) 
         tmp = { (p+s)[nv+nv],(p+s)[nv+nv:1] };
      else
         tmp = { (p)[nv+nv],(p)[nv+nv:1] };
      p <= tmp;
      i <= i+1;
   endrule

   method Action start(Bit#(n) aIn, Bit#(n) bIn) if (i == nv);
      a <= {aIn,0};
      s <= {(-aIn),0};
      p <= {0,bIn,1'b0};
      i <= 0;
   endmethod

   method Bit#(TAdd#(n,n)) result() if (i == nv);
      return p[nv+nv:1];
   endmethod 
endmodule

/*
initialization:
  A = {m, 0}
  S = {(-m), 0}
  P = {0, r, 1’b0}
repeat n times:
  let pr = two least significant bits of P
  if ( pr == 01 }: P = P + A;
  if ( pr == 10 ): P = P + S;
      if ( pr == 00 or pr == 11}: do nothing;
  Arithmetically shift P one bit to the right;
res = 2n most significant bits of P;
*/
