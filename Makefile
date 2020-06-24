.PHONY: help init start stop restart status open-ui

DOCKER_EXEC = docker-compose exec

help:
	@echo "Dev env util:"
	@echo "  make start             Start the localstack docker containers."
	@echo "  make stop              Stop the localstack docker containers."
	@echo "  make restart           Restart the localstack docker containers."
	@echo "  make status            Show containers"
	@echo
	@echo "Web UI:"
	@echo "  make open-ui           Open browser UI."

init: build start

start:
	@TMPDIR=${TMPDIR} docker-compose up -d

stop:
	@docker-compose stop

restart: stop start

status:
	@docker-compose ps

login:
	@$(DOCKER_EXEC) app /bin/zsh
