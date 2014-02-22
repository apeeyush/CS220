signature Decode where {
import ¶FIFOF_®¶;
		
import ¶FIFOF®¶;
	       
import ¶FIFO®¶;
	      
import ¶List®¶;
	      
import ¶PrimArray®¶;
		   
import ¶Probe®¶;
	       
import ¶Vector®¶;
		
import ¶FShow®¶;
	       
import Types;
	    
import MemTypes;
	       
import ProcTypes;
		
interface (Decode.Interface_decode :: *) = {
    Decode.decode :: Types.Data -> ProcTypes.DecodedInst {-# arg_names = [inst] #-}
};
 
instance Decode ¶Prelude®¶.¶PrimMakeUndefined®¶ Decode.Interface_decode;
								       
instance Decode ¶Prelude®¶.¶PrimDeepSeqCond®¶ Decode.Interface_decode;
								     
instance Decode ¶Prelude®¶.¶PrimMakeUninitialized®¶ Decode.Interface_decode;
									   
Decode.module_decode :: ¶Prelude®¶.¶Module®¶ Decode.Interface_decode;
								    
Decode.decode :: Types.Data -> ProcTypes.DecodedInst
}
