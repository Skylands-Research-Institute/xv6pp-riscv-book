TEX := $(wildcard *.tex)
SPELLTEX := $(wildcard *.tex)

SVGFIGS := $(wildcard fig/*.svg)
PDFFIGS := $(SVGFIGS:.svg=.pdf)

all: book.pdf
.PHONY: all clean spell

book.pdf: book.tex $(TEX) $(PDFFIGS)
	pdflatex book.tex
	bibtex book
	pdflatex book.tex
	pdflatex book.tex

clean:
	rm -f book.aux book.idx book.ilg book.ind book.log \
	      book.toc book.bbl book.blg book.out book.pdf
	rm -f fig/*.pdf

spell:
	@ for i in $(SPELLTEX); do aspell --mode=tex -p ./aspell.words -c $$i; done
	@ for i in $(SPELLTEX); do perl bin/double.pl $$i; done
	@ for i in $(SPELLTEX); do perl bin/capital.py $$i; done
	@ ( head -1 aspell.words ; tail -n +2 aspell.words | sort ) > aspell.words~
	@ mv aspell.words~ aspell.words

SVG2PDF = rsvg-convert -f pdf -o

fig/%.pdf: fig/%.svg
	$(SVG2PDF) $@ $<
