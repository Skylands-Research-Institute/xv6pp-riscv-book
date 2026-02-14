Derived from MIT PDOS xv6-riscv-book (https://github.com/mit-pdos/xv6-riscv-book), used under its license.

This edition of the book has been converted to LaTeX.
In order to build it, ensure you have a TeX distribution that contains
the `pdflatex` command. With that, you should be able to build the book
by running `make`, which will clone the OS itself and build the book
to `book.pdf` in the main directory.

Figures are drawn using `inkscape`.


Build notes:
- `xv6-riscv-src-booklet/runoff` uses `pdfjam` (plus `ps2pdf`) for booklet layout, so install `pdfjam` and Ghostscript before building.
- Full PDF build also needs LaTeX packages used by `book.tex` (for example `listings` and `xcolor`).
