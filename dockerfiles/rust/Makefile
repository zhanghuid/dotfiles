PROJECT=rust-buildx
OUTPUT=bin/$(PROJECT)
VERSION=0.0.1

PYTHON_VERSON=$(rust_version)

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


##@ [rust]
build: ## build rust container
	docker build --no-cache -f $(PYTHON_VERSON).Dockerfile -t rust:$(PYTHON_VERSON) .

run: ## up rust container
	docker run -itd --name rust.$(PYTHON_VERSON)  -v ~/web/dalan:/work/web -v ~/web/github:/work/github -v ~/web:/work/apps rust:$(PYTHON_VERSON)

exec: ## exec rust container
	docker exec -it rust.$(PYTHON_VERSON) bash

clean: ## clean rust container
	docker stop $(shell docker ps -a|grep 'rust.$(PYTHON_VERSON)'|awk '{print $$1}')
	docker rm $(shell docker ps -a|grep 'rust.$(PYTHON_VERSON)'|awk '{print $$1}')

restart: ## clean rust container
	docker restart $(shell docker ps -a|grep 'rust.$(PYTHON_VERSON)'|awk '{print $$1}')

start: ## clean rust container
	docker start $(shell docker ps -a|grep 'rust.$(PYTHON_VERSON)'|awk '{print $$1}')
