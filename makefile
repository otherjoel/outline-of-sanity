# SPDX-License-Identifier: BlueOak-1.0.0
# This file is licensed under the Blue Oak Model License 1.0.0.

SHELL = /bin/bash

pollen-sources := $(wildcard *.poly.pm)
web-pages      := $(patsubst %.poly.pm, %.html, $(pollen-sources))

web: .last_rebuild $(web-pages) style.css
web: ## Rebuild HTML pages and CSS as needed

.last_rebuild: pollen.rkt template.html.p index.ptree
	raco pollen setup -p
	raco pollen render -p -t html *.poly.pm
	tidy -quiet -modify -indent --wrap 100 --wrap-attributes no --tidy-mark no *.html || true
	touch .last_rebuild

$(web-pages): %.html: %.poly.pm
	raco pollen render $@
	tidy -quiet -modify -indent --wrap 100 --wrap-attributes no --tidy-mark no $@ || true

style.css: pollen.rkt style.css.pp
	raco pollen render style.css

# Self-documenting makefile (http://marmelab.com/blog/2016/02/29/auto-documented-makefile.html)
help: ## Displays this help screen
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-15s\033[0m %s\n", $$1, $$2}'

zap: ## Clear Pollen and Scribble cache, and remove all HTML output
	raco pollen reset
	rm -f *.html *.css *.swp

publish: check-env
publish: ## Rsync web stuff to the public web server (does not rebuild any files)
	raco pollen publish
	rsync -av ~/Desktop/publish/ -e 'ssh -p $(WEB_SRV_PORT)' $(OUTLINE_SRV) \
		--delete \
		--exclude='*.swp' \
		--exclude='*.md' \
		--exclude=.DS_Store \
	    --exclude='template*.*' \
		--exclude=makefile 
	rm -rf ~/Desktop/publish

.PHONY: web help publish check-env zap

.DEFAULT_GOAL := help

check-env:
ifndef OUTLINE_SRV
	$(error OUTLINE_SRV env variable not set, should be a destination valid for rsync)
endif
ifndef WEB_SRV_PORT
	$(error WEB_SRV_PORT env variable not set, should be SSH port number for web server)
endif
