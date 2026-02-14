SRC=../xv6-riscv/

T=latex.out

TEX=$(patsubst %,$(T)/%,$(wildcard *.tex))
SPELLTEX=$(wildcard *.tex)

all: book.pdf
.PHONY: all src clean

$(T)/%.tex: %.tex | src
	mkdir -p latex.out
	./lineref $(notdir $@) $(SRC)  xv6-riscv-src-booklet/fmt > $@

src:
	if [ ! -d $(SRC) ]; then \
		git clone https://github.com/Skylands-Research-Institute/xv6-riscv.git $(SRC) ; \
	else \
		git -C $(SRC) pull ; \
	fi; \
	true

booklet: src
	$(MAKE) -C xv6-riscv-src-booklet SRC=$(abspath $(SRC))
	mv xv6-riscv-src-booklet/xv6-src-booklet.pdf .

book.pdf: booklet book.tex $(TEX)
	pdflatex book.tex
	bibtex book
	pdflatex book.tex
	pdflatex book.tex


lineref: $(TEX) booklet
	echo done

clean:
	rm -f book.aux book.idx book.ilg book.ind book.log\
	 	book.toc book.bbl book.blg book.out
	rm -rf latex.out
	# Intentionally do not remove $(SRC) because it may point outside this repo.

spell:
	@ for i in $(SPELLTEX); do aspell --mode=tex -p ./aspell.words -c $$i; done
	@ for i in $(SPELLTEX); do perl bin/double.pl $$i; done
	@ for i in $(SPELLTEX); do perl bin/capital.py $$i; done
	@ ( head -1 aspell.words ; tail -n +2 aspell.words | sort ) > aspell.words~
	@ mv aspell.words~ aspell.words
