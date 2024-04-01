PROJECT=python-buildx
OUTPUT=bin/$(PROJECT)
VERSION=0.0.1

PYTHON_VERSON=$(python_version)

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


##@ [python]
build: ## build python container
	docker build --no-cache -f $(PYTHON_VERSON).Dockerfile -t python:$(PYTHON_VERSON) .

run: ## up python container
	docker run -itd --name python.$(PYTHON_VERSON)  -v ~/web/dalan:/work/web -v ~/web/github:/work/github -v ~/web:/work/apps python:$(PYTHON_VERSON)

exec: ## exec python container
	docker exec -it python.$(PYTHON_VERSON) bash

clean: ## clean python container
	docker stop $(shell docker ps -a|grep 'python.$(PYTHON_VERSON)'|awk '{print $$1}')
	docker rm $(shell docker ps -a|grep 'python.$(PYTHON_VERSON)'|awk '{print $$1}')

restart: ## clean python container
	docker restart $(shell docker ps -a|grep 'python.$(PYTHON_VERSON)'|awk '{print $$1}')

start: ## clean python container
	docker start $(shell docker ps -a|grep 'python.$(PYTHON_VERSON)'|awk '{print $$1}')
