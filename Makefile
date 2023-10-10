#!/usr/bin/make -f
# Makefile for the Cal Big styles #
# ------------------------------- #
# Created by Dominique Michel
#

all: help

DESTDIR ?= 
PREFIX ?= /usr/local
PNAME = calf_big_styles
PVERSION = 1.0.0
LICENSEINST ?= yes

help:
	@echo "To install these calf styles into /usr, run"
	@echo "    PREFIX=/usr make install"
	@echo "or to use the default path into /usr/local, run"
	@echo "    make install"
	@echo
	@echo "PREFIX must be the same PREFIX than the one used to install calf,"
	@echo "so normally you need to use su for that:"
	@echo "    su -c \"PREFIX=/usr make install\""
	@echo
	@echo "To uninstall these calf styles from /usr, run"
	@echo "    su -c \"PREFIX=/usr make uninstall\""
	@echo
	@echo "This Makefile support DESTDIR."
	@echo "If You don't know what this is for, You don't need it."

install:
	@echo "Installing the calf styles into $(DESTDIR)$(PREFIX)/share/calf/styles ..."
	mkdir -p $(DESTDIR)$(PREFIX)/share/calf/styles
	cp -r Calf_0.0.19_Big $(DESTDIR)$(PREFIX)/share/calf/styles
	cp -r Calf_Default_Big $(DESTDIR)$(PREFIX)/share/calf/styles
	cp -r Calf_Flat_Big $(DESTDIR)$(PREFIX)/share/calf/styles
	cp -r Calf_Hybreed_Big $(DESTDIR)$(PREFIX)/share/calf/styles
	cp -r Calf_Lost_Wages_Big $(DESTDIR)$(PREFIX)/share/calf/styles
	cp -r Calf_Midnight_Big $(DESTDIR)$(PREFIX)/share/calf/styles
	cp -r Calf_Orange_Big $(DESTDIR)$(PREFIX)/share/calf/styles
	cp -r Calf_Wood_Big $(DESTDIR)$(PREFIX)/share/calf/styles
	mkdir -p $(DESTDIR)$(PREFIX)/share/doc/$(PNAME)-$(PVERSION)
	cp -r README.md $(DESTDIR)$(PREFIX)/share/doc/$(PNAME)-$(PVERSION)/
	if [ $(LICENSEINST) = yes ]; then \
		cp -r COPYING $(DESTDIR)$(PREFIX)/share/doc/$(PNAME)-$(PVERSION)/; \
	fi

uninstall:
	@echo "Uninstalling the calf styles from $(DESTDIR)$(PREFIX)/share/calf/styles ..."
	rm -rdf $(DESTDIR)$(PREFIX)/share/calf/styles/Calf_0.0.19_Big
	rm -rdf $(DESTDIR)$(PREFIX)/share/calf/styles/Calf_Default_Big
	rm -rdf $(DESTDIR)$(PREFIX)/share/calf/styles/Calf_Flat_Big
	rm -rdf $(DESTDIR)$(PREFIX)/share/calf/styles/Calf_Hybreed_Big
	rm -rdf $(DESTDIR)$(PREFIX)/share/calf/styles/Calf_Lost_Wages_Big
	rm -rdf $(DESTDIR)$(PREFIX)/share/calf/styles/Calf_Midnight_Big
	rm -rdf $(DESTDIR)$(PREFIX)/share/calf/styles/Calf_Orange_Big
	rm -rdf $(DESTDIR)$(PREFIX)/share/calf/styles/Calf_Wood_Big
	rm -rdf $(DESTDIR)$(PREFIX)/share/doc/$(PNAME)-$(PVERSION)/README.md \
		$(DESTDIR)$(PREFIX)/share/doc/$(PNAME)-$(PVERSION)/COPYING
	rm -df $(DESTDIR)$(PREFIX)/share/doc/$(PNAME)-$(PVERSION)

release:
	mkdir -p "../$(PNAME)-$(PVERSION)"
	rsync -a . "../$(PNAME)-$(PVERSION)"
	tar -czf "../$(PNAME)-$(PVERSION).tar.gz" "../$(PNAME)-$(PVERSION)"
	rm -rf "../$(PNAME)-$(PVERSION)"

.PHONY: all help install release uninstall
