TEX_MAINS	= main.tex
TEX_TARGETS = $(TEX_MAINS:.tex=.pdf)
TEX_SRCS 	= $(wildcard src/*.tex) $(wildcard *.bib)
DATA_SRCS	= $(wildcard data/*.txt)

%.pdf: %.tex $(TEX_SRCS) $(DATA_SRCS)
	xelatex $<
	bibtex $(<:.tex=.aux)
	xelatex $<
	xelatex $<

all: $(TEX_TARGETS)

clean:
	rm -rf $(TEX_TARGETS) *.aux *.bbl *.bcf *.blg *.lof *.log *.lot *.toc
