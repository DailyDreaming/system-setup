#!/usr/bin/env python3
import os
import sys
import argparse
import textwrap
import random

from shutil import copyfile

"""
Randomly generates a quote.

Store this script somewhere intuitive, for example:
/usr/local/bin/quote_of_the_day.py

Then call anytime by writing the following to '~/.bashrc':
alias daily-quote='python3 /usr/local/bin/quote_of_the_day.py | lolcat'
"""

# def heredoc(template, indent=''):
#     template = textwrap.dedent(template)
#     return template.replace('\n', '\n' + indent) + '\n'


def main(argv=sys.argv[1:]):
    # parser = argparse.ArgumentParser(description='Generates quotes.', formatter_class=argparse.RawTextHelpFormatter)
    # parser.add_argument('account', help='Name of the account.')
    # o = parser.parse_args(argv)

    quotes = []
    with open('/home/quokka/git/system-setup/txt/quotes.txt', 'r') as f:
        quote = ''
        for line in f:
            if line.strip() == '*' * 100:
                quotes.append(quote)
                quote = ''
            else:
                quote = quote + line.strip() + '\n'
    if quote:
        quotes.append(quote)

    # print(quotes)
    print(random.choice(quotes))


if __name__ == '__main__':
    main()
