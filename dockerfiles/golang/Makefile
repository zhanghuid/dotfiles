PROJECT=golang-buildx
OUTPUT=bin/$(PROJECT)
VERSION=0.0.1

GOLANG_VERSON=$(golang_version)

DEFAULT_GOAL := help
help:
	@awk 'BEGIN {FS = ":.*##"; printf "\nUsage:\n  make \033[36m<target>\033[0m\n"} /^[a-zA-Z0-9_-]+:.*?##/ { printf "  \033[36m%-40s\033[0m %s\n", $$1, $$2 } /^##@/ { printf "\n\033[1m%s\033[0m\n", substr($$0, 5) } ' $(MAKEFILE_LIST)

##@ [golang]
build: ## build golang container
	docker build --no-cache -f $(GOLANG_VERSON).Dockerfile -t golang:$(GOLANG_VERSON) .

run: ## up golang container
	docker run -itd --name golang.$(GOLANG_VERSON)  -v ~/web/dalan:/work/web golang:$(GOLANG_VERSON)

exec: ## exec golang container
	docker exec -it golang.$(GOLANG_VERSON) bash

clean: ## clean golang container
	docker stop $(shell docker ps -a|grep 'golang.$(GOLANG_VERSON)'|awk '{print $$1}')
	docker rm $(shell docker ps -a|grep 'golang.$(GOLANG_VERSON)'|awk '{print $$1}')
