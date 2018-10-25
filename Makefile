defaut: Dockerfile
	sudo docker build --tag rmnlib-install .
	mkdir -p $(PWD)/GIT_CACHE $(PWD)/SSM_CACHE
	sudo docker run --rm -v $(PWD)/GIT_CACHE:/home/ssm/GIT_CACHE -v $(PWD)/SSM_CACHE:/home/ssm/SSM_CACHE -it rmnlib-install

Dockerfile: Dockerfile.template
	sed 's/$$UID/'`id -u`'/;s/$$GID/'`id -g`'/' $< > $@
