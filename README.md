This is a recipe for building a Docker image of the [rmnlib-install](https://github.com/mfvalin/rmnlib-install) package.

To build:
```sh
# Docker is required for the build process.
# You may need to adapt this command for the package manager of your distro.
sudo apt-get install docker.io

# The Makefile will take care of the rest.
make
```

This will generate a docker image called `rmnlib-install`.  You can start an interactive container by running
```sh
sudo docker run --rm -it rmnlib-install bash
```

If you want to transfer files in and out of the container, you could bind mount a volume using the `-v` option, e.g. to make your current directly accessible to the container under a mountpoint at `/io`:
```sh
sudo docker run --rm -v $PWD:/io -it rmnlib-install bash
```

To run a single command on the image, use the `-i -c` options for bash, e.g.:
```sh
sudo docker run --rm -t rmnlib-install bash -i -c "git clone https://gitlab.com/ECCC_CMDN/vgrid -b b_6.4 --depth 1; vgrid/CI/build_and_tests.ksh"
```

**Note:** As soon as you exit the session, the container will be wiped out and any files you generate will be lost unless explicitly transfered to the host system.


