defaut: Dockerfile
	sudo docker build --tag rmnlib-install .

Dockerfile: Dockerfile.template
	echo "# Auto-generated from $< - do not edit!\n" > $@
	sed 's/$$UID/'`id -u`'/;s/$$GID/'`id -g`'/' $< >> $@
