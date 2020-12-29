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
	layerNumOfSubVectors=("3" "36" "36" "72" "72" "144" "144" "144" "144" "256" "256" "256" "256" "256" "256" "256")
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
	layerHashSizes=("18" "18" "18" "18" "10" "10" "10" "10" "10" "10" "8" "8" "8" "8")
	layerVectorDim=("3" "4" "4" "8" "8" "8" "8" "8" "8" "8" "8" "8" "8" "16")
	layerNumOfInputs=("12544" "12544" "12544" "3136" "3136" "3136"  "3136" "784" "784" "784" "784" "196" "196" "196" "196" "196" "196" "196" "196" "196" "196" "196" "196" "49" "49" "49" "49")
	layerNumOfSubVectors=("9" "8" "16" "16" "16" "32" "32" "64" "64" "64" "64" "64" "64" "64")
	layerBatchSize=("4" "4" "4" "4" "4" "4" "4" "4" "4" "4" "4" "4" "4" "4")
fi

HashTableInit="${HashTableInit}\ \ tile->lshIO_hashTable_valid = true;\n"
for((i=0;i<$maxHashSize;i++)); do 
	for((j=0;j<$maxVectorDim;j++)); do
		HashTableInit="${HashTableInit}  tile->lshIO_hashTable_bits_${i}_${j} = distribution8(generator);"
		if [[ ${i} -lt ${maxHashSize}-1 || ${j} -lt ${maxVectorDim}-1 ]]; then
		 	HashTableInit="${HashTableInit}\n"
		fi 
	done
done

sed -i "s/  uniform_int_distribution.*/  uniform_int_distribution<long unsigned> distribution8(0,0xFF);/g" deepreuse/src/main/resources/csrc/LSHUInt8Emulator.cc
sed -i '/^  tile->lshIO_hashTable/d'  deepreuse/src/main/resources/csrc/LSHUInt8Emulator.cc
sed -i "/\/\/ hash table inputs/a ${HashTableInit}" deepreuse/src/main/resources/csrc/LSHUInt8Emulator.cc
sed -i "s/sim_csrcs \+.*/sim_csrcs \+\= \$(base_dir)\/deepreuse\/src\/main\/resources\/csrc\/LSHUInt8Emulator\.cc/g" ./Makefile

for i in "${!layerHashSizes[@]}" 
do	
	for j in "${!layerNumOfSubVectors[@]}" 
	do							
		echo "*** Layer Specific Parameters ***"
		echo "Layer Hash Size: "${layerHashSizes[i]}" Layer Vector Dimension: "${layerVectorDim[i]}" Layer Number: "${i}" Layer SubVector: "${j}
		sed -i "s/layer =.*/layer = LayerParams(layerHashSize = ${layerHashSizes[i]}, layerVectorDim = ${layerVectorDim[i]}, layerBatchSize = ${layerBatchSize[i]}, layerNumOfInputs = ${layerNumOfInputs[i]}, layerNumOfSubVectors = ${layerNumOfSubVectors[i]}, layerNum = ${i}, subVectorNum = ${j})/g" src/main/scala/FPGA/Config.scala
							
		OtherInputs="\ \ tile->lshIO_clusterNum = ${layerHashSizes[i]};\n"
		OtherInputs="${OtherInputs}\ \ tile->lshIO_kernelDim = ${layerVectorDim[i]};"
		sed -i '/^  tile->lshIO_clusterNum/d' deepreuse/src/main/resources/csrc/LSHUInt8Emulator.cc
		sed -i '/^  tile->lshIO_kernelDim/d' deepreuse/src/main/resources/csrc/LSHUInt8Emulator.cc
		sed -i "/\/\/ other inputs/a ${OtherInputs}" deepreuse/src/main/resources/csrc/LSHUInt8Emulator.cc

		make clean
		make sim CONFIG="$1"LSH"$2"SimConfig

		mkdir -p outputs
		file_name=$1_$2_layer${i}_subvector${j}
		cd builds/lsh-accelerator/ && ./simulator-FPGA-FPGAChip 2> ../../outputs/${file_name}.log && cd ../../

		grepped_value="$(grep -rni "completed" outputs/${file_name}.log)"
		IFS=' ' read -r -a array <<< "$grepped_value"
		echo layer_num: ${i} subvector: ${j} cycle: ${grepped_value} >> outputs/$1_$2.out
	done
done
