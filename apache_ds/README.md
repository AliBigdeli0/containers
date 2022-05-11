# Apache DS Container
this container will create ApacheDS server on docker with `bash shell` access. 

Note: Although the project has been tested on debian linux OS, it should work on other operating systems too. 

## requirements  
Following requirements should be installed before start run docker
* docker 
* gnu make (or its windows equivalent) 

## installation
* before anything you need to create network. to create network run `make create_network` in your host machine. this will create a bridge network with name `network_apacheds` in your docker.
* Next run `make build_ads` on your host. This will create a container with name `ubuntu_apacheds` in your docker. 
    * If you want to change the container names, change the `Makefile -> NAME` variable.  

## Run
To start the container run `make run_ads` in your host machine's terminal (Powershell/CMD). You will see new bash shell will started in your terminal. 
In runned container,  two default group with names `groups` and `users` and one `admin` user under `ou=users,dc=example,dc=com` with password `admin` is created.

NOTE: the system `admin` password is `secret` which is different from this mentioned admin user.

## Remove
To remove container simply run `make remove_ads` in your host machine.

NOTE: the command only remove the image and the bridge network will not remove.

# LICENSE
This project is licensed under the GNU GENERAL PUBLIC LICENSE - see the [LICENSE](LICENSE) file for details
