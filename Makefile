.DEFAULT_GOAL := help
.PHONY: help deploy

help: ## (default), display the list of make commands
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'

# HTML

build/config.json: ./config.web.js
	./node_modules/.bin/babel-node ./config.web.js > $@

htmlsrcfiles := $(shell find src/*.html -type f)
htmlbuild := $(patsubst src/%,build/%,$(htmlsrcfiles))
build/%.html: src/%.html ./config.web.js ./build/config.json
	@mkdir -p $(dir $@)
ifeq ($(ENVIRONMENT),development)
	./node_modules/.bin/babel-node ./node_modules/.bin/rheactor-build-views build ./build/config.json $< $@
else
	./node_modules/.bin/babel-node ./node_modules/.bin/rheactor-build-views build -m ./build/config.json $< $@
endif

# Stylesheets

# Build variables for CSS artefacts
csssrcfiles := $(shell find src/scss/*.scss -type f)
csssassed := $(subst .scss,.css,$(patsubst src/scss/%,build/css/%,$(csssrcfiles)))
csssminified := $(subst .css,.min.css,$(csssassed))

build/css/%.min.css: build/css/%.css
ifeq ($(ENVIRONMENT),development)
	cp $< $@
else
	./node_modules/.bin/uglifycss $< > $@
endif

build/css/%.css: src/scss/%.scss
	@mkdir -p $(dir $@)
	./node_modules/.bin/node-sass $< $@

# Assets

assetsrcfiles := $(shell find src/images/ -type f)
assetsrcfiles += $(shell find src/favicons/ -type f)
assetsrcfiles += $(shell find src/fonts/ -type f)
assets := $(patsubst src/%,build/%,$(assetsrcfiles))

build/%: src/%
	@mkdir -p $(dir $@)
	cp $< $@

# Cleanup

clean:
	rm -rf build

# MAIN

.SECONDARY: $(csssassed)

debug: ## Print variables
	@echo "htmlsrcfiles=$(htmlsrcfiles)"
	@echo "htmlbuild=$(htmlbuild)"
	@echo "csssrcfiles=$(csssrcfiles)"
	@echo "csssassed=$(csssassed)"
	@echo "csssminified=$(csssminified)"

development: ## Build for development environment
	ENVIRONMENT=development make build

build: $(htmlbuild) $(csssminified) $(assets) ## Build for production environment
