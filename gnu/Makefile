# Makefile for app-defaults
# Install edited app-defaults in the right place

ifndef PREFIX
PREFIX=/usr
endif

LANG=ga
INSTALL_DIR=${PREFIX}/X11R6/lib/X11/${LANG}/app-defaults

FILES=	\
	XCalc		\
	XLock		\
	Xman		\
	Editres		\
	Chooser		\
	Bitmap		\
	Viewres		\
	XClipboard	\
	XFontSel	\
	XPaint		\
	XSm		\
	XTerm		\
	Xditview	\
	Xedit		\
	Xfd		\
	Xmh		\
	Xvidtune

TARGETS=$(patsubst %,${INSTALL_DIR}/%,${FILES})

install:  ${TARGETS}

# Ensure the directory is there
${INSTALL_DIR}:
	mkdir -p ${INSTALL_DIR}

# copy each file into builddir
${INSTALL_DIR}/% :: % ${INSTALL_DIR}
	cp -f $< $@


