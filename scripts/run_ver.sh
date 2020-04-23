#!/bin/bash
if [[ $1 == 'ALEXNET' ]]; then
	maxHashSize=16
	maxVectorDim=24
	layerHashSizes=("16" "15" "15" "15" "15")
	layerVectorDim=("11" "20" "12" "12" "24")
	layerNumOfInputs=("2916" "676" "144" "144" "144")
	layerNumOfSubVectors=("33" "80" "144" "288" "144")
	layerBatchSize=("100" "100" "100" "100" "100")
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

HashTableInit="${HashTableInit}\ \ tile->lshIO_hash_table_valid = true;\n"
for((i=0;i<$maxHashSize;i++)); do 
	for((j=0;j<$maxVectorDim;j++)); do 
		HashTableInit="${HashTableInit}  tile->lshIO_hash_table_bits_${i}_${j} = distribution8(generator);"
		if [[ ${i} -lt ${maxHashSize}-1 || ${j} -lt ${maxVectorDim}-1 ]]; then
		 	HashTableInit="${HashTableInit}\n"
		fi 
	done
done

sed -i "s/  uniform_int_distribution.*/  uniform_int_distribution<long unsigned> distribution8(0,0xFF);/g" deepreuse/src/main/resources/csrc/LSHUInt8Emulator.cc
sed -i '/^  tile->lshIO_hash_table/d'  deepreuse/src/main/resources/csrc/LSHUInt8Emulator.cc
sed -i "/\/\/ hash table inputs/a ${HashTableInit}" deepreuse/src/main/resources/csrc/LSHUInt8Emulator.cc
sed -i "s/sim_csrcs \+.*/sim_csrcs \+\= \$(base_dir)\/deepreuse\/src\/main\/resources\/csrc\/LSHUInt8Emulator\.cc/g" ./Makefile

nSets_CC=("64" "128" "512" "2048")
nWays_CC=("8" "16")
rowBits_CC=("256")

nSets_ID=("64" "128" "512" "2048")
nWays_ID=("8" "16")
rowBits_ID=("256")

nBBs=("64" "128")

echo "Starting for "$1

for rowBitCC in "${!rowBits_CC[@]}"
do
	for setNumCC in "${!nSets_CC[@]}"
	do
		for wayNumCC in "${!nWays_CC[@]}"
		do
			for rowBitID in "${!rowBits_ID[@]}"
			do
				for setNumID in "${!nSets_ID[@]}"
				do
					for wayNumID in "${!nWays_ID[@]}"
					do
						for blockNum in "${!nBBs[@]}"
						do
							for i in "${!layerHashSizes[@]}" 
							do
								echo "*** Cluster Cache Parameters ***"
								echo "CC-nSets: "${nSets_CC[setNumCC]}" CC-nWays: "${nWays_CC[wayNumCC]}" CC-rowBits: "${rowBits_CC[rowBitCC]}" nBBs: "${nBBs[blockNum]}
								sed -i "s/case ClusterCacheKey .*/case ClusterCacheKey => ClusterCacheParams(nSets = ${nSets_CC[setNumCC]}, nWays = ${nWays_CC[wayNumCC]}, nMSHRs = 4, nSDQ = 16, nRPQ = 17, rowBits = ${rowBits_CC[rowBitCC]})/g" src/main/scala/FPGA/Config.scala

								echo "*** ID Cache Parameters ***"
								echo "ID-nSets: "${nSets_ID[setNumID]}" ID-nWays: "${nWays_ID[wayNumID]}" ID-rowBits: "${rowBits_ID[rowBitID]}" nBBs: "${nBBs[blockNum]}
								sed -i "s/case IDCacheKey .*/case IDCacheKey => IDCacheParams(nSets = ${nSets_ID[setNumID]}, nWays = ${nWays_ID[wayNumID]}, nMSHRs = 4, nSDQ = 16, nRPQ = 17, rowBits = ${rowBits_ID[rowBitID]})/g" src/main/scala/FPGA/Config.scala
								
								echo "*** Layer Specific Parameters ***"
								echo "Layer Hash Size: "${layerHashSizes[i]}" Layer Vector Dimension: "${layerVectorDim[i]}" Layer Number: "${i}
								sed -i "s/layer =.*/layer = LayerParams(layerHashSize = ${layerHashSizes[i]}, layerVectorDim = ${layerVectorDim[i]}, layerBatchSize = ${layerBatchSize[i]}, layerNumOfInputs = ${layerNumOfInputs[i]}, layerNumOfSubVectors = ${layerNumOfSubVectors[i]}, layerNum = ${i})/g" src/main/scala/FPGA/Config.scala
							
								sed -i "s/blockBytes =.*/blockBytes = ${nBBs[blockNum]}/g" src/main/scala/FPGA/Config.scala
								OtherInputs="\ \ tile->lshIO_hashConfReg = ${layerHashSizes[i]};\n"
								OtherInputs="${OtherInputs}\ \ tile->lshIO_dimConfReg = ${layerVectorDim[i]};"
								sed -i '/^  tile->lshIO_hashConfReg/d' deepreuse/src/main/resources/csrc/LSHUInt8Emulator.cc
								sed -i '/^  tile->lshIO_dimConfReg/d' deepreuse/src/main/resources/csrc/LSHUInt8Emulator.cc
								sed -i "/\/\/ other inputs/a ${OtherInputs}" deepreuse/src/main/resources/csrc/LSHUInt8Emulator.cc

								make clean
								make sim CONFIG="$1"LSH"$2"SimConfig

								mkdir -p output_sim
								file_name=$1_$2_CC_${nSets_CC[setNumCC]}_${nWays_CC[wayNumCC]}_${rowBits_CC[rowBitCC]}_ID_${nSets_ID[setNumID]}_${nWays_ID[wayNumID]}_${rowBits_ID[rowBitID]}_${nBBs[blockNum]}_layer${i} 
								cd builds/lsh-accelerator/ && ./simulator-FPGA-FPGAChip 2> ../../output_sim/${file_name}.log && cd ../../

								grepped_value="$(grep -rni "completed" output_sim/${file_name}.log)"
								IFS=' ' read -r -a array <<< "$grepped_value"
								echo nSets_CC: ${nSets_CC[setNumCC]} nWays_CC: ${nWays_CC[wayNumCC]} nBBs_CC: ${nBB_CC[blockNumCC]} rowBits_CC: ${rowBits_CC[rowBitCC]} nSets_ID: ${nSets_ID[setNumID]} nWays_ID: ${nWays_ID[wayNumID]} nBBs_ID: ${nBBs[blockNum]} rowBits_ID: ${rowBits_ID[rowBitID]} layer_num: ${i} cycle: ${grepped_value} >> output_sim/$1_$2.out
							done
						done
					done
				done
			done
		done
	done
done
