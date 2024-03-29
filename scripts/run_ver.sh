#!/bin/bash
nFans=16
fanSize=16
sramRowWord=16
sramRowData=${sramRowWord}*8
maxHashSize=20
maxVectorDim=24
if [[ $1 == 'ALEXNET' ]]; then
	benchmarkName="alexnet"
	layerHashSizes=("16" "15" "15" "15" "15")
	layerVectorDim=("11" "20" "12" "12" "24")
	layerNumOfInputs=("2916" "676" "144" "144" "144")
	layerNumOfSubVectors=("33" "80" "144" "288" "144")
	layerBatchSize=("100" "100" "100" "100" "100")
elif [[ $1 == 'VGGNET' ]]; then
	benchmarkName="vggnet"
	layerHashSizes=("20" "20" "18" "18" "16" "16" "16" "16" "15" "15" "15" "15" "12" "12" "12" "12")
	layerVectorDim=("9" "16" "16" "16" "16" "16" "16" "16" "16" "18" "18" "18" "18" "18" "18" "18")
	layerNumOfInputs=("50176" "50176" "12544" "12544" "3136" "3136" "3136" "3136" "784" "784" "784" "784" "196" "196" "196" "196")
	layerNumOfSubVectors=("3" "36" "36" "72" "72" "144" "144" "144" "144" "256" "256" "256" "256" "256" "256" "256")
	layerBatchSize=("16" "16" "16" "16" "16" "16" "16" "16" "16" "16" "16" "16" "16" "16" "16" "16" )
elif [[ $1 == 'CIFARNET' ]]; then
	benchmarkName="cifarnet"
	layerHashSizes=("15" "10")
	layerVectorDim=("5" "10")
	layerNumOfInputs=("1024" "256")
	layerNumOfSubVectors=("15" "160")
	layerBatchSize=("100" "100")
elif [[ $1 == 'MOBILENET' ]]; then
	benchmarkName="mobilenet"
	layerHashSizes=("18" "18" "18" "18" "10" "10" "10" "10" "10" "10" "8" "8" "8" "8")
	layerVectorDim=("3" "4" "4" "8" "8" "8" "8" "8" "8" "8" "8" "8" "8" "16")
	layerNumOfInputs=("12544" "12544" "12544" "3136" "3136" "3136"  "3136" "784" "784" "784" "784" "196" "196" "196" "196" "196" "196" "196" "196" "196" "196" "196" "196" "49" "49" "49" "49")
	layerNumOfSubVectors=("9" "8" "16" "16" "16" "32" "32" "64" "64" "64" "64" "64" "64" "64")
	layerBatchSize=("4" "4" "4" "4" "4" "4" "4" "4" "4" "4" "4" "4" "4" "4")
fi

for((i=0;i<$nFans;i++)); do 
	for((j=0;j<$fanSize;j++)); do
		HashTableInit="${HashTableInit}\ \ tile->lshIO_conf_data_${i}_${j} = distribution8(generator);"
		if [[ ${i} -lt ${nFans}-1 || ${j} -lt ${fanSize}-1 ]]; then
		 	HashTableInit="${HashTableInit}\n"
		fi 
	done
done


sed -i "s/  uniform_int_distribution.*/  uniform_int_distribution<long unsigned> distribution8(0,0xFF);/g" deepreuse/src/main/resources/csrc/LSHUInt8Emulator.cc
sed -i '/^\ \ tile->lshIO_conf_data/d'  deepreuse/src/main/resources/csrc/LSHUInt8Emulator.cc
sed -i "/\/\/ hash table inputs/a ${HashTableInit}" deepreuse/src/main/resources/csrc/LSHUInt8Emulator.cc
sed -i "s/sim_csrcs \+.*/sim_csrcs \+\= \$(base_dir)\/deepreuse\/src\/main\/resources\/csrc\/LSHUInt8Emulator\.cc/g" ./Makefile

for i in "${!layerHashSizes[@]}" 
do	
	for ((j=0; j<${layerNumOfSubVectors[i]}; j++))
	do				
		if [ ${i} -gt 0 ]
		then		
			layerTotalLines="${layerNumOfInputs[i]}*${layerVectorDim[i]}*${layerBatchSize[i]}/${sramRowWord}"
			echo "*********************************"
			echo "*** Layer Specific Parameters ***"
			echo "Layer Hash Size: "${layerHashSizes[i]}
			echo "Layer Vector Dimension: "${layerVectorDim[i]}
			echo "Layer Number: "${i}
			echo "Layer SubVector: "${j}
			echo "Layer Total Lines: "${layerTotalLines}
			echo "*********************************"
			sed -i "s/layer =.*/layer = LayerParams(layerHashSize = ${layerHashSizes[i]}, layerVectorDim = ${layerVectorDim[i]}, layerBatchSize = ${layerBatchSize[i]}, layerNumOfInputs = ${layerNumOfInputs[i]}, layerNumOfSubVectors = ${layerNumOfSubVectors[i]}, layerNum = ${i}, subVectorNum = ${j})/g" src/main/scala/FPGA/Config.scala
			sed -i "s/lsh  = LSHParams(numOfHashTables.*/lsh = LSHParams(numOfHashTables = 1, maxHashSize = ${maxHashSize}, maxVectorDim = ${maxVectorDim}, nFans = ${nFans}, fanSize = ${fanSize}, sramRowData = ${sramRowData}),/g" src/main/scala/FPGA/Config.scala
	
			OtherInputs="\ \ int hashSize = ${layerHashSizes[i]};\n"
			OtherInputs="${OtherInputs}\ \ int vectorDim = ${layerVectorDim[i]};\n"
			OtherInputs="${OtherInputs}\ \ int sramRowWord = ${sramRowWord};\n"
			OtherInputs="${OtherInputs}\ \ int totalLines = ${layerTotalLines};"
		
			sed -i '/^  int hashSize/d' deepreuse/src/main/resources/csrc/LSHUInt8Emulator.cc
			sed -i '/^  int vectorDim/d' deepreuse/src/main/resources/csrc/LSHUInt8Emulator.cc
			sed -i '/^  int sramRowWord/d' deepreuse/src/main/resources/csrc/LSHUInt8Emulator.cc
			sed -i '/^  int totalLines/d' deepreuse/src/main/resources/csrc/LSHUInt8Emulator.cc
			sed -i "/\/\/ other inputs/a ${OtherInputs}" deepreuse/src/main/resources/csrc/LSHUInt8Emulator.cc
		
			bin=${PWD}/sw/${benchmarkName}/bin/int8/LSH_layer${i}_subvector${j}.bin
			make clean sim CONFIG="$1"LSH"$2"SimConfig bin=$bin trace="$3" -j20
		
			mkdir -p outputs
			file_name=$1_$2_layer${i}_subvector${j}
			cd builds/lsh-accelerator/ && ./simulator-FPGA-FPGAChip 2> ../../outputs/${file_name}.log && cd ../../
		
			grepped_value="$(grep -rni "completed" outputs/${file_name}.log)"
			IFS=' ' read -r -a array <<< "$grepped_value"
	
			echo "*********************************" >> outputs/$1_$2.out
			echo "*** Layer Specific Parameters ***" >> outputs/$1_$2.out
			echo "Layer Hash Size: "${layerHashSizes[i]} >> outputs/$1_$2.out
			echo "Layer Vector Dimension: "${layerVectorDim[i]} >> outputs/$1_$2.out
			echo "Layer Number: "${i} >> outputs/$1_$2.out
			echo "Layer SubVector: "${j} >> outputs/$1_$2.out
			echo "Layer Total Lines: "${layerTotalLines} >> outputs/$1_$2.out
			echo "*********************************" >> outputs/$1_$2.out
			echo layer_num: ${i} subvector: ${j} cycle: ${grepped_value} >> outputs/$1_$2.out
		fi
	done
done
