// See LICENSE.SiFive for license details.
// See LICENSE.Berkeley for license details.

#include "verilated.h"
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


static uint64_t trace_count = 0;
bool verbose;
bool done_reset;

using namespace std;

int main(int argc, char** argv)
{
  unsigned random_seed = (unsigned)time(NULL) ^ (unsigned)getpid();
  uint64_t max_cycles = 10000000;
  int ret = 0;
  bool print_cycles = true;

  verbose = true;
  fprintf(stderr, "using random seed %u\n", random_seed);

  srand(random_seed);
  srand48(random_seed);

  Verilated::randReset(2);
  Verilated::commandArgs(argc, argv);
  TEST_HARNESS *tile = new TEST_HARNESS;

  // reset for several cycles to handle pipelined reset
  for (int i = 0; i < 200; i++) {
    tile->reset = 1;
    tile->clock = 0;
    tile->io_rx = 1;
    tile->eval();
    tile->clock = 1;
    tile->eval();
    trace_count ++;
  }

  tile->reset = 0;
  done_reset = true;

  // drive from an outer file through Uart
  int uartCycleNum;
  string line;
  ifstream uartFile ("../../software/baremetal/uartTrace.txt");
  
  if (uartFile.is_open()){
    while (getline(uartFile,line)){
      //split string by space
      istringstream iss(line);
      vector <string> tokens{istream_iterator<string>{iss}, istream_iterator<string>{}};
      uartCycleNum = atoi(tokens.at(3).c_str());
      tile->io_rx = atoi(tokens.at(1).c_str());

      cout << "rx = " << atoi(tokens.at(1).c_str()) << " for " << uartCycleNum << " cycles" << endl;

      // eval tile
      for(int i=0; i<uartCycleNum; i++){
        tile->clock = 0;
        tile->eval();
        tile->clock = 1;
        tile->eval();
      }
    }
    uartFile.close();
  }

  if (trace_count == max_cycles)
  {
    fprintf(stderr, "*** FAILED *** via trace_count (timeout, seed %d) after %ld cycles\n", random_seed, trace_count);
    ret = 2;
  }
  else if (verbose || print_cycles)
  {
    fprintf(stderr, "Completed after %ld cycles\n", trace_count);
  }

  if (tile) delete tile;
  return ret;
}
