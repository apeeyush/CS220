/*
 * Generated by Bluespec Compiler, version 2011.06.D (build 24470, 2011-06-30)
 * 
 * On Sun Feb  9 14:26:59 IST 2014
 * 
 */
#include "bluesim_primitives.h"
#include "mkTestBench.h"

namespace bluesim
{
  
  /* String declarations */
  static std::string const __str_literal_1("\ncycle %d", 9u);
  static std::string const __str_literal_3("%c", 2u);
  static std::string const __str_literal_2("%d", 2u);
  static std::string const __str_literal_5("FAILED %d\n", 10u);
  static std::string const __str_literal_4("PASSED\n", 7u);
  
  
  /* Constructor */
  MOD_mkTestBench::MOD_mkTestBench(char const *name, Module *parent)
    : Module(name, parent),
      __clk_handle_0(BAD_CLOCK_HANDLE),
      INST_cycle("cycle", this, 32u, 0u, (tUInt8)0u),
      INST_proc("proc", this),
      INST_state("state", this, 1u, (tUInt8)0u, (tUInt8)0u),
      PORT_RST_N((tUInt8)1u)
  {
    symbol_count = 6u;
    symbols = new tSym[symbol_count];
    init_symbols_0();
  }
  
  
  /* Symbol init fns */
  
  void MOD_mkTestBench::init_symbols_0()
  {
    init_symbol(&symbols[0u], "cycle", SYM_MODULE, &INST_cycle);
    init_symbol(&symbols[1u], "proc", SYM_MODULE, &INST_proc);
    init_symbol(&symbols[2u], "RL_countCycle", SYM_RULE);
    init_symbol(&symbols[3u], "RL_run", SYM_RULE);
    init_symbol(&symbols[4u], "RL_start", SYM_RULE);
    init_symbol(&symbols[5u], "state", SYM_MODULE, &INST_state);
  }
  
  
  /* Rule actions */
  
  void MOD_mkTestBench::RL_start()
  {
    INST_proc.METH_hostToCpu(4096u);
    INST_state.METH_write((tUInt8)1u);
  }
  
  void MOD_mkTestBench::RL_countCycle()
  {
    tUInt32 DEF_x__h266;
    tUInt32 DEF__read__h112;
    DEF__read__h112 = INST_cycle.METH_read();
    DEF_x__h266 = DEF__read__h112 + 1u;
    INST_cycle.METH_write(DEF_x__h266);
    if (!(PORT_RST_N == (tUInt8)0u))
      dollar_display(this, "s,32", &__str_literal_1, DEF__read__h112);
  }
  
  void MOD_mkTestBench::RL_run()
  {
    tUInt8 DEF_proc_cpuToHost_BITS_36_TO_32_0_EQ_21_4_AND_pro_ETC___d16;
    tUInt8 DEF_proc_cpuToHost_BITS_36_TO_32_0_EQ_21_4_AND_NOT_ETC___d18;
    tUInt8 DEF_proc_cpuToHost_BITS_36_TO_32_0_EQ_18___d11;
    tUInt8 DEF_proc_cpuToHost_BITS_36_TO_32_0_EQ_19___d13;
    tUInt8 DEF_proc_cpuToHost_BITS_36_TO_32_0_EQ_21___d14;
    tUInt8 DEF_proc_cpuToHost_BITS_31_TO_0_2_EQ_0___d15;
    tUInt8 DEF_idx__h315;
    tUInt32 DEF_data__h316;
    tUInt64 DEF_ab__h308;
    tUInt64 DEF_AVMeth_proc_cpuToHost;
    DEF_AVMeth_proc_cpuToHost = INST_proc.METH_cpuToHost();
    DEF_ab__h308 = DEF_AVMeth_proc_cpuToHost;
    DEF_data__h316 = (tUInt32)(DEF_ab__h308);
    DEF_idx__h315 = (tUInt8)(DEF_ab__h308 >> 32u);
    DEF_proc_cpuToHost_BITS_31_TO_0_2_EQ_0___d15 = DEF_data__h316 == 0u;
    DEF_proc_cpuToHost_BITS_36_TO_32_0_EQ_21___d14 = DEF_idx__h315 == (tUInt8)21u;
    DEF_proc_cpuToHost_BITS_36_TO_32_0_EQ_19___d13 = DEF_idx__h315 == (tUInt8)19u;
    DEF_proc_cpuToHost_BITS_36_TO_32_0_EQ_18___d11 = DEF_idx__h315 == (tUInt8)18u;
    DEF_proc_cpuToHost_BITS_36_TO_32_0_EQ_21_4_AND_NOT_ETC___d18 = DEF_proc_cpuToHost_BITS_36_TO_32_0_EQ_21___d14 && !DEF_proc_cpuToHost_BITS_31_TO_0_2_EQ_0___d15;
    DEF_proc_cpuToHost_BITS_36_TO_32_0_EQ_21_4_AND_pro_ETC___d16 = DEF_proc_cpuToHost_BITS_36_TO_32_0_EQ_21___d14 && DEF_proc_cpuToHost_BITS_31_TO_0_2_EQ_0___d15;
    if (!(PORT_RST_N == (tUInt8)0u))
    {
      if (DEF_proc_cpuToHost_BITS_36_TO_32_0_EQ_18___d11)
	dollar_fwrite(this, "32,s,32", 2147483650u, &__str_literal_2, DEF_data__h316);
      if (DEF_proc_cpuToHost_BITS_36_TO_32_0_EQ_19___d13)
	dollar_fwrite(this, "32,s,32", 2147483650u, &__str_literal_3, DEF_data__h316);
      if (DEF_proc_cpuToHost_BITS_36_TO_32_0_EQ_21_4_AND_pro_ETC___d16)
	dollar_fwrite(this, "32,s", 2147483650u, &__str_literal_4);
      if (DEF_proc_cpuToHost_BITS_36_TO_32_0_EQ_21_4_AND_NOT_ETC___d18)
	dollar_fwrite(this, "32,s,32", 2147483650u, &__str_literal_5, DEF_data__h316);
      if (DEF_proc_cpuToHost_BITS_36_TO_32_0_EQ_21___d14)
	dollar_finish("32", 1u);
    }
  }
  
  
  /* Methods */
  
  
  /* Reset routines */
  
  void MOD_mkTestBench::reset_RST_N(tUInt8 ARG_rst_in)
  {
    PORT_RST_N = ARG_rst_in;
    INST_state.reset_RST_N(ARG_rst_in);
    INST_proc.reset_RST_N(ARG_rst_in);
    INST_cycle.reset_RST_N(ARG_rst_in);
  }
  
  
  /* Static handles to reset routines */
  
  
  /* Functions for the parent module to register its reset fns */
  
  
  /* Functions to set the elaborated clock id */
  
  void MOD_mkTestBench::set_clk_0(char const *s)
  {
    __clk_handle_0 = bk_get_or_define_clock(s);
  }
  
  
  /* State dumping routine */
  void MOD_mkTestBench::dump_state(unsigned int indent)
  {
    printf("%*s%s:\n", indent, "", inst_name);
    INST_cycle.dump_state(indent + 2u);
    INST_proc.dump_state(indent + 2u);
    INST_state.dump_state(indent + 2u);
  }
  
  
  /* VCD dumping routines */
  
  unsigned int MOD_mkTestBench::dump_VCD_defs(unsigned int levels)
  {
    fprintf(vcd_file, "$scope module %s $end\n", inst_name);
    vcd_num = vcd_reserve_ids(3u);
    unsigned int num = vcd_num;
    for (unsigned int hdl = 0u; hdl < bk_num_clocks(); ++hdl)
      vcd_add_clock_def(this, bk_clock_name(hdl), bk_clock_vcd_num(hdl));
    vcd_write_def(bk_clock_vcd_num(__clk_handle_0), "CLK", 1u);
    vcd_write_def(num++, "RST_N", 1u);
    num = INST_cycle.dump_VCD_defs(num);
    num = INST_state.dump_VCD_defs(num);
    if (levels != 1u)
    {
      unsigned int l = levels == 0u ? 0u : levels - 1u;
      num = INST_proc.dump_VCD_defs(l);
    }
    fprintf(vcd_file, "$upscope $end\n");
    return num;
  }
  
  void MOD_mkTestBench::dump_VCD(tVCDDumpType dt, unsigned int levels, MOD_mkTestBench &backing)
  {
    vcd_defs(dt, backing);
    vcd_prims(dt, backing);
    if (levels != 1u)
      vcd_submodules(dt, levels - 1u, backing);
  }
  
  void MOD_mkTestBench::vcd_defs(tVCDDumpType dt, MOD_mkTestBench &backing)
  {
    unsigned int num = vcd_num;
    if (dt == VCD_DUMP_XS)
    {
      vcd_write_x(num++, 1u);
    }
    else
      if (dt == VCD_DUMP_CHANGES)
      {
	if ((backing.PORT_RST_N) != PORT_RST_N)
	{
	  vcd_write_val(num, PORT_RST_N, 1u);
	  backing.PORT_RST_N = PORT_RST_N;
	}
	++num;
      }
      else
      {
	vcd_write_val(num++, PORT_RST_N, 1u);
	backing.PORT_RST_N = PORT_RST_N;
      }
  }
  
  void MOD_mkTestBench::vcd_prims(tVCDDumpType dt, MOD_mkTestBench &backing)
  {
    INST_cycle.dump_VCD(dt, backing.INST_cycle);
    INST_state.dump_VCD(dt, backing.INST_state);
  }
  
  void MOD_mkTestBench::vcd_submodules(tVCDDumpType dt, unsigned int levels, MOD_mkTestBench &backing)
  {
    INST_proc.dump_VCD(dt, levels, backing.INST_proc);
  }
}
