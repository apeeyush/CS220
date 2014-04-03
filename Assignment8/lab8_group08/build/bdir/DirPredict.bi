signature DirPredict where {
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
		
interface (DirPredict.DirPred :: *) = {
    DirPredict.predDir :: Types.Addr -> ¶Prelude®¶.¶Bool®¶ {-# arg_names = [pc] #-};
    DirPredict.update :: ProcTypes.Redirect -> ¶Prelude®¶.¶Action®¶ {-# arg_names = [rd] #-}
};
 
instance DirPredict ¶Prelude®¶.¶PrimMakeUndefined®¶ DirPredict.DirPred;
								      
instance DirPredict ¶Prelude®¶.¶PrimDeepSeqCond®¶ DirPredict.DirPred;
								    
instance DirPredict ¶Prelude®¶.¶PrimMakeUninitialized®¶ DirPredict.DirPred;
									  
type (DirPredict.CounterPredEntries :: #) = 1024;
						
type (DirPredict.CounterPredTag :: *) =
  ¶Prelude®¶.¶Bit®¶
  (¶Prelude®¶.¶TSub®¶
   (¶Prelude®¶.¶TSub®¶ Types.AddrSz (¶Prelude®¶.¶TLog®¶ DirPredict.CounterPredEntries))
   2);
     
type (DirPredict.CounterPredIndex :: *) =
  ¶Prelude®¶.¶Bit®¶ (¶Prelude®¶.¶TLog®¶ DirPredict.CounterPredEntries);
								      
DirPredict.mkNoDirPred :: (¶Prelude®¶.¶IsModule®¶ _m__ _c__) => _m__ DirPredict.DirPred;
										       
DirPredict.mkCounterPred2Bit :: (¶Prelude®¶.¶IsModule®¶ _m__ _c__) => _m__ DirPredict.DirPred
}
