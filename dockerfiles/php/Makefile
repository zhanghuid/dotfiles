PROJECT=php-buildx
OUTPUT=bin/$(PROJECT)
VERSION=0.0.1

# 82|74|72|71
PHP_VERSON=$(php_version)

DEFAULT_GOAL := help
help:
	@awk 'BEGIN {FS = ":.*##"; printf "\nUsage:\n  make \033[36m<target>\033[0m\n"} /^[a-zA-Z0-9_-]+:.*?##/ { printf "  \033[36m%-40s\033[0m %s\n", $$1, $$2 } /^##@/ { printf "\n\033[1m%s\033[0m\n", substr($$0, 5) } ' $(MAKEFILE_LIST)

##@ [php-fpm]
build: ## build php fpm container
	docker build -f $(PHP_VERSON)-fpm.Dockerfile -t php-fpm:$(PHP_VERSON) .

run: ## up php fpm container
	docker run -itd --name php-fpm.$(PHP_VERSON)  -v ~/web/dalan:/work/web php-fpm:$(PHP_VERSON)

exec: ## exec php fpm container
	docker exec -it php-fpm.$(PHP_VERSON) bash

clean: ## clean php fpm container
	docker stop $(shell docker ps -a|grep 'php-fpm.$(PHP_VERSON)'|awk '{print $$1}')
	docker rm $(shell docker ps -a|grep 'php-fpm.$(PHP_VERSON)'|awk '{print $$1}')
