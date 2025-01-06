.PHONY: build dev pull compile

dev:
	@docker run --rm -it -p 8000:8000 -v ${PWD}:/docs squidfunk/mkdocs-material

build:
	@docker run --rm -it -p 8000:8000 -v ${PWD}:/docs squidfunk/mkdocs-material build

compile:
	@docker run --rm -it --platform=linux/amd64 -v ${PWD}/schema:/schema weibeld/ajv-cli:5.0.0 ajv compile -s schema/chancellor.json
