.PHONY: build dev pull

dev: pull
	docker run --rm -it -p 8000:8000 -v ${PWD}:/docs squidfunk/mkdocs-material

build: pull
	docker run --rm -it -p 8000:8000 -v ${PWD}:/docs squidfunk/mkdocs-material build

pull:
	docker pull squidfunk/mkdocs-material
