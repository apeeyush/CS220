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
		
import AddrPredict;
		  
import Cop;
	  
import Decode;
	     
import DirPredict;
		 
import Exec;
	   
import RFile;
	    
import Scoreboard;
		 
struct (Proc.Fetch2Decode :: *) = {
    Proc.pc :: Types.Addr;
    Proc.ppc :: Types.Addr;
    Proc.dEpoch :: ¶Prelude®¶.¶Bool®¶;
    Proc.eEpoch :: ¶Prelude®¶.¶Bool®¶;
    Proc.inst :: Types.Data
};
 
instance Proc ¶Prelude®¶.¶PrimMakeUndefined®¶ Proc.Fetch2Decode;
							       
instance Proc ¶Prelude®¶.¶PrimDeepSeqCond®¶ Proc.Fetch2Decode;
							     
instance Proc ¶Prelude®¶.¶PrimMakeUninitialized®¶ Proc.Fetch2Decode;
								   
instance Proc ¶Prelude®¶.¶Bits®¶ Proc.Fetch2Decode 98;
						     
instance Proc ¶Prelude®¶.¶Eq®¶ Proc.Fetch2Decode;
						
struct (Proc.Decode2RegRead :: *) = {
    Proc.pc :: Types.Addr;
    Proc.ppc :: Types.Addr;
    Proc.epoch :: ¶Prelude®¶.¶Bool®¶;
    Proc.dInst :: ProcTypes.DecodedInst
};
 
instance Proc ¶Prelude®¶.¶PrimMakeUndefined®¶ Proc.Decode2RegRead;
								 
instance Proc ¶Prelude®¶.¶PrimDeepSeqCond®¶ Proc.Decode2RegRead;
							       
instance Proc ¶Prelude®¶.¶PrimMakeUninitialized®¶ Proc.Decode2RegRead;
								     
instance Proc ¶Prelude®¶.¶Bits®¶ Proc.Decode2RegRead 130;
							
instance Proc ¶Prelude®¶.¶Eq®¶ Proc.Decode2RegRead;
						  
struct (Proc.RegRead2Exec :: *) = {
    Proc.pc :: Types.Addr;
    Proc.ppc :: Types.Addr;
    Proc.epoch :: ¶Prelude®¶.¶Bool®¶;
    Proc.dInst :: ProcTypes.DecodedInst;
    Proc.rVal1 :: Types.Data;
    Proc.rVal2 :: Types.Data;
    Proc.copVal :: Types.Data
};
 
instance Proc ¶Prelude®¶.¶PrimMakeUndefined®¶ Proc.RegRead2Exec;
							       
instance Proc ¶Prelude®¶.¶PrimDeepSeqCond®¶ Proc.RegRead2Exec;
							     
instance Proc ¶Prelude®¶.¶PrimMakeUninitialized®¶ Proc.RegRead2Exec;
								   
instance Proc ¶Prelude®¶.¶Bits®¶ Proc.RegRead2Exec 226;
						      
instance Proc ¶Prelude®¶.¶Eq®¶ Proc.RegRead2Exec;
						
struct (Proc.Exec2Mem :: *) = {
    Proc.poisoned :: ¶Prelude®¶.¶Bool®¶;
    Proc.iType :: ProcTypes.IType;
    Proc.dst :: ¶Prelude®¶.¶Maybe®¶ ProcTypes.FullIndx;
    Proc.¡data¡ :: Types.Data;
    Proc.addr :: Types.Addr
};
 
instance Proc ¶Prelude®¶.¶PrimMakeUndefined®¶ Proc.Exec2Mem;
							   
instance Proc ¶Prelude®¶.¶PrimDeepSeqCond®¶ Proc.Exec2Mem;
							 
instance Proc ¶Prelude®¶.¶PrimMakeUninitialized®¶ Proc.Exec2Mem;
							       
instance Proc ¶Prelude®¶.¶Bits®¶ Proc.Exec2Mem 76;
						 
instance Proc ¶Prelude®¶.¶Eq®¶ Proc.Exec2Mem;
					    
struct (Proc.Mem2Wb :: *) = {
    Proc.poisoned :: ¶Prelude®¶.¶Bool®¶;
    Proc.dst :: ¶Prelude®¶.¶Maybe®¶ ProcTypes.FullIndx;
    Proc.¡data¡ :: Types.Data
};
 
instance Proc ¶Prelude®¶.¶PrimMakeUndefined®¶ Proc.Mem2Wb;
							 
instance Proc ¶Prelude®¶.¶PrimDeepSeqCond®¶ Proc.Mem2Wb;
						       
instance Proc ¶Prelude®¶.¶PrimMakeUninitialized®¶ Proc.Mem2Wb;
							     
instance Proc ¶Prelude®¶.¶Bits®¶ Proc.Mem2Wb 40;
					       
instance Proc ¶Prelude®¶.¶Eq®¶ Proc.Mem2Wb;
					  
Proc.mkProc :: ¶Prelude®¶.¶Module®¶ ProcTypes.Proc
}
