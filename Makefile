BINPREFIX ?= "/usr/bin"
RESPREFIX ?= "/usr/share"

all: dict/words.txt doc/kpwgen.1.gz

dict/words.txt: dict/filter-words.py /usr/share/dict/words
	python3 dict/filter-words.py /usr/share/dict/words dict/words.txt

doc/kpwgen.1.gz: doc/kpwgen.1
	gzip -kf doc/kpwgen.1

clean:
	rm -f dict/words.txt doc/kpwgen.1.gz
	rm -rf dist/kpwgen dist/*.tar.gz

install: kpwgen dict/words.txt doc/kpwgen.1.gz
	install -D -m 755 kpwgen "$(BINPREFIX)/kpwgen"
	install -D -m 644 dict/words.txt "$(RESPREFIX)/kpwgen/words.txt"
	install -D -m 644 doc/kpwgen.1.gz "$(RESPREFIX)/man/man1/kpwgen.1.gz"

dist:
	mkdir -p dist/kpwgen/dict
	mkdir -p dist/kpwgen/doc
	cp LICENSE.txt Makefile README.md kpwgen dist/kpwgen
	cp dict/filter-words.py dist/kpwgen/dict
	cp doc/kpwgen.1 dist/kpwgen/doc
	tar -C dist -czf dist/kpwgen.tar.gz kpwgen

.PHONY: install clean dist all
