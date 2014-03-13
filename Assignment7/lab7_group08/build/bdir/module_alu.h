/*
 * Generated by Bluespec Compiler, version 2011.06.D (build 24470, 2011-06-30)
 * 
 * On Thu Mar 13 22:31:31 IST 2014
 * 
 */

/* Generation options: */
#ifndef __module_alu_h__
#define __module_alu_h__

#include "bluesim_types.h"
#include "bs_module.h"
#include "bluesim_primitives.h"
#include "bs_vcd.h"

namespace bluesim
{
  
  /* Class declaration for the module_alu module */
  class MOD_module_alu : public Module {
   
   /* Clock handles */
   private:
   
   /* Instantiation parameters */
   public:
   
   /* Module state */
   public:
   
   /* Constructor */
   public:
    MOD_module_alu(char const *name, Module *parent);
   
   /* Symbol init methods */
   private:
    void init_symbols_0();
   
   /* Reset signal definitions */
   private:
   
   /* Port definitions */
   public:
   
   /* Publicly accessible definitions */
   public:
   
   /* Local definitions */
   private:
   
   /* Rules */
   public:
   
   /* Methods */
   public:
    tUInt32 METH_alu(tUInt32 ARG_alu_a, tUInt32 ARG_alu_b, tUInt8 ARG_alu_func);
    tUInt8 METH_RDY_alu();
   
   /* Reset routines */
   public:
   
   /* Static handles to reset routines */
   public:
   
   /* Pointers to reset fns in parent module for asserting output resets */
   private:
   
   /* Functions for the parent module to register its reset fns */
   public:
   
   /* Functions to set the elaborated clock id */
   public:
   
   /* State dumping routine */
   public:
    void dump_state(unsigned int indent);
   
   /* VCD dumping routines */
   public:
    unsigned int dump_VCD_defs(unsigned int levels);
    void dump_VCD(tVCDDumpType dt, unsigned int levels, MOD_module_alu &backing);
  };
}

#endif /* ifndef __module_alu_h__ */
