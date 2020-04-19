import sys

benchmark = sys.argv[1]
Dict = {} 

filepath = "/opt/deepreuse-soc/builds/lsh-accelerator/"+benchmark+".log"
with open(filepath) as fp:
	for cnt, line in enumerate(fp):
		splitted_line = line.split()
		if splitted_line:
			if splitted_line[0] == "ClusterCacheReq":
				if splitted_line[8] == "1": #write
					Dict[splitted_line[2]] = splitted_line[4]
					print("Write addr: {} data: {} line: {}".format(splitted_line[2], splitted_line[4], cnt))

			if splitted_line[0] == "ClusterCacheResp":
				if splitted_line[6] == "1": #read
					if splitted_line[4] == Dict[splitted_line[2]]:
						print("Match")
					else:
						print("Found error")