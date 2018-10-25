defaut: Dockerfile
	mkdir -p $(PWD)/GIT_CACHE $(PWD)/SSM_CACHE $(PWD)/ssm-domains-base
	sudo docker build --tag rmnlib-install .

Dockerfile: Dockerfile.template
	sed 's/$$UID/'`id -u`'/;s/$$GID/'`id -g`'/' $< > $@
