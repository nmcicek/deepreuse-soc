// See LICENSE.SiFive for license details.
// See LICENSE.Berkeley for license details.

#include "verilated.h"
#if VM_TRACE
#include <memory>
#include "verilated_vcd_c.h"
#endif
#include <iostream>
#include <fcntl.h>
#include <signal.h>
#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <getopt.h>
#include <fstream>
#include <string>
#include <sstream>
#include <algorithm>
#include <iterator>
#include <random>


static uint64_t trace_count = 0;
bool verbose;
bool done_reset;
extern int dramsim;

using namespace std;

unsigned int main_time = 0;     // Current simulation time

extern "C" int vpi_get_vlog_info(void* arg)
{
  return 0;
}

double sc_time_stamp () {       // Called by $time in Verilog
    return main_time;
}

int main(int argc, char** argv)
{
  unsigned random_seed = (unsigned)time(NULL) ^ (unsigned)getpid();
  uint64_t max_cycles = 10000000;
  int ret = 0;

#if VM_TRACE
  FILE * vcdfile = NULL;
  uint64_t start = 0;
  vcdfile = fopen("out.vcd","w");
#endif

  verbose = true;
  bool dump;
  fprintf(stderr, "using random seed %u\n", random_seed);

  srand(random_seed);
  srand48(random_seed);

  Verilated::randReset(2);
  Verilated::commandArgs(argc, argv);
  TEST_HARNESS *tile = new TEST_HARNESS;

#if VM_TRACE
  Verilated::traceEverOn(true); // Verilator must compute traced signals
  std::unique_ptr<VerilatedVcdFILE> vcdfd(new VerilatedVcdFILE(vcdfile));
  std::unique_ptr<VerilatedVcdC> tfp(new VerilatedVcdC(vcdfd.get()));
  if (vcdfile) {
    tile->trace(tfp.get(), 99);  // Trace 99 levels of hierarchy
    tfp->open("");
  }
#endif

  tile->lshIO_readID_valid = false;
  tile->lshIO_readCentroid_valid = false;
  tile->lshIO_readValArr_valid = false;
  tile->lshIO_clearMem_valid = false;

  // reset for several cycles to handle pipelined reset
  tile->reset = 1;
  for(int i=0; i<100; i++){
    tile->clock = 0;
    tile->eval();
    main_time++;            // Time passes...
#if VM_TRACE
    dump = tfp && trace_count >= start;
    if (dump)
      tfp->dump(static_cast<vluint64_t>(trace_count * 2));
#endif

    tile->clock = 1;
    tile->eval();    
    main_time++;            // Time passes...
#if VM_TRACE
    if (dump)
      tfp->dump(static_cast<vluint64_t>(trace_count * 2 + 1));
#endif
    //trace_count ++;
  }
  tile->reset = 0;
  done_reset = true;

  cout << "Resetted tile for several cycles." << endl;
  
  while(!tile->lshIO_resetDone){
    tile->clock = 0;
    tile->eval();
    main_time++;            // Time passes...
#if VM_TRACE
    dump = tfp && trace_count >= start;
    if (dump)
      tfp->dump(static_cast<vluint64_t>(trace_count * 2));
#endif
    tile->clock = 1;
    tile->eval();
    main_time++;            // Time passes...
#if VM_TRACE
    if (dump)
      tfp->dump(static_cast<vluint64_t>(trace_count * 2 + 1));
#endif
    //trace_count++;
  }

  cout << "Reset done! All memories are ready." << endl;
  
  // generate random 32-bit numbers
  random_device rd;
  default_random_engine generator(rd());
  uniform_int_distribution<long unsigned> distribution8(0,0xFF);

  // hash table inputs
  tile->lshIO_hash_table_valid = true;
  tile->lshIO_hash_table_bits_0_0 = distribution8(generator);
  tile->lshIO_hash_table_bits_0_1 = distribution8(generator);
  tile->lshIO_hash_table_bits_0_2 = distribution8(generator);
  tile->lshIO_hash_table_bits_0_3 = distribution8(generator);
  tile->lshIO_hash_table_bits_0_4 = distribution8(generator);
  tile->lshIO_hash_table_bits_0_5 = distribution8(generator);
  tile->lshIO_hash_table_bits_0_6 = distribution8(generator);
  tile->lshIO_hash_table_bits_0_7 = distribution8(generator);
  tile->lshIO_hash_table_bits_0_8 = distribution8(generator);
  tile->lshIO_hash_table_bits_0_9 = distribution8(generator);
  tile->lshIO_hash_table_bits_1_0 = distribution8(generator);
  tile->lshIO_hash_table_bits_1_1 = distribution8(generator);
  tile->lshIO_hash_table_bits_1_2 = distribution8(generator);
  tile->lshIO_hash_table_bits_1_3 = distribution8(generator);
  tile->lshIO_hash_table_bits_1_4 = distribution8(generator);
  tile->lshIO_hash_table_bits_1_5 = distribution8(generator);
  tile->lshIO_hash_table_bits_1_6 = distribution8(generator);
  tile->lshIO_hash_table_bits_1_7 = distribution8(generator);
  tile->lshIO_hash_table_bits_1_8 = distribution8(generator);
  tile->lshIO_hash_table_bits_1_9 = distribution8(generator);
  tile->lshIO_hash_table_bits_2_0 = distribution8(generator);
  tile->lshIO_hash_table_bits_2_1 = distribution8(generator);
  tile->lshIO_hash_table_bits_2_2 = distribution8(generator);
  tile->lshIO_hash_table_bits_2_3 = distribution8(generator);
  tile->lshIO_hash_table_bits_2_4 = distribution8(generator);
  tile->lshIO_hash_table_bits_2_5 = distribution8(generator);
  tile->lshIO_hash_table_bits_2_6 = distribution8(generator);
  tile->lshIO_hash_table_bits_2_7 = distribution8(generator);
  tile->lshIO_hash_table_bits_2_8 = distribution8(generator);
  tile->lshIO_hash_table_bits_2_9 = distribution8(generator);
  tile->lshIO_hash_table_bits_3_0 = distribution8(generator);
  tile->lshIO_hash_table_bits_3_1 = distribution8(generator);
  tile->lshIO_hash_table_bits_3_2 = distribution8(generator);
  tile->lshIO_hash_table_bits_3_3 = distribution8(generator);
  tile->lshIO_hash_table_bits_3_4 = distribution8(generator);
  tile->lshIO_hash_table_bits_3_5 = distribution8(generator);
  tile->lshIO_hash_table_bits_3_6 = distribution8(generator);
  tile->lshIO_hash_table_bits_3_7 = distribution8(generator);
  tile->lshIO_hash_table_bits_3_8 = distribution8(generator);
  tile->lshIO_hash_table_bits_3_9 = distribution8(generator);
  tile->lshIO_hash_table_bits_4_0 = distribution8(generator);
  tile->lshIO_hash_table_bits_4_1 = distribution8(generator);
  tile->lshIO_hash_table_bits_4_2 = distribution8(generator);
  tile->lshIO_hash_table_bits_4_3 = distribution8(generator);
  tile->lshIO_hash_table_bits_4_4 = distribution8(generator);
  tile->lshIO_hash_table_bits_4_5 = distribution8(generator);
  tile->lshIO_hash_table_bits_4_6 = distribution8(generator);
  tile->lshIO_hash_table_bits_4_7 = distribution8(generator);
  tile->lshIO_hash_table_bits_4_8 = distribution8(generator);
  tile->lshIO_hash_table_bits_4_9 = distribution8(generator);
  tile->lshIO_hash_table_bits_5_0 = distribution8(generator);
  tile->lshIO_hash_table_bits_5_1 = distribution8(generator);
  tile->lshIO_hash_table_bits_5_2 = distribution8(generator);
  tile->lshIO_hash_table_bits_5_3 = distribution8(generator);
  tile->lshIO_hash_table_bits_5_4 = distribution8(generator);
  tile->lshIO_hash_table_bits_5_5 = distribution8(generator);
  tile->lshIO_hash_table_bits_5_6 = distribution8(generator);
  tile->lshIO_hash_table_bits_5_7 = distribution8(generator);
  tile->lshIO_hash_table_bits_5_8 = distribution8(generator);
  tile->lshIO_hash_table_bits_5_9 = distribution8(generator);
  tile->lshIO_hash_table_bits_6_0 = distribution8(generator);
  tile->lshIO_hash_table_bits_6_1 = distribution8(generator);
  tile->lshIO_hash_table_bits_6_2 = distribution8(generator);
  tile->lshIO_hash_table_bits_6_3 = distribution8(generator);
  tile->lshIO_hash_table_bits_6_4 = distribution8(generator);
  tile->lshIO_hash_table_bits_6_5 = distribution8(generator);
  tile->lshIO_hash_table_bits_6_6 = distribution8(generator);
  tile->lshIO_hash_table_bits_6_7 = distribution8(generator);
  tile->lshIO_hash_table_bits_6_8 = distribution8(generator);
  tile->lshIO_hash_table_bits_6_9 = distribution8(generator);
  tile->lshIO_hash_table_bits_7_0 = distribution8(generator);
  tile->lshIO_hash_table_bits_7_1 = distribution8(generator);
  tile->lshIO_hash_table_bits_7_2 = distribution8(generator);
  tile->lshIO_hash_table_bits_7_3 = distribution8(generator);
  tile->lshIO_hash_table_bits_7_4 = distribution8(generator);
  tile->lshIO_hash_table_bits_7_5 = distribution8(generator);
  tile->lshIO_hash_table_bits_7_6 = distribution8(generator);
  tile->lshIO_hash_table_bits_7_7 = distribution8(generator);
  tile->lshIO_hash_table_bits_7_8 = distribution8(generator);
  tile->lshIO_hash_table_bits_7_9 = distribution8(generator);
  tile->lshIO_hash_table_bits_8_0 = distribution8(generator);
  tile->lshIO_hash_table_bits_8_1 = distribution8(generator);
  tile->lshIO_hash_table_bits_8_2 = distribution8(generator);
  tile->lshIO_hash_table_bits_8_3 = distribution8(generator);
  tile->lshIO_hash_table_bits_8_4 = distribution8(generator);
  tile->lshIO_hash_table_bits_8_5 = distribution8(generator);
  tile->lshIO_hash_table_bits_8_6 = distribution8(generator);
  tile->lshIO_hash_table_bits_8_7 = distribution8(generator);
  tile->lshIO_hash_table_bits_8_8 = distribution8(generator);
  tile->lshIO_hash_table_bits_8_9 = distribution8(generator);
  tile->lshIO_hash_table_bits_9_0 = distribution8(generator);
  tile->lshIO_hash_table_bits_9_1 = distribution8(generator);
  tile->lshIO_hash_table_bits_9_2 = distribution8(generator);
  tile->lshIO_hash_table_bits_9_3 = distribution8(generator);
  tile->lshIO_hash_table_bits_9_4 = distribution8(generator);
  tile->lshIO_hash_table_bits_9_5 = distribution8(generator);
  tile->lshIO_hash_table_bits_9_6 = distribution8(generator);
  tile->lshIO_hash_table_bits_9_7 = distribution8(generator);
  tile->lshIO_hash_table_bits_9_8 = distribution8(generator);
  tile->lshIO_hash_table_bits_9_9 = distribution8(generator);
  tile->lshIO_hash_table_bits_10_0 = distribution8(generator);
  tile->lshIO_hash_table_bits_10_1 = distribution8(generator);
  tile->lshIO_hash_table_bits_10_2 = distribution8(generator);
  tile->lshIO_hash_table_bits_10_3 = distribution8(generator);
  tile->lshIO_hash_table_bits_10_4 = distribution8(generator);
  tile->lshIO_hash_table_bits_10_5 = distribution8(generator);
  tile->lshIO_hash_table_bits_10_6 = distribution8(generator);
  tile->lshIO_hash_table_bits_10_7 = distribution8(generator);
  tile->lshIO_hash_table_bits_10_8 = distribution8(generator);
  tile->lshIO_hash_table_bits_10_9 = distribution8(generator);
  tile->lshIO_hash_table_bits_11_0 = distribution8(generator);
  tile->lshIO_hash_table_bits_11_1 = distribution8(generator);
  tile->lshIO_hash_table_bits_11_2 = distribution8(generator);
  tile->lshIO_hash_table_bits_11_3 = distribution8(generator);
  tile->lshIO_hash_table_bits_11_4 = distribution8(generator);
  tile->lshIO_hash_table_bits_11_5 = distribution8(generator);
  tile->lshIO_hash_table_bits_11_6 = distribution8(generator);
  tile->lshIO_hash_table_bits_11_7 = distribution8(generator);
  tile->lshIO_hash_table_bits_11_8 = distribution8(generator);
  tile->lshIO_hash_table_bits_11_9 = distribution8(generator);
  tile->lshIO_hash_table_bits_12_0 = distribution8(generator);
  tile->lshIO_hash_table_bits_12_1 = distribution8(generator);
  tile->lshIO_hash_table_bits_12_2 = distribution8(generator);
  tile->lshIO_hash_table_bits_12_3 = distribution8(generator);
  tile->lshIO_hash_table_bits_12_4 = distribution8(generator);
  tile->lshIO_hash_table_bits_12_5 = distribution8(generator);
  tile->lshIO_hash_table_bits_12_6 = distribution8(generator);
  tile->lshIO_hash_table_bits_12_7 = distribution8(generator);
  tile->lshIO_hash_table_bits_12_8 = distribution8(generator);
  tile->lshIO_hash_table_bits_12_9 = distribution8(generator);
  tile->lshIO_hash_table_bits_13_0 = distribution8(generator);
  tile->lshIO_hash_table_bits_13_1 = distribution8(generator);
  tile->lshIO_hash_table_bits_13_2 = distribution8(generator);
  tile->lshIO_hash_table_bits_13_3 = distribution8(generator);
  tile->lshIO_hash_table_bits_13_4 = distribution8(generator);
  tile->lshIO_hash_table_bits_13_5 = distribution8(generator);
  tile->lshIO_hash_table_bits_13_6 = distribution8(generator);
  tile->lshIO_hash_table_bits_13_7 = distribution8(generator);
  tile->lshIO_hash_table_bits_13_8 = distribution8(generator);
  tile->lshIO_hash_table_bits_13_9 = distribution8(generator);
  tile->lshIO_hash_table_bits_14_0 = distribution8(generator);
  tile->lshIO_hash_table_bits_14_1 = distribution8(generator);
  tile->lshIO_hash_table_bits_14_2 = distribution8(generator);
  tile->lshIO_hash_table_bits_14_3 = distribution8(generator);
  tile->lshIO_hash_table_bits_14_4 = distribution8(generator);
  tile->lshIO_hash_table_bits_14_5 = distribution8(generator);
  tile->lshIO_hash_table_bits_14_6 = distribution8(generator);
  tile->lshIO_hash_table_bits_14_7 = distribution8(generator);
  tile->lshIO_hash_table_bits_14_8 = distribution8(generator);
  tile->lshIO_hash_table_bits_14_9 = distribution8(generator);






  // other inputs
  tile->lshIO_hashConfReg = 15;
  tile->lshIO_dimConfReg = 5;

  // eval tile
  while(!tile->lshIO_success){
    tile->clock = 0;
    tile->eval();
    main_time++;            // Time passes...
#if VM_TRACE
    dump = tfp && trace_count >= start;
    if (dump)
      tfp->dump(static_cast<vluint64_t>(trace_count * 2));
#endif
    tile->clock = 1;
    tile->eval();
    main_time++;            // Time passes...
#if VM_TRACE
    if (dump)
      tfp->dump(static_cast<vluint64_t>(trace_count * 2 + 1));
#endif
    trace_count++;
  }

#if VM_TRACE
  if (tfp)
    tfp->close();
  if (vcdfile)
    fclose(vcdfile);
#endif


  if (trace_count == max_cycles)
  {
    fprintf(stderr, "*** FAILED *** via trace_count (timeout, seed %d) after %ld cycles\n", random_seed, trace_count);
    ret = 2;
  }
  else if (verbose)
  {
    fprintf(stderr, "Completed after %ld cycles\n", trace_count);
  }

  if (tile) delete tile;
  return ret;
}
