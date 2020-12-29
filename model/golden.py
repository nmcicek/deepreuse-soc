# Import the libraries
import matplotlib.pyplot as plt
import seaborn as sns

import sys
import random
import math
from collections import defaultdict
from bitstring import BitArray
from itertools import groupby

DEBUG_PRINTS = 0

#Parameters
layerHashSize = 15
layerVectorDim = 5
removeSparse = 0


nWordsSRAM = 16 #must be the same width with software counterpart
FANSizeArray = [16] #this might be different from nWordsSRAM
nBanksArray = [4]	
executeLatencyArray = [3]

#Utility functions
def dot(v1, v2):
	return sum(x*y for x,y in zip(v1,v2))


for fan_size in FANSizeArray:
	for bank in nBanksArray:
		for exe in executeLatencyArray:

			def getBankGroup(fan_out):
				stall = 0
				toLSEU = []
				remaining = fan_out
				availableBanks = [1]*bank
				for f in fan_out:
					if availableBanks[int(f['bankNum'],2)] == 1:
						toLSEU += [{"ID":f['ID'], "data":f['data'], "key":f['key'], "bankNum":f['bankNum']}]
						remaining = [rem for rem in remaining if int(rem['ID']) != int(f['ID'])]
						availableBanks[int(f['bankNum'],2)] = 0
					else:
						stall = 1
				
				return toLSEU, stall, remaining

			maxIndex = (fan_size / layerVectorDim)*layerVectorDim
			hashTableRow = 100
			hashTableCol = fan_size

			print("***********************************************************")
			print("Configuration -> FanSize: " + str(fan_size) + " nBanks: " + str(bank) + " exeLatency: " + str(exe))

			#Read from file
			contents = []
			with open(sys.argv[1], "r") as f:
				contents = f.readlines()
			contents = [x.strip() for x in contents] # you may also want to remove whitespace characters like `\n` at the end of each line

			#Convert string to bytes
			#ID Pattern Generation + Sparsity Controller
			#[[Data], ID, allZero]
			wrapID = 0
			wrapSRAM = 0
			globalID = 1
			byteContents = []
			byteLine = []
			for c in contents:
				nBytes = len(c)/8
				remaining = []
				for x in range(0, nBytes):
					data = c[8*x:8*x+8]
					wrapID += 1
					if int(data) != 0:
						b = BitArray(bin=data)
						byteLine.append([b.int, globalID])
					if wrapID == layerVectorDim:
						wrapID = 0
						globalID += 1

				#Fetch Target Queue according to FANSize and VectorDim
				wrapSRAM += 1
				if wrapSRAM == fan_size/nWordsSRAM:
					wrapSRAM = 0
					remaining = byteLine[:maxIndex]
					byteContents.append(remaining)
					byteLine = byteLine[maxIndex:]
					if len(byteLine) > maxIndex:
						remaining = byteLine[:maxIndex]
						byteContents.append(remaining)
						byteLine = byteLine[maxIndex:]

			if DEBUG_PRINTS:
				print("*** FTQ ***\n")			
				for data in byteContents:
					print(data)

			print("Length of FTQ is " + str(len(byteContents)))		

			#FAN Stage
			hashTable = [[random.randint(-128,127) for i in range(hashTableCol)] for j in range(hashTableRow)]

			if DEBUG_PRINTS:			
				print("*** HASH TABLE ***\n")			
				for table in hashTable:
					print(table, sum(table))



			dotProducts = []
			for tf in byteContents:
				res = defaultdict(list)
				for v, k in tf: res[k].append(v)
				groupedTF = [{"ID":k, "data":v, "key":0, "bankNum":0} for k,v in res.items()]
				for g in groupedTF:
					for h in range(0, layerHashSize):
						temp = 0
						for d, val in enumerate(g["data"]):
			#				print("before",d, val, hashTable[h][d], g["data"],temp)
							temp += val * hashTable[h][d]
			#				print("after",d, val, hashTable[h][d], g["data"],temp)
						if temp > 0:
							g["key"] += 1 << h
			#			print("total",g["data"],temp,g["key"])
				dotProducts.append(groupedTF)

			if DEBUG_PRINTS:
				print("*** FAN ***\n")			
				for data in dotProducts:
					print(data)

			print("Length of dotProducts is " + str(len(dotProducts)))		

			#Dispatcher
			#Bank Num assignment
			for fan_out in dotProducts:
				for f in fan_out:
					key = bin(f["key"])[2:].zfill(layerHashSize)
					index = int(math.log(bank,2))
					f["bankNum"] = key[:index]

			dispatched = []
			for fan_out in dotProducts:
				while True:
					toLSEU, stall, fan_out = getBankGroup(fan_out)
					dispatched.append(toLSEU)
					if stall == 0:
						break

			if DEBUG_PRINTS:
				print("*** DISPATCH ***\n")			
				for data in dispatched:
					print(data)


			if removeSparse:
				dispatched = [dis for dis in dispatched if dis != []]

			print("Length of dispatched is " + str(len(dispatched)))		

			#TODO check bank conflict

			#LSEU Stage
			final_dispatched = []
			for i in range(0, len(dispatched)):
				final_dispatched += [dispatched[i]]
				stall = 0
				for j in range(i,i-exe,-1):
					if i > j and j > 0:
						for k in dispatched[i]:
							for t in dispatched[j]:
								if k["bankNum"] == t["bankNum"] and stall == 0:
									for m in range(0, exe-(i-j-1)):
										final_dispatched += [dispatched[i]]
										stall = 1
				

			if DEBUG_PRINTS:
				print("*** LSEU ***\n")
				for data in final_dispatched:
					print(data)

			print("Length of final_dispatched is " + str(len(final_dispatched)))		
			print("***********************************************************")

			
			# matplotlib histogram
			all_keys = []
			for data in dispatched:
				for x in data:
					all_keys += [x["key"]]
			
			grouped_L = [(k, sum(1 for i in g)) for k,g in groupby(all_keys)]

			plt.scatter(*zip(*grouped_L))
			
#			plt.hist(all_keys, color = 'blue', edgecolor = 'black', bins = 32768)

			# Add labels
			#plt.title('Histogram of Keys')
			#plt.xlabel('Keys')
			#plt.ylabel('Count')

			plt.title('Key-Count graph')
			plt.xlabel('Keys')
			plt.ylabel('Consecutive Count')

			plt.show()