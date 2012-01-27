all::


TEXBIN=/usr/texbin
PDFLATEX:=${TEXBIN}/xelatex

PATH:=${TEXBIN}:${PATH}
export PATH

TEXINPUTS:=.:tex:build:

export TEXINPUTS
export PDFLATEX

%.pdf :: %.tex
	texi2dvi -b -p --tidy --build-dir=build $<

%.tex :: %.Rnw
	Rscript assignment.cmd $<

bulletGraph.pdf :: bulletGraph.tex build/*.tex

bulletGraph.tex :: bulletGraph.Rnw


all :: bulletGraph.pdf