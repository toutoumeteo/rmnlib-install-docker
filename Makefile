# The default image (without any tags)
default: ubuntu-14.04/Dockerfile
	sudo docker build --tag rmnlib-install ubuntu-14.04

# All available images
all: ubuntu-14.04.image manylinux1_x86_64.image

%.image: % %/Dockerfile
	sudo docker build --tag rmnlib-install:$< $<

%/Dockerfile: %/Dockerfile.template
	sed 's/$$UID/'`id -u`'/;s/$$GID/'`id -g`'/' $< > $@
