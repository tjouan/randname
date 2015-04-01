randname
========

  Simple tool to generate random words. By default, randname will
alternate consonants and vowels so words are easy to read and write
by humans.


Usage
-----

    Usage: ./bin/randname [options]
        -c, --count N                    number of words to generate
        -l, --length N                   length of generated words
        -a, --alternate                  alternate consonants and vowels
        -s, --start STRING               prepend a string to generated words
        -f, --forbid STRING              string of chars to exclude from words


Notes
-----

  A GUI based on FXRuby is available in `bin/fxrandname`, but code is
ugly and working status is unknown.


TODO
----

* Add tests.

* Gemify.

* Fix GUI ugly code.
