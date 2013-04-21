
PREFIX    ?= /usr/local
BINDIR    ?= bin
MANPREFIX ?= $(PREFIX)
MANDIR    ?= share/man/man1

awbot-logr.1: README.pod
	pod2man --section=1 --center="awlogr manual" --name="AWBOT-LOGR" --release="awbot-logr" $^ $@

install: awbot awbot-logr.1 awlogr@.service
	install -D -m755 awbot $(DESTDIR)$(PREFIX)/$(BINDIR)/awlogr
	install -D -m644 awbot-logr.1 $(DESTDIR)$(MANPREFIX)/$(MANDIR)/awbot-logr.1
	ln -s awbot-logr.1 $(DESTDIR)$(MANPREFIX)/$(MANDIR)/awlogr.1
	install -D -m644 awlogr@.service $(DESTDIR)$(PREFIX)/lib/systemd/system/awlogr@.service

uninstall:
	$(RM) $(DESTDIR)$(PREFIX)/bin/awlogr $(DESTDIR)$(MANPREFIX)/man1/awbot-logr.1

