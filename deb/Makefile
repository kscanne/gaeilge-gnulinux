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

${INSTALL_DIR}/%.mo: %.mo ${INSTALL_DIR}
	cp $< $@

%.mo: %.pot
	msgfmt --verbose --check $< -o $@

${INSTALL_DIR}:
	mkdir -p ${INSTALL_DIR}

clean:
	rm -f *~ messages *.mo *#
