.PHONY: help init start stop restart login status open-ui

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

build:
	@cd ./ruby_container && docker build --tag localstack-ruby --build-arg L_AWS_ACCESS_KEY=${L_AWS_ACCESS_KEY} --build-arg L_AWS_SECRET_KEY=${L_AWS_SECRET_KEY} --build-arg DEFAULT_REGION=${DEFAULT_REGION} .
	@docker-compose build

start:
	@TMPDIR=${TMPDIR} docker-compose up -d

stop:
	@docker-compose stop

restart: stop start

status:
	@docker-compose ps

login:
	@$(DOCKER_EXEC) devserver bash

open-ui:
    @open https://app.localstack.cloud/
