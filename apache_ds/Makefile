BASE_PATH=$(PWD)
DOCKER_PATH=$(BASE_PATH)/
NAME=ubuntu_apacheds
NETWORK_NAME=network_apacheds

###############################
# dockers
# apacheds
build_ads:
	@docker build -f $(DOCKER_PATH)/Dockerfile -t $(NAME) .

run_ads:
	@docker run -it --rm --pid=host -p 10389:10389 --network $(NETWORK_NAME) --hostname ldap.local -v $(DOCKER_PATH):/app  --privileged -u root --name $(NAME)_run $(NAME)

remove_ads:
	@docker image rm $(NAME) -f


###############################################
## create network 
create_network: 
	@docker network create -d bridge $(NETWORK_NAME)
