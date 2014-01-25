signature BarrelShifterRight where {
import Multiplexer;
		  
interface (BarrelShifterRight.BarrelShifterRight :: *) = {
    BarrelShifterRight.rightShift :: ¶Prelude®¶.¶Bit®¶ 32 ->
				     ¶Prelude®¶.¶Bit®¶ 5 ->
				     ¶Prelude®¶.¶Bit®¶ 1 ->
				     ¶Prelude®¶.¶ActionValue®¶ (¶Prelude®¶.¶Bit®¶ 32) {-# arg_names = [val,
												       shiftAmt,
												       shiftValue] #-}
};
 
instance BarrelShifterRight ¶Prelude®¶.¶PrimMakeUndefined®¶ BarrelShifterRight.BarrelShifterRight;
												 
instance BarrelShifterRight ¶Prelude®¶.¶PrimDeepSeqCond®¶ BarrelShifterRight.BarrelShifterRight;
											       
instance BarrelShifterRight ¶Prelude®¶.¶PrimMakeUninitialized®¶
			    BarrelShifterRight.BarrelShifterRight;
								 
BarrelShifterRight.mkBarrelShifterRight :: (¶Prelude®¶.¶IsModule®¶ _m__ _c__) =>
					   _m__ BarrelShifterRight.BarrelShifterRight;
										     
interface (BarrelShifterRight.BarrelShifterRightLogical :: *) = {
    BarrelShifterRight.rightShift :: ¶Prelude®¶.¶Bit®¶ 32 ->
				     ¶Prelude®¶.¶Bit®¶ 5 ->
				     ¶Prelude®¶.¶ActionValue®¶ (¶Prelude®¶.¶Bit®¶ 32) {-# arg_names = [val,
												       shiftAmt] #-}
};
 
instance BarrelShifterRight ¶Prelude®¶.¶PrimMakeUndefined®¶
			    BarrelShifterRight.BarrelShifterRightLogical;
									
instance BarrelShifterRight ¶Prelude®¶.¶PrimDeepSeqCond®¶
			    BarrelShifterRight.BarrelShifterRightLogical;
									
instance BarrelShifterRight ¶Prelude®¶.¶PrimMakeUninitialized®¶
			    BarrelShifterRight.BarrelShifterRightLogical;
									
BarrelShifterRight.mkBarrelShifterRightLogical :: (¶Prelude®¶.¶IsModule®¶ _m__ _c__) =>
						  _m__ BarrelShifterRight.BarrelShifterRightLogical;
												   
type (BarrelShifterRight.BarrelShifterRightArithmetic :: *) =
  BarrelShifterRight.BarrelShifterRightLogical;
					      
BarrelShifterRight.mkBarrelShifterRightArithmetic :: (¶Prelude®¶.¶IsModule®¶ _m__ _c__) =>
						     _m__ BarrelShifterRight.BarrelShifterRightArithmetic
}
