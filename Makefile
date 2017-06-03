BINPREFIX ?= "/usr/bin"
RESPREFIX ?= "/usr/share/pwgen"

dict/words.txt: dict/words-in.txt dict/filter-words.py
	python3 dict/filter-words.py dict/words-in.txt dict/words.txt
