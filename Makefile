BINPREFIX ?= "/usr/bin"
RESPREFIX ?= "/usr/share/kpwgen"

all: dict/words.txt

dict/words.txt: dict/words-in.txt dict/filter-words.py
	python3 dict/filter-words.py dict/words-in.txt dict/words.txt

clean:
	rm dict/words.txt

install: kpwgen dict/words.txt
	mkdir -p "$(BINPREFIX)"
	mkdir -p "$(RESPREFIX)"
	cp kpwgen "$(BINPREFIX)"
	cp dict/words.txt "$(RESPREFIX)"
	chmod 755 "$(BINPREFIX)/pwgen"
	chmod 644 "$(RESPREFIX)/words.txt"

.PHONY: install clean all
