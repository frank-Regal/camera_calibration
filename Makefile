help:
	@echo ""
	@echo "About:"
	@echo "This Makefile is a utility script for managing this Dockerized application efficiently."
	@echo "Unrelated to GCC or code compilation, it acts similarly to a Bash script by automating"
	@echo "repetitive tasks using shell commands, but leverages the structure and simplicity of make."
	@echo "It provides clear commands for common Docker tasks like building the image, starting and "
	@echo "stopping a container, logging, and accessing a shell inside the container."
	@echo ""

	@echo "Usage:"
	@echo "make start            - start the container"
	@echo "make start-verbose    - start the container with verbose output"
	@echo "make stop             - stop the container"
	@echo "make shell            - open a shell in the container"
	@echo "make build            - build the container image"
	@echo ""

# build:
# 	@docker build -t kalibr -f Dockerfile_ros1_20_04 .

# start:
# 	@ xhost +local:root; \
# 	docker run -it -e "DISPLAY" -e "QT_X11_NO_MITSHM=1" -v "/tmp/.X11-unix:/tmp/.X11-unix:rw" -v "/home/frank/devel/kalibr/data:/data" kalibr

build:
	@docker compose build

stop:
	@docker compose down

start:
	@xhost +local:root; \
	docker compose up -d

start-verbose:
	@xhost +local:root; \
	docker compose up

shell:
	@docker exec -it kalibr /bin/bash
