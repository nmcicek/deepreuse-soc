#!/bin/sh
rm -rf output
${PWD}/scripts/run_ver.sh CIFARNET Advanced
${PWD}/scripts/run_ver.sh ALEXNET Advanced
${PWD}/scripts/run_ver.sh VGGNET Advanced
${PWD}/scripts/run_ver.sh MOBILENET Advanced