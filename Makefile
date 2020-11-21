SHELL := /bin/bash

.PHONY: $(shell egrep -o ^[a-zA-Z_-]+: $(MAKEFILE_LIST) | sed 's/://')

web:
	docker-compose exec web bash

console:
	docker-compose run --rm web rails console --sandbox

db_migrate:
	docker-compose run --rm web rails db:migrate

db_reset:
	docker-compose run --rm web rails db:migrate:reset

db_rollback:
	docker-compose run --rm web rails db:rollback

test:
	docker-compose run --rm web rails test
test-controllers:
	docker-compose run --rm web rails test:controllers
test-helpers:
	docker-compose run --rm web rails test:helpers
test-integration:
	docker-compose run --rm web rails test:integration
test-mailers:
	docker-compose run --rm web rails test:mailers
test-models:
	docker-compose run --rm web rails test:models
test-system:
	docker-compose run --rm web rails test:system
