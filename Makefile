defaut: Dockerfile
	sudo docker build --tag rmnlib-install-18.04 .

Dockerfile: Dockerfile.template
	echo "# Auto-generated from $< - do not edit!\n" > $@
	sed 's/$$UID/'`id -u`'/;s/$$GID/'`id -g`'/' $< >> $@
