default: 18.04
18.04: EXTRA_TAGS=--tag rmnlib-install

all: 16.04 18.04

%.04: Dockerfile.template
	echo "# Auto-generated from $< - do not edit!\n" > Dockerfile
	sed 's/$$DISTRO/ubuntu:$@/;s/$$UID/'`id -u`'/;s/$$GID/'`id -g`'/' $< >> Dockerfile
	sudo docker build --tag rmnlib-install-$@ $(EXTRA_TAGS) .

