PREFIX ?= /usr/local
VERSION = v1.0.0
SCOPE   = indieisaconcept
NAME    = node-ninjas-toolbox

all: install

install: build link

link:
	mkdir -p $(DESTDIR)$(PREFIX)/bin
	install -m 0755 ./$(NAME) $(DESTDIR)$(PREFIX)/bin/$(NAME)

uninstall:
	@$(RM) $(DESTDIR)$(PREFIX)/bin/$(NAME)
	@docker rmi ${SCOPE}/$(NAME):$(VERSION)
	@docker rmi ${SCOPE}/$(NAME):latest

build:
	@docker build ./ -t ${SCOPE}/${NAME}:$(VERSION) -t ${SCOPE}/${NAME}:latest

# publish: build
# 	@docker push ${SCOPE}/${NAME}:$(VERSION):$(VERSION) \
# && docker push ${SCOPE}/${NAME}:$(VERSION):latest

.PHONY: all install uninstall build
