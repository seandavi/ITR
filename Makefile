RMD_FILES = $(wildcard *.Rmd)
HTML_FILES = $(patsubst %.Rmd,%.html,$(RMD_FILES))
PDF_FILES = $(patsubst %.Rmd,%.pdf,$(RMD_FILES))

#	Rscript -e 'rmarkdown::render("$@ $(patsubst %.pdf,%.markdown,$@)")'
%.html: %.Rmd
	Rscript -e 'rmarkdown::render("$(patsubst %.html,%.Rmd,$@)")'

%.pdf: %.Rmd
	Rscript -e 'rmarkdown::render("$(patsubst %.pdf,%.Rmd,$@)", rmarkdown::pdf_document() )'

abc/%.html: %.html
	@cp $< $@

all: $(HTML_FILES) $(PDF_FILES)


clean:
	rm -f $(HTML_FILES) && rm -f $(PDF_FILES)
