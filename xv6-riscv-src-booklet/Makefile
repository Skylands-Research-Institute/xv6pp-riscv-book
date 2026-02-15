# make a printout
SRC?=../../xv6pp-riscv

#FS = $(shell grep -v '^\#' runoff.list)
#FILES = $(addprefix $(SRC)/,$(FS))

FS_ALL = $(shell grep -v '^\#' runoff.list)
FILES_ALL = $(addprefix $(SRC)/,$(FS_ALL))

# Keep only files that exist in $(SRC)
FILES = $(wildcard $(FILES_ALL))

# Optional: warn about missing ones (but do not fail)
MISSING = $(filter-out $(FILES),$(FILES_ALL))
$(info [runoff] Missing files skipped: $(MISSING))

README_FILE := $(firstword $(wildcard $(SRC)/README $(SRC)/README.md))
PRINT = runoff.list runoff.spec $(README_FILE) toc.hdr toc.ftr $(FILES)

xv6.pdf: $(PRINT)
	SRC=$(SRC) ./runoff
	ls -l xv6-src-booklet.pdf

clean:
	rm xv6-src-booklet.pdf
	rm -rf fmt
