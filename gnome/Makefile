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


ALIASED_FILES= gdm.mo gnome-libs.mo gnome-applets.mo

all: ${MO_FILES} ${ALIASED_FILES}

install: ${TARGETS}

${INSTALL_DIR}/%.mo: %.mo ${INSTALL_DIR}
	cp $< $@

%.mo: %.pot
	msgfmt --verbose --check $< -o $@

${INSTALL_DIR}:
	mkdir -p ${INSTALL_DIR}

clean:
	rm -f *~ messages *.mo *#


gdm.mo: gdm2.mo
	cp gdm2.mo gdm.mo

ggv.mo: ggv2.mo
	cp ggv2.mo ggv.mo

gnome-libs.mo: gnome-libs1.mo
	cp gnome-libs1.mo gnome-libs.mo

gnome-applets.mo: gnome-applets1.mo
	cp gnome-applets1.mo gnome-applets.mo

