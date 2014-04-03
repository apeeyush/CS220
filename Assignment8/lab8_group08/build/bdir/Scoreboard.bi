signature Scoreboard where {
import ¶FIFOF_®¶;
		
import ¶FIFOF®¶;
	       
import ¶FIFO®¶;
	      
import ¶List®¶;
	      
import ¶PrimArray®¶;
		   
import ¶Probe®¶;
	       
import ¶RWire®¶;
	       
import ¶Vector®¶;
		
import Ehr;
	  
import ¶FShow®¶;
	       
import Fifo;
	   
import Types;
	    
import MemTypes;
	       
import ProcTypes;
		
interface (Scoreboard.Scoreboard :: # -> *) size = {
    Scoreboard.insert :: ¶Prelude®¶.¶Maybe®¶ ProcTypes.FullIndx ->
			 ¶Prelude®¶.¶Action®¶ {-# arg_names = [r] #-};
    Scoreboard.remove :: ¶Prelude®¶.¶Action®¶ {-# arg_names = [] #-};
    Scoreboard.search1 :: ¶Prelude®¶.¶Maybe®¶ ProcTypes.FullIndx ->
			  ¶Prelude®¶.¶Bool®¶ {-# arg_names = [r] #-};
    Scoreboard.search2 :: ¶Prelude®¶.¶Maybe®¶ ProcTypes.FullIndx ->
			  ¶Prelude®¶.¶Bool®¶ {-# arg_names = [r] #-};
    Scoreboard.search3 :: ¶Prelude®¶.¶Maybe®¶ ProcTypes.FullIndx ->
			  ¶Prelude®¶.¶Bool®¶ {-# arg_names = [r] #-};
    Scoreboard.clear :: ¶Prelude®¶.¶Action®¶ {-# arg_names = [] #-}
};
 
instance Scoreboard ¶Prelude®¶.¶PrimMakeUndefined®¶ (Scoreboard.Scoreboard size);
										
instance Scoreboard ¶Prelude®¶.¶PrimDeepSeqCond®¶ (Scoreboard.Scoreboard size);
									      
instance Scoreboard ¶Prelude®¶.¶PrimMakeUninitialized®¶ (Scoreboard.Scoreboard size);
										    
Scoreboard.isFound :: ¶Prelude®¶.¶Maybe®¶ ProcTypes.FullIndx ->
		      ¶Prelude®¶.¶Maybe®¶ ProcTypes.FullIndx -> ¶Prelude®¶.¶Bool®¶;
										  
Scoreboard.mkCFScoreboard :: (¶Prelude®¶.¶IsModule®¶ _m__ _c__) =>
			     _m__ (Scoreboard.Scoreboard size);
							      
Scoreboard.mkPipelineScoreboard :: (¶Prelude®¶.¶IsModule®¶ _m__ _c__) =>
				   _m__ (Scoreboard.Scoreboard size);
								    
interface (Scoreboard.CountScoreboard :: # -> *) size = {
    Scoreboard.insert :: ¶Prelude®¶.¶Maybe®¶ ProcTypes.FullIndx ->
			 ¶Prelude®¶.¶Action®¶ {-# arg_names = [r] #-};
    Scoreboard.remove :: ¶Prelude®¶.¶Action®¶ {-# arg_names = [] #-};
    Scoreboard.search1 :: ¶Prelude®¶.¶Maybe®¶ ProcTypes.FullIndx ->
			  ¶Prelude®¶.¶Bit®¶ (¶Prelude®¶.¶TLog®¶ (¶Prelude®¶.¶TAdd®¶ size 1)) {-# arg_names = [r] #-};
    Scoreboard.search2 :: ¶Prelude®¶.¶Maybe®¶ ProcTypes.FullIndx ->
			  ¶Prelude®¶.¶Bit®¶ (¶Prelude®¶.¶TLog®¶ (¶Prelude®¶.¶TAdd®¶ size 1)) {-# arg_names = [r] #-};
    Scoreboard.search3 :: ¶Prelude®¶.¶Maybe®¶ ProcTypes.FullIndx ->
			  ¶Prelude®¶.¶Bit®¶ (¶Prelude®¶.¶TLog®¶ (¶Prelude®¶.¶TAdd®¶ size 1)) {-# arg_names = [r] #-};
    Scoreboard.clear :: ¶Prelude®¶.¶Action®¶ {-# arg_names = [] #-}
};
 
instance Scoreboard ¶Prelude®¶.¶PrimMakeUndefined®¶ (Scoreboard.CountScoreboard size);
										     
instance Scoreboard ¶Prelude®¶.¶PrimDeepSeqCond®¶ (Scoreboard.CountScoreboard size);
										   
instance Scoreboard ¶Prelude®¶.¶PrimMakeUninitialized®¶ (Scoreboard.CountScoreboard size);
											 
Scoreboard.mkCFCountScoreboard :: (¶Prelude®¶.¶IsModule®¶ _m__ _c__) =>
				  _m__ (Scoreboard.CountScoreboard size)
}
