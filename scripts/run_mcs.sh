#!/bin/bash
maxHashSize=20
maxVectorDim=24

nSets_CC=("16" "32" "64" "128" "512" "2048")
nWays_CC=("8" "16")
rowBits_CC=("256")

nSets_ID=("16" "32" "64" "128" "512" "2048")
nWays_ID=("8" "16")
rowBits_ID=("256")

nBBs=("64")

frequency=("50") # "50" "75" "100" "125" "150"

for freq in "${!frequency[@]}"
do
	for wayNumCC in "${!nWays_CC[@]}"
	do
		for wayNumID in "${!nWays_ID[@]}"
		do
			for setNumCC in "${!nSets_CC[@]}"
			do
				for setNumID in "${!nSets_ID[@]}"
				do
	
					echo "Running for frequency of "${frequency[freq]}
					echo "*** Cluster Cache Parameters ***"
					echo "CC-nSets: "${nSets_CC[setNumCC]}" CC-nWays: "${nWays_CC[wayNumCC]}" CC-rowBits: "${rowBits_CC[0]}" nBBs: "${nBBs[0]}
					sed -i "s/case ClusterCacheKey .*/case ClusterCacheKey => ClusterCacheParams(nSets = ${nSets_CC[setNumCC]}, nWays = ${nWays_CC[wayNumCC]}, nMSHRs = 4, nSDQ = 16, nRPQ = 17, rowBits = ${rowBits_CC[0]})/g" src/main/scala/FPGA/Config.scala

					echo "*** ID Cache Parameters ***"
					echo "ID-nSets: "${nSets_ID[setNumID]}" ID-nWays: "${nWays_ID[wayNumID]}" ID-rowBits: "${rowBits_ID[0]}" nBBs: "${nBBs[0]}
					sed -i "s/case IDCacheKey .*/case IDCacheKey => IDCacheParams(nSets = ${nSets_ID[setNumID]}, nWays = ${nWays_ID[wayNumID]}, nMSHRs = 4, nSDQ = 16, nRPQ = 17, rowBits = ${rowBits_ID[0]})/g" src/main/scala/FPGA/Config.scala
				
					sed -i "s/    CONFIG.CLKOUT2_REQUESTED_OUT_FREQ.*/    CONFIG.CLKOUT2_REQUESTED_OUT_FREQ {${frequency[freq]}} \\\/g" fpga-shells/src/main/scala/ip/Xilinx.scala
	
					sed -i "s/blockBytes =.*/blockBytes = ${nBBs[0]}/g" src/main/scala/FPGA/Config.scala
							
					mkdir -p output_mcs
					file_name=$1_$2_CC_${nSets_CC[setNumCC]}_${nWays_CC[wayNumCC]}_${rowBits_CC[0]}_ID_${nSets_ID[setNumID]}_${nWays_ID[wayNumID]}_${rowBits_ID[0]}_${nBBs[0]} 
					make clean
					make CONFIG="$1"UART"$2"FPGAConfig mcs
					zip -r output_mcs/${file_name}_freq${frequency[freq]}_reports.zip builds/lsh-accelerator/obj/report
	
				done
			done
		done
	done
done
