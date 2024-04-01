PROJECT=node-buildx
OUTPUT=bin/$(PROJECT)
VERSION=0.0.1

NODE_VERSON=$(node_version)

DEFAULT_GOAL := help
DEFAULT_GOAL := help
help:
	@awk 'BEGIN \
	{FS = ":.*##"; printf "\nUsage:\n  make \033[36m<target>\033[0m\n"} /^[a-zA-Z0-9_-]+:.*?##/ \
	{ split($$2, a, /\\n/); n = length(a); \
	for (i = 1; i <= n; i++) { for (j = i + 1; j <= n; j++) { if (a[i] > a[j]) { temp = a[i]; a[i] = a[j]; a[j] = temp; }}} \
	for (i=1; i<=n; i++) { \
		if (i==1) { printf "  \033[36m%-40s\033[0m %s\n", $$1, a[i] } \
		else { printf "  \033[36m%-40s\033[0m %s\n", " ", a[i] } } \
	} \
	/^##@/ { printf "\n\033[1m%s\033[0m\n", substr($$0, 5) } '  \
	$(MAKEFILE_LIST)

##@ [node]
build: ## build node container
	docker build --no-cache -f $(NODE_VERSON).Dockerfile -t node:$(NODE_VERSON) .


##@ [node]
build-amd64: ## build node container
	docker build --platform linux/amd64 --no-cache -f $(NODE_VERSON).Dockerfile -t node:$(NODE_VERSON)-amd64 .


run: ## up node container
	docker run -itd --name node.$(NODE_VERSON)  -v ~/web/dalan:/work/web node:$(NODE_VERSON)

exec: ## exec node container
	docker exec -it node.$(NODE_VERSON) bash

clean: ## clean node container
	docker stop $(shell docker ps -a|grep 'node.$(NODE_VERSON)'|awk '{print $$1}')
	docker rm $(shell docker ps -a|grep 'node.$(NODE_VERSON)'|awk '{print $$1}')
