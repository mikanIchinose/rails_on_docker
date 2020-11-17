SHELL := /bin/bash

.PHONY: $(shell egrep -o ^[a-zA-Z_-]+: $(MAKEFILE_LIST) | sed 's/://')

change-owner:
	sudo chown -R $USER:$USER .

web:
	docker-compose exec web bash