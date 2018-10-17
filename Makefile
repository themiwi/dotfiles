# Based on the work of Jessica Frazelle:
# https://github.com/jessfraz/dotfiles/blob/249d305932b3e0c6ca01530818f5355c5c1aaf99/Makefile

.PHONY: all
all: dotfiles

.PHONY: dotfiles
SPECIALDIRS=.config .gnupg .httpie
dotfiles: ## Installs the dotfiles.
	for file in $(shell find $(CURDIR) -name ".*" -not -name ".gitignore" -not -name ".git" -not -name ".*.swp" $(addprefix -not -name ,$(SPECIALDIRS)) -not -name .cygport.conf -not -name .cygport.conf.passwd); do \
		f=$$(basename $$file); \
		ln -sfn $$file $(HOME)/$$f; \
	done
	\
	mkdir -p $(HOME)/.gnupg
	chmod 0700 $(HOME)/.gnupg
	gpg2 --list-keys || true;
	\
	for d in $(SPECIALDIRS); do \
		mkdir -p $(HOME)/$$d; \
	done
	\
	for file in $(shell ls -1 $(addsuffix /*,$(addprefix $(CURDIR)/,$(SPECIALDIRS)))); do \
		f=$$(basename $$(dirname $$file))/$$(basename $$file); \
		ln -sfn $$file $(HOME)/$$f; \
	done
	\
	cp -a .cygport.conf $(HOME)/.cygport.conf
	chmod 0600 $(HOME)/.cygport.conf
	cat .cygport.conf.passwd >> $(HOME)/.cygport.conf

.PHONY: help
help:
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'
