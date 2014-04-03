signature AddrPredict where {
import ¶FIFOF_®¶;
		
import ¶FIFOF®¶;
	       
import ¶FIFO®¶;
	      
import ¶List®¶;
	      
import ¶PrimArray®¶;
		   
import ¶Probe®¶;
	       
import ¶RegFile®¶;
		 
import ¶Vector®¶;
		
import ¶FShow®¶;
	       
import Types;
	    
import MemTypes;
	       
import ProcTypes;
		
interface (AddrPredict.AddrPred :: *) = {
    AddrPredict.predPc :: Types.Addr -> Types.Addr {-# arg_names = [pc] #-};
    AddrPredict.update :: ProcTypes.Redirect -> ¶Prelude®¶.¶Action®¶ {-# arg_names = [rd] #-}
};
 
instance AddrPredict ¶Prelude®¶.¶PrimMakeUndefined®¶ AddrPredict.AddrPred;
									 
instance AddrPredict ¶Prelude®¶.¶PrimDeepSeqCond®¶ AddrPredict.AddrPred;
								       
instance AddrPredict ¶Prelude®¶.¶PrimMakeUninitialized®¶ AddrPredict.AddrPred;
									     
AddrPredict.mkPcPlus4 :: (¶Prelude®¶.¶IsModule®¶ _m__ _c__) => _m__ AddrPredict.AddrPred;
											
type (AddrPredict.BtbEntries :: #) = 64;
				       
type (AddrPredict.BtbIndex :: *) = ¶Prelude®¶.¶Bit®¶ (¶Prelude®¶.¶TLog®¶ AddrPredict.BtbEntries);
												
type (AddrPredict.BtbTag :: *) =
  ¶Prelude®¶.¶Bit®¶
  (¶Prelude®¶.¶TSub®¶ (¶Prelude®¶.¶TSub®¶ Types.AddrSz (¶Prelude®¶.¶TLog®¶ AddrPredict.BtbEntries))
   2);
     
AddrPredict.mkBtb :: (¶Prelude®¶.¶IsModule®¶ _m__ _c__) => _m__ AddrPredict.AddrPred
}
