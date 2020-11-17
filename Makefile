SHELL := /bin/bash

.PHONY: $(shell egrep -o ^[a-zA-Z_-]+: $(MAKEFILE_LIST) | sed 's/://')

web:
	docker-compose exec web bash

console:
	docker-compose exec web rails console --sandbox

migrate:
	docker-compose exec web rails db:migrate

rollback:
	docker-compose exec web rails db:rollback

test:
	docker-compose exec web rails test
test-controllers:
	docker-compose exec web rails test:controllers
test-helpers:
	docker-compose exec web rails test:helpers
test-integration:
	docker-compose exec web rails test:integration
test-mailers:
	docker-compose exec web rails test:mailers
test-models:
	docker-compose exec web rails test:models
test-system:
	docker-compose exec web rails test:system
