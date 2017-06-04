# pwgen - A word-based password generator

Generates passwords based on
the [XKCD password scheme](https://xkcd.com/936/). This program
computes the entropy in the generated passwords and allows generating
passwords with a minimum amount of entropy or with a given number of
words. By default, passwords have some common character substitutions
applied, but this can be disabled. Usage help is available with with
`pwgen --help`.

The included word list is derived from the "cracklib-small" file
included with [cracklib](https://github.com/cracklib/cracklib).

This project is licensed under GPLv3 or any later version. See
LICENSE.txt for the license text.

## Example Usage
Sample usage of pwgen in verbose mode. Prints the entropy in the
generated password as well as the original and "expanded" password.
```
$ pwgen -v
Entropy:  68.3850 bits
Plain:    RelievedDividendEchoedCubes
Expanded: RelievedDiv!dendEchoedCubes
Diff:                ^
```
