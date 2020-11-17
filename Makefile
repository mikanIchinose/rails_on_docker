SHELL := /bin/bash

.PHONY: $(shell egrep -o ^[a-zA-Z_-]+: $(MAKEFILE_LIST) | sed 's/://')

change-owner:
	sudo chown -R $USER:$USER .

web:
	docker-compose exec web bash

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
