signature TestBench where {
import ¶List®¶;
	      
import MultiplierTypes;
		      
import BoothMultiplier;
		      
import Multiplier;
		 
import ¶PrimArray®¶;
		   
import ¶RWire®¶;
	       
import SignedMultiplier;
		       
import ¶Vector®¶;
		
import Ehr;
	  
import Fifo;
	   
import Rand;
	   
TestBench.mkTestBenchSigned :: (¶Prelude®¶.¶IsModule®¶ _m__ _c__) =>
			       MultiplierTypes.MultiplyN MultiplierTypes.DataSz ->
			       ¶Prelude®¶.¶Bool®¶ -> _m__ ¶Prelude®¶.¶Empty®¶;
									     
TestBench.mkDefaultTb :: (¶Prelude®¶.¶IsModule®¶ _m__ _c__) => _m__ ¶Prelude®¶.¶Empty®¶;
										       
TestBench.mkSignedTb :: (¶Prelude®¶.¶IsModule®¶ _m__ _c__) => _m__ ¶Prelude®¶.¶Empty®¶;
										      
TestBench.mkBoothTb :: (¶Prelude®¶.¶IsModule®¶ _m__ _c__) => _m__ ¶Prelude®¶.¶Empty®¶
}
