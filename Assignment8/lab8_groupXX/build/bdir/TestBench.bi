signature TestBench where {
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
		
import AddrPredict;
		  
import Cop;
	  
import Decode;
	     
import DirPredict;
		 
import Exec;
	   
import RFile;
	    
import Scoreboard;
		 
import Proc;
	   
data (TestBench.State :: *) = TestBench.Start () | TestBench.Run ();
								   
instance TestBench ¶Prelude®¶.¶PrimMakeUndefined®¶ TestBench.State;
								  
instance TestBench ¶Prelude®¶.¶PrimDeepSeqCond®¶ TestBench.State;
								
instance TestBench ¶Prelude®¶.¶PrimMakeUninitialized®¶ TestBench.State;
								      
instance TestBench ¶Prelude®¶.¶Bits®¶ TestBench.State 1;
						       
instance TestBench ¶Prelude®¶.¶Eq®¶ TestBench.State;
						   
TestBench.mkTestBench :: (¶Prelude®¶.¶IsModule®¶ _m__ _c__) => _m__ ¶Prelude®¶.¶Empty®¶
}
