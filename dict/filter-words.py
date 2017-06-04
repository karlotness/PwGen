from sys import argv

alpha = set("abcdefghijklmnopqrstuvwxyz")
word_set = set()

with open(argv[1]) as words:
        for line in words:
            fixed = line.strip().lower()
            line_chars = set(fixed)
            if len(line_chars - alpha) <= 0:
                word_set.add(fixed)

with open(argv[2], 'w') as out:
    for word in sorted(word_set):
        out.write(word + "\n")
