signature Proc where {
import ¶ConfigReg®¶;
		   
import ¶FIFOF_®¶;
		
import ¶FIFOF®¶;
	       
import ¶FIFO®¶;
	      
import ¶List®¶;
	      
import ¶PrimArray®¶;
		   
import ¶Probe®¶;
	       
import ¶RWire®¶;
	       
import ¶RegFile®¶;
		 
import ¶Vector®¶;
		
import Ehr;
	  
import ¶FShow®¶;
	       
import Fifo;
	   
import Types;
	    
import MemTypes;
	       
import DMemory;
	      
import IMemory;
	      
import ProcTypes;
		
import Cop;
	  
import Decode;
	     
import Exec;
	   
import RFile;
	    
data (Proc.State :: *) = Proc.Fetch () | Proc.Execute ();
							
instance Proc ¶Prelude®¶.¶PrimMakeUndefined®¶ Proc.State;
							
instance Proc ¶Prelude®¶.¶PrimDeepSeqCond®¶ Proc.State;
						      
instance Proc ¶Prelude®¶.¶PrimMakeUninitialized®¶ Proc.State;
							    
instance Proc ¶Prelude®¶.¶Bits®¶ Proc.State 1;
					     
instance Proc ¶Prelude®¶.¶Eq®¶ Proc.State;
					 
Proc.mkProc :: (¶Prelude®¶.¶IsModule®¶ _m__ _c__) => _m__ ProcTypes.Proc
}
