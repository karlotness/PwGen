BINPREFIX ?= "/usr/bin"
RESPREFIX ?= "/usr/share/kpwgen"

all: dict/words.txt

dict/words.txt: dict/filter-words.py /usr/share/dict/words
	python3 dict/filter-words.py /usr/share/dict/words dict/words.txt

clean:
	rm -f dict/words.txt

install: kpwgen dict/words.txt
	mkdir -p "$(BINPREFIX)"
	mkdir -p "$(RESPREFIX)"
	cp kpwgen "$(BINPREFIX)"
	cp dict/words.txt "$(RESPREFIX)"
	chmod 755 "$(BINPREFIX)/kpwgen"
	chmod 644 "$(RESPREFIX)/words.txt"

.PHONY: install clean all
