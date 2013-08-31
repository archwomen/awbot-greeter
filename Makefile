
PREFIX    ?= /usr/local
BINDIR    ?= bin
MANPREFIX ?= $(PREFIX)
MANDIR    ?= share/man/man1

awbot-greeter.1: README.pod
	pod2man --section=1 --center="awgreeter manual" --name="AWBOT-GREETER" --release="awbot-greeter" $^ $@

install: awbot awbot-greeter.1 awgreeter@.service
	install -D -m755 awbot $(DESTDIR)$(PREFIX)/$(BINDIR)/awgreeter
	install -D -m644 awbot-greeter.1 $(DESTDIR)$(MANPREFIX)/$(MANDIR)/awbot-greeter.1
	ln -s awbot-greeter.1 $(DESTDIR)$(MANPREFIX)/$(MANDIR)/awgreeter.1
	install -D -m644 awgreeter@.service $(DESTDIR)$(PREFIX)/lib/systemd/system/awgreeter@.service

uninstall:
	$(RM) $(DESTDIR)$(PREFIX)/bin/awgreeter $(DESTDIR)$(MANPREFIX)/man1/awbot-greeter.1

