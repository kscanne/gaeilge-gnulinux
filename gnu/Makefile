# Simple Makefile to chuck these into the right place

LANG=ga

ifndef PREFIX
PREFIX=/usr
endif

ifndef INSTALL_DIR
INSTALL_DIR=${PREFIX}/share/locale/${LANG}/LC_MESSAGES
endif

MO_FILES = $(patsubst %.pot,%.mo, $(wildcard *.pot))
TARGETS=$(patsubst %,${INSTALL_DIR}/%, ${MO_FILES})


all: ${MO_FILES}

install: ${TARGETS}

${INSTALL_DIR}/%.mo: %.pot ${INSTALL_DIR}
	msgfmt --verbose $< -o $@
	touch --date="Jan 1,1990" $@

${INSTALL_DIR}:
	mkdir -p ${INSTALL_DIR}
