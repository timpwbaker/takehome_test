.PHONY: test

test:
	bundle exec rspec ./spec

lint:
	bundle exec standardrb --fix
