PROJECT=python-buildx
OUTPUT=bin/$(PROJECT)
VERSION=0.0.1

PYTHON_VERSON=$(python_version)

DEFAULT_GOAL := help
help:
	@awk 'BEGIN {FS = ":.*##"; printf "\nUsage:\n  make \033[36m<target>\033[0m\n"} /^[a-zA-Z0-9_-]+:.*?##/ { printf "  \033[36m%-40s\033[0m %s\n", $$1, $$2 } /^##@/ { printf "\n\033[1m%s\033[0m\n", substr($$0, 5) } ' $(MAKEFILE_LIST)

##@ [python]
build: ## build python container
	docker build --no-cache -f $(PYTHON_VERSON).Dockerfile -t python:$(PYTHON_VERSON) .

run: ## up python container
	docker run -itd --name python.$(PYTHON_VERSON)  -v ~/web/dalan:/work/web python:$(PYTHON_VERSON)

exec: ## exec python container
	docker exec -it python.$(PYTHON_VERSON) bash

clean: ## clean python container
	docker stop $(shell docker ps -a|grep 'python.$(PYTHON_VERSON)'|awk '{print $$1}')
	docker rm $(shell docker ps -a|grep 'python.$(PYTHON_VERSON)'|awk '{print $$1}')
