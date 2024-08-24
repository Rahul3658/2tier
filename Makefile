
OS := $(shell uname)


DOCKER_COMPOSE := docker-compose


SERVICE_NAME := web


build:
ifeq ($(OS),Linux)
	@echo "Building for Linux"
	$(DOCKER_COMPOSE) build
endif
ifeq ($(OS),Darwin)
	@echo "Building for macOS"
	$(DOCKER_COMPOSE) build
endif
ifeq ($(OS),Windows_NT)
	@echo "Building for Windows"
	# Add Windows-specific build commands if you wish :P
endif

# Run target
run:
ifeq ($(OS),Linux)
	@echo "Running for Linux"
	$(DOCKER_COMPOSE) up -d
endif
ifeq ($(OS),Darwin)
	@echo "Running for macOS"
	$(DOCKER_COMPOSE) up -d
endif
ifeq ($(OS),Windows_NT)
	@echo "Running for Windows"
	# Add Windows-specific run commands if you wish :P
endif


stop:
	$(DOCKER_COMPOSE) down


clean: stop
	$(DOCKER_COMPOSE) rm -f
	docker system prune -f

