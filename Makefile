include my.env
export


# Set these in the environment to override them. This is helpful for
# development if you have file ownership problems because the user
# in the container doesn't match the user on your host.
APP_UID ?= 10000
APP_GID ?= 10000

DC := $(shell which docker-compose)

.PHONY: help
help: default

.PHONY: default
default:
	@echo "Usage: make RULE"
	@echo ""
	@echo "Tecken Symbolicator make rules:"
	@echo ""
	@echo "  build            - build docker containers"
	@echo "  run              - run app"
	@echo ""
	@echo "  clean            - delete state data"

.PHONY: clean
clean:
	rm -rf .docker-build
	rm -rf data/

my.env:
	@if [ ! -f my.env ]; \
	then \
	echo "Copying my.env.dist to my.env..."; \
	cp my.env.dist my.env; \
	fi

data:
	mkdir data

config.yml:

.docker-build: config.yml
	make build

.PHONY: build
build: my.env
	${DC} build --build-arg APP_UID=${APP_UID} --build-arg APP_GID=${APP_GID} app
	touch .docker-build

.PHONY: run
run: my.env .docker-build data
	${DC} up app
