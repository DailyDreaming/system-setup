#!/usr/bin/env python3
import os
import sys
import argparse
import textwrap

from shutil import copyfile
"""
Switches AWS credentials.

Store this script somewhere intuitive, for example:
/usr/local/bin/switch.py

Then call anytime by writing the following to '~/.bashrc':
switch() { python3 /usr/local/bin/switch.py "$1"; }
"""


def heredoc(template, indent=''):
    template = textwrap.dedent(template)
    return template.replace('\n', '\n' + indent) + '\n'


def main(argv=sys.argv[1:]):
    parser = argparse.ArgumentParser(description=heredoc("""
        Switches AWS Credentials.

        Options:
         - hca-dev
         - hca-prod
         - toil
         - toil-mfa (MFA)
         - platform-dev (MFA)
        """), formatter_class=argparse.RawTextHelpFormatter)
    parser.add_argument('account', help='Name of the account.')
    o = parser.parse_args(argv)

    main_config = os.path.expanduser('~/.aws/config')
    main_credentials = os.path.expanduser('~/.aws/credentials')

    accounts = {'hca-dev': {'config': os.path.expanduser('~/.aws/CONFIG-hca-dev'),
                            'credentials': os.path.expanduser('~/.aws/CRED-hca-id')},

                'hca-prod': {'config': os.path.expanduser('~/.aws/CONFIG-hca-prod'),
                             'credentials': os.path.expanduser('~/.aws/CRED-hca-id')},

                'toil': {'config': os.path.expanduser('~/.aws/CONFIG-toil-ci'),
                         'credentials': os.path.expanduser('~/.aws/CRED-toil-ci')},

                'toil-mfa': {'config': os.path.expanduser('~/.aws/CONFIG-toil-mfa'),
                             'credentials': os.path.expanduser('~/.aws/CRED-gi-gateway')},

                'platform-dev': {'config': os.path.expanduser('~/.aws/CONFIG-mfa-platform-dev'),
                                 'credentials': os.path.expanduser('~/.aws/CRED-gi-gateway')}}

    config, credentials = accounts[o.account]['config'], accounts[o.account]['credentials']
    if not os.path.exists(config) or not os.path.exists(credentials):
        raise RuntimeError(heredoc(f"""
            Something is horribly wrong.  Check the ~/.aws folder.
            
            Exists ({os.path.exists(config)}): {config}
            Exists ({os.path.exists(credentials)}): {credentials}
            """))

    if os.path.exists(main_config):
        os.remove(main_config)
    if os.path.exists(main_credentials):
        os.remove(main_credentials)
    copyfile(config, main_config)
    copyfile(credentials, main_credentials)
    print(f'Now using AWS credentials for: {o.account}.')


if __name__ == '__main__':
    main()
