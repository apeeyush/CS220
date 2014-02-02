/*
 * Generated by Bluespec Compiler, version 2011.06.D (build 24470, 2011-06-30)
 * 
 * On Sun Feb  2 16:46:22 IST 2014
 * 
 */

/* Generation options: */
#ifndef __mkSignedTb_h__
#define __mkSignedTb_h__

#include "bluesim_types.h"
#include "bs_module.h"
#include "bluesim_primitives.h"
#include "bs_vcd.h"

namespace bluesim
{
  
  /* Class declaration for the mkSignedTb module */
  class MOD_mkSignedTb : public Module {
   
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
    MOD_Reg<tUInt32> INST_mult_a;
    MOD_Reg<tUInt8> INST_mult_asign;
    MOD_Reg<tUInt32> INST_mult_b;
    MOD_Reg<tUInt8> INST_mult_bsign;
    MOD_Reg<tUInt32> INST_mult_i;
    MOD_Reg<tUInt32> INST_mult_mul_a;
    MOD_Reg<tUInt32> INST_mult_mul_b;
    MOD_Reg<tUInt8> INST_mult_mul_i;
    MOD_Reg<tUInt32> INST_mult_mul_prod;
    MOD_Reg<tUInt32> INST_mult_mul_tp;
    MOD_Reg<tUInt32> INST_mult_res;
    MOD_Reg<tUInt8> INST_randomVal1_init;
    MOD_Reg<tUInt8> INST_randomVal2_init;
   
   /* Constructor */
   public:
    MOD_mkSignedTb(char const *name, Module *parent);
   
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
    tUInt8 DEF_f_deqEn_dummy2_2__h15726;
    tUInt8 DEF_f_enqEn_dummy2_2__h14223;
    tUInt32 DEF_x__h20608;
    tUInt32 DEF_x__h19659;
    tUInt8 DEF__read__h242;
    tUInt8 DEF_f_deqEn_rl__h11655;
    tUInt8 DEF_f_enqEn_rl__h10054;
   
   /* Local definitions */
   private:
    tUInt8 DEF_mult_asign__h18545;
    tUInt8 DEF_mult_bsign__h18550;
    tUInt8 DEF_IF_f_tempEnqP_lat_whas__88_THEN_f_tempEnqP_lat_ETC___d389;
    tUInt8 DEF_IF_f_tempEnqP_lat_whas__88_THEN_NOT_f_tempEnqP_ETC___d384;
    tUInt8 DEF_f_deqEn_lat_1_whas____d413;
    tUInt8 DEF_f_enqEn_lat_1_whas____d411;
    tUInt32 DEF_TASK_getRandom___d409;
    tUInt32 DEF_TASK_getRandom___d408;
    tUInt32 DEF_ab__h12758;
    tUInt32 DEF_ab__h12754;
    tUInt32 DEF_mult_mul_tp__h3534;
    tUInt32 DEF__read__h155;
    tUInt8 DEF_f_tempEnqP_rl___d423;
    tUInt8 DEF_f_tempEnqP_lat_wget____d406;
    tUInt8 DEF_upd__h19882;
    tUInt8 DEF_upd__h14846;
    tUInt8 DEF_upd__h14879;
    tUInt8 DEF_upd__h19230;
    tUInt8 DEF_upd__h14566;
    tUInt8 DEF_upd__h14599;
    tUInt8 DEF_f_tempEnqP_lat_whas____d414;
    tUInt8 DEF_f_deqEn_lat_1_wget____d404;
    tUInt8 DEF_f_deqEn_lat_whas____d412;
    tUInt8 DEF_f_deqEn_lat_wget____d403;
    tUInt8 DEF_f_enqEn_lat_1_wget____d402;
    tUInt8 DEF_f_enqEn_lat_whas____d410;
    tUInt8 DEF_f_enqEn_lat_wget____d401;
    tUInt8 DEF_f_deqP_dummy2_2__h14807;
    tUInt8 DEF_f_enqP_dummy2_2__h14527;
    tUInt8 DEF_f_tempEnqP_lat_wget__89_BITS_3_TO_0___d400;
    tUInt8 DEF_f_tempEnqP_rl_91_BIT_4___d420;
    tUInt8 DEF_f_tempEnqP_lat_wget__89_BIT_4___d419;
    std::string DEF_str3__h20362;
    std::string DEF_str4__h20363;
    std::string DEF_str2__h20361;
    std::string DEF_str1__h20360;
    tUInt32 DEF_IF_f_tempData_lat_whas__80_THEN_f_tempData_lat_ETC___d393;
    tUInt8 DEF_IF_f_tempEnqP_lat_whas__88_THEN_f_tempEnqP_lat_ETC___d398;
    tUInt8 DEF_IF_f_deqP_lat_1_whas__50_THEN_f_deqP_lat_1_wge_ETC___d396;
    tUInt8 DEF_IF_f_enqP_lat_1_whas__40_THEN_f_enqP_lat_1_wge_ETC___d394;
   
   /* Rules */
   public:
    void RL_mult_mul_mulStep();
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
    void dump_VCD(tVCDDumpType dt, unsigned int levels, MOD_mkSignedTb &backing);
    void vcd_defs(tVCDDumpType dt, MOD_mkSignedTb &backing);
    void vcd_prims(tVCDDumpType dt, MOD_mkSignedTb &backing);
  };
}

#endif /* ifndef __mkSignedTb_h__ */
