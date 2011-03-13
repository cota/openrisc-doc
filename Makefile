
DOCS :=	index.html \
	toolchain-build.html

all: $(DOCS)

%.html: %.txt
	asciidoc -o $* $?

.PHONY: clean
clean:
	rm -f $(DOCS)
