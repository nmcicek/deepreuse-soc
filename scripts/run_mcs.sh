#!/bin/bash
if [[ $1 == 'ALEXNET' ]]; then
	maxHashSize=16
	maxVectorDim=24
	layerHashSizes=("16" "15" "15" "15" "15")
	layerVectorDim=("11" "20" "12" "12" "24")
	layerNumOfInputs=("2916" "676" "144" "144" "144")
	layerBatchSize=("100" "100" "100" "100" "100")
	layerNumOfSubVectors=("33" "80" "144" "288" "144")
elif [[ $1 == 'VGGNET' ]]; then
	maxHashSize=20
	maxVectorDim=18
	layerHashSizes=("20" "20" "18" "18" "16" "16" "16" "16" "15" "15" "15" "15" "12" "12" "12" "12")
	layerVectorDim=("9" "16" "16" "16" "16" "16" "16" "16" "16" "18" "18" "18" "18" "18" "18" "18")
	layerNumOfInputs=("50176" "50176" "12544" "12544" "3136" "3136" "3136" "3136" "784" "784" "784" "784" "196" "196" "196" "196")
	layerNumOfSubVectors=("3" "36" "36" "72" "72" "144" "144" "144" "144" "192" "192" "192" "192" "192" "192" "192")
	layerBatchSize=("16" "16" "16" "16" "16" "16" "16" "16" "16" "16" "16" "16" "16" "16" "16" "16" )
elif [[ $1 == 'CIFARNET' ]]; then
	maxHashSize=15
	maxVectorDim=10
	layerHashSizes=("15" "10")
	layerVectorDim=("5" "10")
	layerNumOfInputs=("1024" "256")
	layerNumOfSubVectors=("15" "160")
	layerBatchSize=("100" "100")
elif [[ $1 == 'MOBILENET' ]]; then
	maxHashSize=18
	maxVectorDim=16
	layerHashSizes=("18" "18" "18" "18" "18" "18" "18" "18" "18" "18" "18" "18" "18" "18" "18" "18" "18" "18" "18" "18" "18" "18" "18" "18" "18" "18" "18")
	layerVectorDim=("3" "3" "4" "3" "4" "3" "8" "3" "8" "3" "8" "3" "8" "3" "8" "3" "8" "3" "8" "3" "8" "3" "8" "3" "8" "3" "16")
	layerNumOfInputs=("12544" "12544" "12544" "3136" "3136" "3136"  "3136" "784" "784" "784" "784" "196" "196" "196" "196" "196" "196" "196" "196" "196" "196" "196" "196" "49" "49" "49" "49")
	layerNumOfSubVectors=("9" "3" "8" "3" "16" "3" "16" "3" "16" "3" "32" "3" "32" "3" "64" "3" "64" "3" "64" "3" "64" "3" "64" "3" "64" "3" "64")
	layerBatchSize=("4" "4" "4" "4" "4" "4" "4" "4" "4" "4" "4" "4" "4" "4" "4" "4" "4" "4" "4" "4" "4" "4" "4" "4" "4" "4" "4")
fi

nSets=("64" "128" "512" "2048") # "64" "128" 
nWays=("8" "16") # "8"
blockBytes=("64" "128") # "128"
rowBits=("256")
frequency=("50") # "50" "75" "100" "125" "150"

for freq in "${!frequency[@]}"
do
	for rowBit in "${!rowBits[@]}"
	do
		for setNum in "${!nSets[@]}"
		do
			for wayNum in "${!nWays[@]}"
			do
				for blockNum in "${!blockBytes[@]}"
				do
	
					echo "Running for frequency of "${frequency[freq]}
					sed -i "s/    CONFIG.CLKOUT2_REQUESTED_OUT_FREQ.*/    CONFIG.CLKOUT2_REQUESTED_OUT_FREQ {${frequency[freq]}} \\\/g" fpga-shells/src/main/scala/ip/Xilinx.scala
	
					echo "Running for nSets of "${nSets[setNum]}" and nWays of "${nWays[wayNum]}" and blockBytes of "${blockBytes[blockNum]}
					sed -i "s/nSets =.*/nSets = ${nSets[setNum]},/g" src/main/scala/FPGA/Config.scala
					sed -i "s/nWays =.*/nWays = ${nWays[wayNum]},/g" src/main/scala/FPGA/Config.scala
					sed -i "s/blockBytes =.*/blockBytes = ${blockBytes[blockNum]},/g" src/main/scala/FPGA/Config.scala
					sed -i "s/rowBits =.*/rowBits = ${rowBits[rowBit]},/g" src/main/scala/FPGA/Config.scala
							
					echo "Running for hash size of "${layerHashSizes[0]}" and vector dimension of "${layerVectorDim[0]}
					sed -i "s/layer =.*/layer = LayerParams(layerHashSize = ${layerHashSizes[0]}, layerVectorDim = ${layerVectorDim[0]}, layerBatchSize = ${layerBatchSize[0]}, layerNumOfInputs = ${layerNumOfInputs[0]}, layerNumOfSubVectors = ${layerNumOfSubVectors[0]}, layerNum = 0)/g" src/main/scala/FPGA/Config.scala
	
					mkdir -p output_mcs
					make clean
					make CONFIG="$1""$2""$3"FPGAConfig mcs
					zip -r output_mcs/"$1"_nSets${nSets[setNum]}_nWays${nWays[wayNum]}_blockBytes${blockBytes[blockNum]}_freq${frequency[freq]}_reports.zip builds/lsh-accelerator/obj/report
	
				done
			done
		done
	done
done
