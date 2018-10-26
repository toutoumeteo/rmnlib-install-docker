defaut: Dockerfile
	sudo docker build --tag rmnlib-install .

Dockerfile: Dockerfile.template
	sed 's/$$UID/'`id -u`'/;s/$$GID/'`id -g`'/' $< > $@
