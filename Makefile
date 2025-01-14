.PHONY: build dev image pull compile

dev: image
	@docker run --rm -it -p 8000:8000 -v ${PWD}:/docs mkdocs:local

build: image
	@docker run --rm -it -p 8000:8000 -v ${PWD}:/docs mkdocs:local build

compile:
	@docker run --rm -it --platform=linux/amd64 -v ${PWD}/schema:/schema weibeld/ajv-cli:5.0.0 ajv compile -s schema/chancellor.json

image:
	@docker build -t mkdocs:local .
