/*
 * Generated by Bluespec Compiler, version 2011.06.D (build 24470, 2011-06-30)
 * 
 * On Sun Feb  2 19:04:14 IST 2014
 * 
 */

/* Generation options: */
#ifndef __mkBoothTb_h__
#define __mkBoothTb_h__

#include "bluesim_types.h"
#include "bs_module.h"
#include "bluesim_primitives.h"
#include "bs_vcd.h"

namespace bluesim
{
  
  /* Class declaration for the mkBoothTb module */
  class MOD_mkBoothTb : public Module {
   
   /* Clock handles */
   private:
    tClock __clk_handle_0;
   
   /* Instantiation parameters */
   public:
   
   /* Module state */
   public:
    MOD_Reg<tUInt32> INST_deqCount;
    MOD_Reg<tUInt32> INST_enqCount;
    MOD_Reg<tUInt32> INST_f_data;
    MOD_Reg<tUInt32> INST_f_data_1;
    MOD_Reg<tUInt32> INST_f_data_2;
    MOD_Reg<tUInt32> INST_f_data_3;
    MOD_Wire<tUInt8> INST_f_deqEn_dummy;
    MOD_Reg<tUInt8> INST_f_deqEn_dummy2;
    MOD_Reg<tUInt8> INST_f_deqEn_dummy2_1;
    MOD_Reg<tUInt8> INST_f_deqEn_dummy2_2;
    MOD_Wire<tUInt8> INST_f_deqEn_dummy_1;
    MOD_Wire<tUInt8> INST_f_deqEn_dummy_2;
    MOD_Wire<tUInt8> INST_f_deqEn_dummy_3;
    MOD_Wire<tUInt8> INST_f_deqEn_dummy_4;
    MOD_Wire<tUInt8> INST_f_deqEn_dummy_5;
    MOD_Wire<tUInt8> INST_f_deqEn_dummy_6;
    MOD_Wire<tUInt8> INST_f_deqEn_dummy_7;
    MOD_Wire<tUInt8> INST_f_deqEn_dummy_8;
    MOD_Wire<tUInt8> INST_f_deqEn_lat;
    MOD_Wire<tUInt8> INST_f_deqEn_lat_1;
    MOD_Wire<tUInt8> INST_f_deqEn_lat_2;
    MOD_Reg<tUInt8> INST_f_deqEn_rl;
    MOD_Wire<tUInt8> INST_f_deqP_dummy;
    MOD_Reg<tUInt8> INST_f_deqP_dummy2;
    MOD_Reg<tUInt8> INST_f_deqP_dummy2_1;
    MOD_Reg<tUInt8> INST_f_deqP_dummy2_2;
    MOD_Wire<tUInt8> INST_f_deqP_dummy_1;
    MOD_Wire<tUInt8> INST_f_deqP_dummy_2;
    MOD_Wire<tUInt8> INST_f_deqP_dummy_3;
    MOD_Wire<tUInt8> INST_f_deqP_dummy_4;
    MOD_Wire<tUInt8> INST_f_deqP_dummy_5;
    MOD_Wire<tUInt8> INST_f_deqP_dummy_6;
    MOD_Wire<tUInt8> INST_f_deqP_dummy_7;
    MOD_Wire<tUInt8> INST_f_deqP_dummy_8;
    MOD_Wire<tUInt8> INST_f_deqP_lat;
    MOD_Wire<tUInt8> INST_f_deqP_lat_1;
    MOD_Wire<tUInt8> INST_f_deqP_lat_2;
    MOD_Reg<tUInt8> INST_f_deqP_rl;
    MOD_Wire<tUInt8> INST_f_enqEn_dummy;
    MOD_Reg<tUInt8> INST_f_enqEn_dummy2;
    MOD_Reg<tUInt8> INST_f_enqEn_dummy2_1;
    MOD_Reg<tUInt8> INST_f_enqEn_dummy2_2;
    MOD_Wire<tUInt8> INST_f_enqEn_dummy_1;
    MOD_Wire<tUInt8> INST_f_enqEn_dummy_2;
    MOD_Wire<tUInt8> INST_f_enqEn_dummy_3;
    MOD_Wire<tUInt8> INST_f_enqEn_dummy_4;
    MOD_Wire<tUInt8> INST_f_enqEn_dummy_5;
    MOD_Wire<tUInt8> INST_f_enqEn_dummy_6;
    MOD_Wire<tUInt8> INST_f_enqEn_dummy_7;
    MOD_Wire<tUInt8> INST_f_enqEn_dummy_8;
    MOD_Wire<tUInt8> INST_f_enqEn_lat;
    MOD_Wire<tUInt8> INST_f_enqEn_lat_1;
    MOD_Wire<tUInt8> INST_f_enqEn_lat_2;
    MOD_Reg<tUInt8> INST_f_enqEn_rl;
    MOD_Wire<tUInt8> INST_f_enqP_dummy;
    MOD_Reg<tUInt8> INST_f_enqP_dummy2;
    MOD_Reg<tUInt8> INST_f_enqP_dummy2_1;
    MOD_Reg<tUInt8> INST_f_enqP_dummy2_2;
    MOD_Wire<tUInt8> INST_f_enqP_dummy_1;
    MOD_Wire<tUInt8> INST_f_enqP_dummy_2;
    MOD_Wire<tUInt8> INST_f_enqP_dummy_3;
    MOD_Wire<tUInt8> INST_f_enqP_dummy_4;
    MOD_Wire<tUInt8> INST_f_enqP_dummy_5;
    MOD_Wire<tUInt8> INST_f_enqP_dummy_6;
    MOD_Wire<tUInt8> INST_f_enqP_dummy_7;
    MOD_Wire<tUInt8> INST_f_enqP_dummy_8;
    MOD_Wire<tUInt8> INST_f_enqP_lat;
    MOD_Wire<tUInt8> INST_f_enqP_lat_1;
    MOD_Wire<tUInt8> INST_f_enqP_lat_2;
    MOD_Reg<tUInt8> INST_f_enqP_rl;
    MOD_Wire<tUInt64> INST_f_tempData_dummy;
    MOD_Reg<tUInt8> INST_f_tempData_dummy2;
    MOD_Reg<tUInt8> INST_f_tempData_dummy2_1;
    MOD_Wire<tUInt64> INST_f_tempData_dummy_1;
    MOD_Wire<tUInt64> INST_f_tempData_dummy_2;
    MOD_Wire<tUInt64> INST_f_tempData_dummy_3;
    MOD_Wire<tUInt32> INST_f_tempData_lat;
    MOD_Wire<tUInt32> INST_f_tempData_lat_1;
    MOD_Reg<tUInt32> INST_f_tempData_rl;
    MOD_Wire<tUInt8> INST_f_tempEnqP_dummy;
    MOD_Reg<tUInt8> INST_f_tempEnqP_dummy2;
    MOD_Reg<tUInt8> INST_f_tempEnqP_dummy2_1;
    MOD_Wire<tUInt8> INST_f_tempEnqP_dummy_1;
    MOD_Wire<tUInt8> INST_f_tempEnqP_dummy_2;
    MOD_Wire<tUInt8> INST_f_tempEnqP_dummy_3;
    MOD_Wire<tUInt8> INST_f_tempEnqP_lat;
    MOD_Wire<tUInt8> INST_f_tempEnqP_lat_1;
    MOD_Reg<tUInt8> INST_f_tempEnqP_rl;
    MOD_Reg<tUInt64> INST_mult_a;
    MOD_Reg<tUInt8> INST_mult_i;
    MOD_Reg<tUInt64> INST_mult_p;
    MOD_Reg<tUInt64> INST_mult_s;
    MOD_Reg<tUInt8> INST_randomVal1_init;
    MOD_Reg<tUInt8> INST_randomVal2_init;
   
   /* Constructor */
   public:
    MOD_mkBoothTb(char const *name, Module *parent);
   
   /* Symbol init methods */
   private:
    void init_symbols_0();
   
   /* Reset signal definitions */
   private:
    tUInt8 PORT_RST_N;
   
   /* Port definitions */
   public:
   
   /* Publicly accessible definitions */
   public:
    tUInt8 DEF_f_deqEn_dummy2_2__h11741;
    tUInt8 DEF_f_enqEn_dummy2_2__h10238;
    tUInt32 DEF_x__h15872;
    tUInt32 DEF_x__h14887;
    tUInt8 DEF__read__h193;
    tUInt8 DEF_f_deqEn_rl__h7670;
    tUInt8 DEF_f_enqEn_rl__h6069;
   
   /* Local definitions */
   private:
    tUInt8 DEF_IF_f_tempEnqP_lat_whas__1_THEN_f_tempEnqP_lat__ETC___d271;
    tUInt8 DEF_IF_f_tempEnqP_lat_whas__1_THEN_NOT_f_tempEnqP__ETC___d259;
    tUInt8 DEF_f_deqEn_lat_1_whas____d288;
    tUInt8 DEF_f_enqEn_lat_1_whas____d286;
    tUInt32 DEF_TASK_getRandom___d179;
    tUInt32 DEF_TASK_getRandom___d174;
    tUInt64 DEF_mult_p__h15599;
    tUInt32 DEF_ab__h8773;
    tUInt32 DEF_ab__h8769;
    tUInt8 DEF_f_tempEnqP_rl___d296;
    tUInt8 DEF_f_tempEnqP_lat_wget____d283;
    tUInt8 DEF_upd__h15110;
    tUInt8 DEF_upd__h10861;
    tUInt8 DEF_upd__h10894;
    tUInt8 DEF_upd__h14458;
    tUInt8 DEF_upd__h10581;
    tUInt8 DEF_upd__h10614;
    tUInt8 DEF_f_tempEnqP_lat_whas____d289;
    tUInt8 DEF_f_deqEn_lat_1_wget____d281;
    tUInt8 DEF_f_deqEn_lat_whas____d287;
    tUInt8 DEF_f_deqEn_lat_wget____d280;
    tUInt8 DEF_f_enqEn_lat_1_wget____d279;
    tUInt8 DEF_f_enqEn_lat_whas____d285;
    tUInt8 DEF_f_enqEn_lat_wget____d278;
    tUInt8 DEF_f_deqP_dummy2_2__h10822;
    tUInt8 DEF_f_enqP_dummy2_2__h10542;
    tUInt32 DEF_res__h15368;
    tUInt8 DEF_f_tempEnqP_lat_wget__2_BITS_3_TO_0___d277;
    tUInt8 DEF_mult_p_BIT_32___h625;
    tUInt8 DEF_f_tempEnqP_rl_4_BIT_4___d295;
    tUInt8 DEF_f_tempEnqP_lat_wget__2_BIT_4___d294;
    std::string DEF_str4__h15625;
    std::string DEF_str2__h15623;
    std::string DEF_str1__h15622;
    std::string DEF_str3__h15624;
    tUInt32 DEF_IF_f_tempData_lat_whas__3_THEN_f_tempData_lat__ETC___d266;
    tUInt8 DEF_IF_f_tempEnqP_lat_whas__1_THEN_f_tempEnqP_lat__ETC___d276;
    tUInt8 DEF_IF_f_deqP_lat_1_whas__3_THEN_f_deqP_lat_1_wget_ETC___d274;
    tUInt8 DEF_IF_f_enqP_lat_1_whas__3_THEN_f_enqP_lat_1_wget_ETC___d272;
   
   /* Rules */
   public:
    void RL_mult_mulStep();
    void RL_randomVal1_initialize();
    void RL_randomVal2_initialize();
    void RL_f_enqP_canon();
    void RL_f_deqP_canon();
    void RL_f_enqEn_canon();
    void RL_f_deqEn_canon();
    void RL_f_tempData_canon();
    void RL_f_tempEnqP_canon();
    void RL_f_canonicalize();
    void RL_enq();
    void RL_deq();
    void RL_fin();
   
   /* Methods */
   public:
   
   /* Reset routines */
   public:
    void reset_RST_N(tUInt8 ARG_rst_in);
   
   /* Static handles to reset routines */
   public:
   
   /* Pointers to reset fns in parent module for asserting output resets */
   private:
   
   /* Functions for the parent module to register its reset fns */
   public:
   
   /* Functions to set the elaborated clock id */
   public:
    void set_clk_0(char const *s);
   
   /* State dumping routine */
   public:
    void dump_state(unsigned int indent);
   
   /* VCD dumping routines */
   public:
    unsigned int dump_VCD_defs(unsigned int levels);
    void dump_VCD(tVCDDumpType dt, unsigned int levels, MOD_mkBoothTb &backing);
    void vcd_defs(tVCDDumpType dt, MOD_mkBoothTb &backing);
    void vcd_prims(tVCDDumpType dt, MOD_mkBoothTb &backing);
  };
}

#endif /* ifndef __mkBoothTb_h__ */