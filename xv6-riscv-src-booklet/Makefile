# make a printout
SRC?=../../xv6-riscv
FS = $(shell grep -v '^\#' runoff.list)
FILES = $(addprefix $(SRC)/,$(FS))

README_FILE := $(firstword $(wildcard $(SRC)/README $(SRC)/README.md))
PRINT = runoff.list runoff.spec $(README_FILE) toc.hdr toc.ftr $(FILES)

xv6.pdf: $(PRINT)
	SRC=$(SRC) ./runoff
	ls -l xv6-src-booklet.pdf

clean:
	rm xv6-src-booklet.pdf
	rm -rf fmt
