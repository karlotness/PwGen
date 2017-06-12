BINPREFIX ?= "/usr/bin"
RESPREFIX ?= "/usr/share/kpwgen"

all: dict/words.txt

dict/words.txt: dict/filter-words.py /usr/share/dict/words
	python3 dict/filter-words.py /usr/share/dict/words dict/words.txt

clean:
	rm -f dict/words.txt

install: kpwgen dict/words.txt
	install -D -m 755 kpwgen "$(BINPREFIX)/kpwgen"
	install -D -m 644 dict/words.txt "$(RESPREFIX)/words.txt"

.PHONY: install clean all
