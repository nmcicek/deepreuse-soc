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

using namespace std;

unsigned int main_time = 0;     // Current simulation time

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
  tile->lshIO_hash_table_bits_0_10 = distribution8(generator);
  tile->lshIO_hash_table_bits_0_11 = distribution8(generator);
  tile->lshIO_hash_table_bits_0_12 = distribution8(generator);
  tile->lshIO_hash_table_bits_0_13 = distribution8(generator);
  tile->lshIO_hash_table_bits_0_14 = distribution8(generator);
  tile->lshIO_hash_table_bits_0_15 = distribution8(generator);
  tile->lshIO_hash_table_bits_0_16 = distribution8(generator);
  tile->lshIO_hash_table_bits_0_17 = distribution8(generator);
  tile->lshIO_hash_table_bits_0_18 = distribution8(generator);
  tile->lshIO_hash_table_bits_0_19 = distribution8(generator);
  tile->lshIO_hash_table_bits_0_20 = distribution8(generator);
  tile->lshIO_hash_table_bits_0_21 = distribution8(generator);
  tile->lshIO_hash_table_bits_0_22 = distribution8(generator);
  tile->lshIO_hash_table_bits_0_23 = distribution8(generator);
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
  tile->lshIO_hash_table_bits_1_10 = distribution8(generator);
  tile->lshIO_hash_table_bits_1_11 = distribution8(generator);
  tile->lshIO_hash_table_bits_1_12 = distribution8(generator);
  tile->lshIO_hash_table_bits_1_13 = distribution8(generator);
  tile->lshIO_hash_table_bits_1_14 = distribution8(generator);
  tile->lshIO_hash_table_bits_1_15 = distribution8(generator);
  tile->lshIO_hash_table_bits_1_16 = distribution8(generator);
  tile->lshIO_hash_table_bits_1_17 = distribution8(generator);
  tile->lshIO_hash_table_bits_1_18 = distribution8(generator);
  tile->lshIO_hash_table_bits_1_19 = distribution8(generator);
  tile->lshIO_hash_table_bits_1_20 = distribution8(generator);
  tile->lshIO_hash_table_bits_1_21 = distribution8(generator);
  tile->lshIO_hash_table_bits_1_22 = distribution8(generator);
  tile->lshIO_hash_table_bits_1_23 = distribution8(generator);
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
  tile->lshIO_hash_table_bits_2_10 = distribution8(generator);
  tile->lshIO_hash_table_bits_2_11 = distribution8(generator);
  tile->lshIO_hash_table_bits_2_12 = distribution8(generator);
  tile->lshIO_hash_table_bits_2_13 = distribution8(generator);
  tile->lshIO_hash_table_bits_2_14 = distribution8(generator);
  tile->lshIO_hash_table_bits_2_15 = distribution8(generator);
  tile->lshIO_hash_table_bits_2_16 = distribution8(generator);
  tile->lshIO_hash_table_bits_2_17 = distribution8(generator);
  tile->lshIO_hash_table_bits_2_18 = distribution8(generator);
  tile->lshIO_hash_table_bits_2_19 = distribution8(generator);
  tile->lshIO_hash_table_bits_2_20 = distribution8(generator);
  tile->lshIO_hash_table_bits_2_21 = distribution8(generator);
  tile->lshIO_hash_table_bits_2_22 = distribution8(generator);
  tile->lshIO_hash_table_bits_2_23 = distribution8(generator);
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
  tile->lshIO_hash_table_bits_3_10 = distribution8(generator);
  tile->lshIO_hash_table_bits_3_11 = distribution8(generator);
  tile->lshIO_hash_table_bits_3_12 = distribution8(generator);
  tile->lshIO_hash_table_bits_3_13 = distribution8(generator);
  tile->lshIO_hash_table_bits_3_14 = distribution8(generator);
  tile->lshIO_hash_table_bits_3_15 = distribution8(generator);
  tile->lshIO_hash_table_bits_3_16 = distribution8(generator);
  tile->lshIO_hash_table_bits_3_17 = distribution8(generator);
  tile->lshIO_hash_table_bits_3_18 = distribution8(generator);
  tile->lshIO_hash_table_bits_3_19 = distribution8(generator);
  tile->lshIO_hash_table_bits_3_20 = distribution8(generator);
  tile->lshIO_hash_table_bits_3_21 = distribution8(generator);
  tile->lshIO_hash_table_bits_3_22 = distribution8(generator);
  tile->lshIO_hash_table_bits_3_23 = distribution8(generator);
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
  tile->lshIO_hash_table_bits_4_10 = distribution8(generator);
  tile->lshIO_hash_table_bits_4_11 = distribution8(generator);
  tile->lshIO_hash_table_bits_4_12 = distribution8(generator);
  tile->lshIO_hash_table_bits_4_13 = distribution8(generator);
  tile->lshIO_hash_table_bits_4_14 = distribution8(generator);
  tile->lshIO_hash_table_bits_4_15 = distribution8(generator);
  tile->lshIO_hash_table_bits_4_16 = distribution8(generator);
  tile->lshIO_hash_table_bits_4_17 = distribution8(generator);
  tile->lshIO_hash_table_bits_4_18 = distribution8(generator);
  tile->lshIO_hash_table_bits_4_19 = distribution8(generator);
  tile->lshIO_hash_table_bits_4_20 = distribution8(generator);
  tile->lshIO_hash_table_bits_4_21 = distribution8(generator);
  tile->lshIO_hash_table_bits_4_22 = distribution8(generator);
  tile->lshIO_hash_table_bits_4_23 = distribution8(generator);
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
  tile->lshIO_hash_table_bits_5_10 = distribution8(generator);
  tile->lshIO_hash_table_bits_5_11 = distribution8(generator);
  tile->lshIO_hash_table_bits_5_12 = distribution8(generator);
  tile->lshIO_hash_table_bits_5_13 = distribution8(generator);
  tile->lshIO_hash_table_bits_5_14 = distribution8(generator);
  tile->lshIO_hash_table_bits_5_15 = distribution8(generator);
  tile->lshIO_hash_table_bits_5_16 = distribution8(generator);
  tile->lshIO_hash_table_bits_5_17 = distribution8(generator);
  tile->lshIO_hash_table_bits_5_18 = distribution8(generator);
  tile->lshIO_hash_table_bits_5_19 = distribution8(generator);
  tile->lshIO_hash_table_bits_5_20 = distribution8(generator);
  tile->lshIO_hash_table_bits_5_21 = distribution8(generator);
  tile->lshIO_hash_table_bits_5_22 = distribution8(generator);
  tile->lshIO_hash_table_bits_5_23 = distribution8(generator);
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
  tile->lshIO_hash_table_bits_6_10 = distribution8(generator);
  tile->lshIO_hash_table_bits_6_11 = distribution8(generator);
  tile->lshIO_hash_table_bits_6_12 = distribution8(generator);
  tile->lshIO_hash_table_bits_6_13 = distribution8(generator);
  tile->lshIO_hash_table_bits_6_14 = distribution8(generator);
  tile->lshIO_hash_table_bits_6_15 = distribution8(generator);
  tile->lshIO_hash_table_bits_6_16 = distribution8(generator);
  tile->lshIO_hash_table_bits_6_17 = distribution8(generator);
  tile->lshIO_hash_table_bits_6_18 = distribution8(generator);
  tile->lshIO_hash_table_bits_6_19 = distribution8(generator);
  tile->lshIO_hash_table_bits_6_20 = distribution8(generator);
  tile->lshIO_hash_table_bits_6_21 = distribution8(generator);
  tile->lshIO_hash_table_bits_6_22 = distribution8(generator);
  tile->lshIO_hash_table_bits_6_23 = distribution8(generator);
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
  tile->lshIO_hash_table_bits_7_10 = distribution8(generator);
  tile->lshIO_hash_table_bits_7_11 = distribution8(generator);
  tile->lshIO_hash_table_bits_7_12 = distribution8(generator);
  tile->lshIO_hash_table_bits_7_13 = distribution8(generator);
  tile->lshIO_hash_table_bits_7_14 = distribution8(generator);
  tile->lshIO_hash_table_bits_7_15 = distribution8(generator);
  tile->lshIO_hash_table_bits_7_16 = distribution8(generator);
  tile->lshIO_hash_table_bits_7_17 = distribution8(generator);
  tile->lshIO_hash_table_bits_7_18 = distribution8(generator);
  tile->lshIO_hash_table_bits_7_19 = distribution8(generator);
  tile->lshIO_hash_table_bits_7_20 = distribution8(generator);
  tile->lshIO_hash_table_bits_7_21 = distribution8(generator);
  tile->lshIO_hash_table_bits_7_22 = distribution8(generator);
  tile->lshIO_hash_table_bits_7_23 = distribution8(generator);
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
  tile->lshIO_hash_table_bits_8_10 = distribution8(generator);
  tile->lshIO_hash_table_bits_8_11 = distribution8(generator);
  tile->lshIO_hash_table_bits_8_12 = distribution8(generator);
  tile->lshIO_hash_table_bits_8_13 = distribution8(generator);
  tile->lshIO_hash_table_bits_8_14 = distribution8(generator);
  tile->lshIO_hash_table_bits_8_15 = distribution8(generator);
  tile->lshIO_hash_table_bits_8_16 = distribution8(generator);
  tile->lshIO_hash_table_bits_8_17 = distribution8(generator);
  tile->lshIO_hash_table_bits_8_18 = distribution8(generator);
  tile->lshIO_hash_table_bits_8_19 = distribution8(generator);
  tile->lshIO_hash_table_bits_8_20 = distribution8(generator);
  tile->lshIO_hash_table_bits_8_21 = distribution8(generator);
  tile->lshIO_hash_table_bits_8_22 = distribution8(generator);
  tile->lshIO_hash_table_bits_8_23 = distribution8(generator);
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
  tile->lshIO_hash_table_bits_9_10 = distribution8(generator);
  tile->lshIO_hash_table_bits_9_11 = distribution8(generator);
  tile->lshIO_hash_table_bits_9_12 = distribution8(generator);
  tile->lshIO_hash_table_bits_9_13 = distribution8(generator);
  tile->lshIO_hash_table_bits_9_14 = distribution8(generator);
  tile->lshIO_hash_table_bits_9_15 = distribution8(generator);
  tile->lshIO_hash_table_bits_9_16 = distribution8(generator);
  tile->lshIO_hash_table_bits_9_17 = distribution8(generator);
  tile->lshIO_hash_table_bits_9_18 = distribution8(generator);
  tile->lshIO_hash_table_bits_9_19 = distribution8(generator);
  tile->lshIO_hash_table_bits_9_20 = distribution8(generator);
  tile->lshIO_hash_table_bits_9_21 = distribution8(generator);
  tile->lshIO_hash_table_bits_9_22 = distribution8(generator);
  tile->lshIO_hash_table_bits_9_23 = distribution8(generator);
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
  tile->lshIO_hash_table_bits_10_10 = distribution8(generator);
  tile->lshIO_hash_table_bits_10_11 = distribution8(generator);
  tile->lshIO_hash_table_bits_10_12 = distribution8(generator);
  tile->lshIO_hash_table_bits_10_13 = distribution8(generator);
  tile->lshIO_hash_table_bits_10_14 = distribution8(generator);
  tile->lshIO_hash_table_bits_10_15 = distribution8(generator);
  tile->lshIO_hash_table_bits_10_16 = distribution8(generator);
  tile->lshIO_hash_table_bits_10_17 = distribution8(generator);
  tile->lshIO_hash_table_bits_10_18 = distribution8(generator);
  tile->lshIO_hash_table_bits_10_19 = distribution8(generator);
  tile->lshIO_hash_table_bits_10_20 = distribution8(generator);
  tile->lshIO_hash_table_bits_10_21 = distribution8(generator);
  tile->lshIO_hash_table_bits_10_22 = distribution8(generator);
  tile->lshIO_hash_table_bits_10_23 = distribution8(generator);
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
  tile->lshIO_hash_table_bits_11_10 = distribution8(generator);
  tile->lshIO_hash_table_bits_11_11 = distribution8(generator);
  tile->lshIO_hash_table_bits_11_12 = distribution8(generator);
  tile->lshIO_hash_table_bits_11_13 = distribution8(generator);
  tile->lshIO_hash_table_bits_11_14 = distribution8(generator);
  tile->lshIO_hash_table_bits_11_15 = distribution8(generator);
  tile->lshIO_hash_table_bits_11_16 = distribution8(generator);
  tile->lshIO_hash_table_bits_11_17 = distribution8(generator);
  tile->lshIO_hash_table_bits_11_18 = distribution8(generator);
  tile->lshIO_hash_table_bits_11_19 = distribution8(generator);
  tile->lshIO_hash_table_bits_11_20 = distribution8(generator);
  tile->lshIO_hash_table_bits_11_21 = distribution8(generator);
  tile->lshIO_hash_table_bits_11_22 = distribution8(generator);
  tile->lshIO_hash_table_bits_11_23 = distribution8(generator);
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
  tile->lshIO_hash_table_bits_12_10 = distribution8(generator);
  tile->lshIO_hash_table_bits_12_11 = distribution8(generator);
  tile->lshIO_hash_table_bits_12_12 = distribution8(generator);
  tile->lshIO_hash_table_bits_12_13 = distribution8(generator);
  tile->lshIO_hash_table_bits_12_14 = distribution8(generator);
  tile->lshIO_hash_table_bits_12_15 = distribution8(generator);
  tile->lshIO_hash_table_bits_12_16 = distribution8(generator);
  tile->lshIO_hash_table_bits_12_17 = distribution8(generator);
  tile->lshIO_hash_table_bits_12_18 = distribution8(generator);
  tile->lshIO_hash_table_bits_12_19 = distribution8(generator);
  tile->lshIO_hash_table_bits_12_20 = distribution8(generator);
  tile->lshIO_hash_table_bits_12_21 = distribution8(generator);
  tile->lshIO_hash_table_bits_12_22 = distribution8(generator);
  tile->lshIO_hash_table_bits_12_23 = distribution8(generator);
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
  tile->lshIO_hash_table_bits_13_10 = distribution8(generator);
  tile->lshIO_hash_table_bits_13_11 = distribution8(generator);
  tile->lshIO_hash_table_bits_13_12 = distribution8(generator);
  tile->lshIO_hash_table_bits_13_13 = distribution8(generator);
  tile->lshIO_hash_table_bits_13_14 = distribution8(generator);
  tile->lshIO_hash_table_bits_13_15 = distribution8(generator);
  tile->lshIO_hash_table_bits_13_16 = distribution8(generator);
  tile->lshIO_hash_table_bits_13_17 = distribution8(generator);
  tile->lshIO_hash_table_bits_13_18 = distribution8(generator);
  tile->lshIO_hash_table_bits_13_19 = distribution8(generator);
  tile->lshIO_hash_table_bits_13_20 = distribution8(generator);
  tile->lshIO_hash_table_bits_13_21 = distribution8(generator);
  tile->lshIO_hash_table_bits_13_22 = distribution8(generator);
  tile->lshIO_hash_table_bits_13_23 = distribution8(generator);
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
  tile->lshIO_hash_table_bits_14_10 = distribution8(generator);
  tile->lshIO_hash_table_bits_14_11 = distribution8(generator);
  tile->lshIO_hash_table_bits_14_12 = distribution8(generator);
  tile->lshIO_hash_table_bits_14_13 = distribution8(generator);
  tile->lshIO_hash_table_bits_14_14 = distribution8(generator);
  tile->lshIO_hash_table_bits_14_15 = distribution8(generator);
  tile->lshIO_hash_table_bits_14_16 = distribution8(generator);
  tile->lshIO_hash_table_bits_14_17 = distribution8(generator);
  tile->lshIO_hash_table_bits_14_18 = distribution8(generator);
  tile->lshIO_hash_table_bits_14_19 = distribution8(generator);
  tile->lshIO_hash_table_bits_14_20 = distribution8(generator);
  tile->lshIO_hash_table_bits_14_21 = distribution8(generator);
  tile->lshIO_hash_table_bits_14_22 = distribution8(generator);
  tile->lshIO_hash_table_bits_14_23 = distribution8(generator);
  tile->lshIO_hash_table_bits_15_0 = distribution8(generator);
  tile->lshIO_hash_table_bits_15_1 = distribution8(generator);
  tile->lshIO_hash_table_bits_15_2 = distribution8(generator);
  tile->lshIO_hash_table_bits_15_3 = distribution8(generator);
  tile->lshIO_hash_table_bits_15_4 = distribution8(generator);
  tile->lshIO_hash_table_bits_15_5 = distribution8(generator);
  tile->lshIO_hash_table_bits_15_6 = distribution8(generator);
  tile->lshIO_hash_table_bits_15_7 = distribution8(generator);
  tile->lshIO_hash_table_bits_15_8 = distribution8(generator);
  tile->lshIO_hash_table_bits_15_9 = distribution8(generator);
  tile->lshIO_hash_table_bits_15_10 = distribution8(generator);
  tile->lshIO_hash_table_bits_15_11 = distribution8(generator);
  tile->lshIO_hash_table_bits_15_12 = distribution8(generator);
  tile->lshIO_hash_table_bits_15_13 = distribution8(generator);
  tile->lshIO_hash_table_bits_15_14 = distribution8(generator);
  tile->lshIO_hash_table_bits_15_15 = distribution8(generator);
  tile->lshIO_hash_table_bits_15_16 = distribution8(generator);
  tile->lshIO_hash_table_bits_15_17 = distribution8(generator);
  tile->lshIO_hash_table_bits_15_18 = distribution8(generator);
  tile->lshIO_hash_table_bits_15_19 = distribution8(generator);
  tile->lshIO_hash_table_bits_15_20 = distribution8(generator);
  tile->lshIO_hash_table_bits_15_21 = distribution8(generator);
  tile->lshIO_hash_table_bits_15_22 = distribution8(generator);
  tile->lshIO_hash_table_bits_15_23 = distribution8(generator);





  // other inputs
  tile->lshIO_hashConfReg = 15;
  tile->lshIO_dimConfReg = 12;

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
