"""Copyright (C) 2017 Karl Otness

This file is part of kpwgen.

kpwgen is free software: you can redistribute it and/or modify
it under the terms of the GNU General Public License as published by
the Free Software Foundation, either version 3 of the License, or
(at your option) any later version.

kpwgen is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
GNU General Public License for more details.

You should have received a copy of the GNU General Public License
along with kpwgen.  If not, see <http://www.gnu.org/licenses/>.
"""
from sys import argv

alpha = {chr(a) for a in range(ord('a'), ord('z') + 1)}
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
