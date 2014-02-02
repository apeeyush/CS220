signature MultiplierTypes where {
type (MultiplierTypes.DataSz :: #) = 16;
				       
type (MultiplierTypes.Data :: *) = ¶Prelude®¶.¶Bit®¶ MultiplierTypes.DataSz;
									   
type (MultiplierTypes.ResSz :: #) =
  ¶Prelude®¶.¶TAdd®¶ MultiplierTypes.DataSz MultiplierTypes.DataSz;
								  
type (MultiplierTypes.Res :: *) = ¶Prelude®¶.¶Bit®¶ MultiplierTypes.ResSz;
									 
type (MultiplierTypes.AccumSz :: #) = ¶Prelude®¶.¶TAdd®¶ MultiplierTypes.ResSz 1;
										
type (MultiplierTypes.Accum :: *) = ¶Prelude®¶.¶Bit®¶ MultiplierTypes.AccumSz;
									     
interface (MultiplierTypes.MultiplyN :: # -> *) n = {
    MultiplierTypes.start :: ¶Prelude®¶.¶Bit®¶ n ->
			     ¶Prelude®¶.¶Bit®¶ n -> ¶Prelude®¶.¶Action®¶ {-# arg_names = [a, b] #-};
    MultiplierTypes.result :: ¶Prelude®¶.¶Bit®¶ (¶Prelude®¶.¶TAdd®¶ n n) {-# arg_names = [] #-}
};
 
instance MultiplierTypes ¶Prelude®¶.¶PrimMakeUndefined®¶ (MultiplierTypes.MultiplyN n);
										      
instance MultiplierTypes ¶Prelude®¶.¶PrimDeepSeqCond®¶ (MultiplierTypes.MultiplyN n);
										    
instance MultiplierTypes ¶Prelude®¶.¶PrimMakeUninitialized®¶ (MultiplierTypes.MultiplyN n)
}
