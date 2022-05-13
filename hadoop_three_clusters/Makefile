
NAME=custom_hadoop_nn
DATANODE1=custom_hadoop_dn
NETWORK_NAME=hadoop_network

################################
## namenode docker actions 
nn_build:
	@docker build -f Dockerfile -t $(NAME) .

nn_run:
	@docker run -it --rm --pid=host -p 9000:9000 -p 9870:9870 -p 8088:8088 -p 16010:16010 -p 2181:2181 --privileged --network $(NETWORK_NAME) --hostname nn.local -v $(PWD)/app:/app -u root --name $(NAME)_run $(NAME) 

nn_rm:
	@docker image rm $(NAME) -f


################################
## datanodes docker actions 
dn_build:
	@docker build -f Dockerfile_datanode -t $(DATANODE1) .

dn1_run:
	@docker run -it --rm --pid=host -p 9001:9000 -p 8089:8088 --privileged --network $(NETWORK_NAME)  --hostname dn1.local -v $(PWD)/data1:/datanode -u root --name $(DATANODE1)_run $(DATANODE1) 

dn2_run:
	@docker run -it --rm --pid=host -p 9002:9000 --privileged --network $(NETWORK_NAME)  --hostname dn2.local -v $(PWD)/data2:/datanode -u root --name $(DATANODE1)_run_2 $(DATANODE1) 

dn3_run:
	@docker run -it --rm --pid=host -p 9003:9000 --privileged --network $(NETWORK_NAME) --hostname dn3.local -v $(PWD)/data3:/datanode -u root --name $(DATANODE1)_run_3 $(DATANODE1) 

dn_rm:
	@docker image rm $(DATANODE1) -f


###############################
## start name nodes 

start-all: 
	@start-dfs.sh 
	@mapred --daemon start historyserver
	@start-yarn.sh
	@yarn --daemon start nodemanager
#   disable safe mode
	@hdfs dfsadmin -safemode leave
