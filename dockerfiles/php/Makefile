PROJECT=php-buildx
OUTPUT=bin/$(PROJECT)
VERSION=0.0.1

# 82|74|72|71
PHP_VERSON=$(php_version)
PHP_PORT=$(php_port)

ifeq ($(strip $(PHP_PORT)),)
    PHP_PORT = 9000
endif

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


##@ [php-fpm]
build: ## build php fpm container
	docker build --no-cache -f $(PHP_VERSON)-fpm.Dockerfile -t php-fpm:$(PHP_VERSON) .

run: ## [eg: phpcli run php_version_num php_port_num] \n up php fpm container and need to pass port number
	docker run -itd --name php-fpm.$(PHP_VERSON) -p ${PHP_PORT}:9000  -v ~/web/dalan:/work/web -v ~/web:/work/apps php-fpm:$(PHP_VERSON)

exec: ## exec php fpm container
	docker exec -it php-fpm.$(PHP_VERSON) bash

clean: ## clean php fpm container
	docker stop $(shell docker ps -a|grep 'php-fpm.$(PHP_VERSON)'|awk '{print $$1}')
	docker rm $(shell docker ps -a|grep 'php-fpm.$(PHP_VERSON)'|awk '{print $$1}')

start: ## start php fpm container
	docker start $(shell docker ps -a|grep 'php-fpm.$(PHP_VERSON)'|awk '{print $$1}')

logs: ## logs php fpm container
	docker logs -f $(shell docker ps -a|grep 'php-fpm.$(PHP_VERSON)'|awk '{print $$1}')

restart: ## restart php fpm container
	docker restart $(shell docker ps -a|grep 'php-fpm.$(PHP_VERSON)'|awk '{print $$1}')
