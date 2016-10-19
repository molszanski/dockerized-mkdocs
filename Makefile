
imageBuildBase: ## Build base getty base dev image
	- docker build -t molszanski/mkdocs-builder-base -f mk/mk-base .

imageBuild: ## Build base getty base dev image
	- docker build -t molszanski/mkdocs-builder-runner:0.0.1 -f mk/mk-run .


run: ## Server mkdocs stuff
	- docker run -v `pwd`:/src -p 8099:8000 molszanski/mkdocs-builder-run serve --dev-addr=0.0.0.0:8000

dist: ## Server mkdocs stuff
	- docker run -v `pwd`:/src -p 8099:8000 molszanski/mkdocs-builder-run build 

# Scripts
.PHONY: help
.DEFAULT_GOAL := help

help:
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'
