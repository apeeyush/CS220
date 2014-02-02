signature Rand where {
import ¶List®¶;
	      
import ¶PrimArray®¶;
		   
import ¶Vector®¶;
		
Rand.setSeed :: ¶Prelude®¶.¶Bit®¶ 32 -> ¶Prelude®¶.¶Action®¶;
							    
Rand.getRandom :: ¶Prelude®¶.¶ActionValue®¶ (¶Prelude®¶.¶Bit®¶ 32);
								  
interface (Rand.Rand :: # -> *) n = {
    Rand.get :: ¶Prelude®¶.¶ActionValue®¶ (¶Prelude®¶.¶Bit®¶ n) {-# arg_names = [] #-}
};
 
instance Rand ¶Prelude®¶.¶PrimMakeUndefined®¶ (Rand.Rand n);
							   
instance Rand ¶Prelude®¶.¶PrimDeepSeqCond®¶ (Rand.Rand n);
							 
instance Rand ¶Prelude®¶.¶PrimMakeUninitialized®¶ (Rand.Rand n);
							       
Rand.mkRand :: (¶Prelude®¶.¶Add®¶ a n (¶Prelude®¶.¶TMul®¶ num 32),
		Prelude.Div n 32 num,
		¶Prelude®¶.¶IsModule®¶ _m__ _c__) =>
	       ¶Prelude®¶.¶Bit®¶ 32 -> _m__ (Rand.Rand n)
}
