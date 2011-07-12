
DOCS :=	index.html \
	toolchain-build.html

all: $(DOCS)

%.html: %.txt
	asciidoc -o $@ $?

%.htm: %.txt
	asciidoc -b docbook $<
	docbook2html $*.xml

%.pdf: %.txt
	asciidoc -b docbook $<
	dblatex --pdf $*.xml

.PHONY: all clean publish
clean:
	rm -f $(DOCS) *.pdf *.xml

publish: $(DOCS)
	scp $^ root@openrisc.net:/var/www/openrisc.net/
