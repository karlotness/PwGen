BINPREFIX ?= "/usr/bin"
RESPREFIX ?= "/usr/share/kpwgen"

all: dict/words.txt doc/kpwgen.1.gz

dict/words.txt: dict/filter-words.py /usr/share/dict/words
	python3 dict/filter-words.py /usr/share/dict/words dict/words.txt

doc/kpwgen.1.gz: doc/kpwgen.1
	gzip -kf doc/kpwgen.1

clean:
	rm -f dict/words.txt

install: kpwgen dict/words.txt
	install -D -m 755 kpwgen "$(BINPREFIX)/kpwgen"
	install -D -m 644 dict/words.txt "$(RESPREFIX)/words.txt"

.PHONY: install clean all
