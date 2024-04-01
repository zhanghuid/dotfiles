PROJECT=nginx-buildx
OUTPUT=bin/$(PROJECT)
VERSION=0.0.1

NGINX_VERSON=$(nginx_version)

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

##@ [nginx]
build: ## build nginx container
	docker build --no-cache -f $(NGINX_VERSON).Dockerfile -t nginx:$(NGINX_VERSON) .

run: ## up nginx container
	docker run -itd --name nginx.$(NGINX_VERSON) -p 80:80 -v $(PWD)/$(NGINX_VERSON)/etc/nginx:/etc/nginx -v ~/web/dalan:/work/web -v ~/web:/work/apps nginx:$(NGINX_VERSON)

exec: ## exec nginx container
	docker exec -it nginx.$(NGINX_VERSON) bash

clean: ## clean nginx container
	docker stop $(shell docker ps -a|grep 'nginx.$(NGINX_VERSON)'|awk '{print $$1}')
	docker rm $(shell docker ps -a|grep 'nginx.$(NGINX_VERSON)'|awk '{print $$1}')

restart: ## restart nginx container
	docker restart $(shell docker ps -a|grep 'nginx.$(NGINX_VERSON)'|awk '{print $$1}')
	docker logs -f $(shell docker ps -a|grep 'nginx.$(NGINX_VERSON)'|awk '{print $$1}')


start: ## start nginx container
	docker start $(shell docker ps -a|grep 'nginx.$(NGINX_VERSON)'|awk '{print $$1}')
	docker logs -f $(shell docker ps -a|grep 'nginx.$(NGINX_VERSON)'|awk '{print $$1}')

logs: ## logs nginx container
	docker logs -f $(shell docker ps -a|grep 'nginx.$(NGINX_VERSON)'|awk '{print $$1}')
