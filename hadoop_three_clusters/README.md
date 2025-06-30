# Hadoop Cluster Using Docker
This section contains a 4 docker images which running with one namenode and 3 datanodes. The datanodes can be extended easily. Here are some features of this custom Docker: 

NOTE: `HBASE Database` and `Zookeeper` will be installed too during the installation process.  

* useful for learning 
* All details are designed from scratch in separate Docker files. In addition, all configuration files are separated into folders
* All containers can be run with the simple `make` command
* All containers are installed from scratch ( from Ubuntu container )

<br />
<br />

# Per Install Notes:
The following requirements should be installed before starting to run Docker
* docker 
* GNU make (or its Windows equivalent) 

<br />
<br />

# Install Notes

NOTE: the steps **ARE IN ORDER**

* Run `make create_network` to create a network. 
    * The created network name will be `hadoop_network`
* Run `make nn_build` to create the name node. 
    * To delete the name node, just run `make nn_rm`
* Run `make dn_build` to create a data node image
    * Although there is only one datanode, all containers will run with this container
    * To delete the data node image, run `make dn_rm`

<br />
<br />

# Running Notes 

Do the following steps : 

Run all containers : 

* To run the name node container, please run: `make nn_run`. This command will lead you to the namenode's container terminal. 
* Open another shell command (or CMD in Windows) and run  `make dn1_run`; this command will lead you to the datanode 1 container terminal. 
* Open another shell command (or CMD in Windows) and run  `make dn2_run`; this command will lead you to the datanode 2 container terminal. 
* Open another shell command (or CMD in Windows) and run  `make dn3_run`; this command will lead you to the datanode 3 container terminal. 

![data node images](./images/dn_runs.png)

* Go to the namenode terminal and run: `make start-all`, to test run `jps` in the namenode's terminal. You will see that the namenode is running. 

![data node images](./images/nn_run.png)


# LICENSE
This project is licensed under the GNU GENERAL PUBLIC LICENSE - see the [LICENSE](../LICENSE) file for details
