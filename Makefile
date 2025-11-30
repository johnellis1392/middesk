.PHONY: setup
setup:
	@bin/rails db:create db:migrate db:seed

.PHONY: destroy-db
destroy-db:
	@rm -f ./db/schema.rb
	@bin/rails db:drop

.PHONY: server
server: setup
	@bin/rails server
