
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

.PHONY: clean
clean:
	rm -f $(DOCS)

publish: $(DOCS)
	scp $^ root@openrisc.net:/var/www/openrisc.net/
