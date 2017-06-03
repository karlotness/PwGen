from sys import argv

alpha = set("abcdefghijklmnopqrstuvwxyz")

with open(argv[1]) as words:
    with open(argv[2], 'w') as out:
        for line in words:
            fixed = line.strip().lower()
            line_chars = set(fixed)
            if len(line_chars - alpha) <= 0:
                out.write(fixed + "\n")
