
export PATH=$PATH:/opt/pycharm-2019.2/bin
export GOOGLE_APPLICATION_CREDENTIALS=~/.credentials/human-cell-atlas-travis-test-27427f1ff5bb.json
export DSS_TEST_ES_PATH=/usr/local/bin/elasticsearch

alias sudo='sudo '
alias kubectl='/usr/bin/kubectl '
alias heptio-authenticator-aws='aws-iam-authenticator '
# https://wikileaks.org/ciav7p1/cms/page_1179773.html
alias gitfix='git commit --amend -C HEAD'

# toil
alias gittoil='git clone https://github.com/DataBiosphere/toil.git'
alias mktoil='git clone https://github.com/DataBiosphere/toil.git && cd toil && virtualenv venv && . venv/bin/activate && make prepare && make develop extras=[all]'
mktoilb() { git clone https://github.com/DataBiosphere/toil.git && cd toil && git checkout "$1" && virtualenv venv && . venv/bin/activate && make prepare && make develop extras=[all]; }
gittoilb() { git clone https://github.com/DataBiosphere/toil.git && cd toil && git checkout "$1"; }
# dss
alias gitdss='git clone https://github.com/HumanCellAtlas/data-store.git'
alias mkdss='git clone https://github.com/HumanCellAtlas/data-store.git && cd data-store && virtualenv -p python3.6 v3nv && . v3nv/bin/activate && pip install -r requirements-dev.txt && source environment'
mkdssb() { git clone https://github.com/HumanCellAtlas/data-store.git && cd data-store && git checkout "$1" && virtualenv -p python3.6 v3nv && . v3nv/bin/activate && pip install -r requirements-dev.txt && source environment; }
gitdssb() { git clone https://github.com/HumanCellAtlas/data-store.git && cd data-store && git checkout "$1"; }
# dcp-cli
alias gitcli='git clone https://github.com/HumanCellAtlas/dcp-cli.git'
alias mkcli='git clone https://github.com/HumanCellAtlas/dcp-cli.git && cd dcp-cli && virtualenv -p python3.6 v3nv && . v3nv/bin/activate && pip install -r requirements-dev.txt && make install'
mkclib() { git clone https://github.com/HumanCellAtlas/dcp-cli.git && cd dcp-cli && git checkout "$1" && virtualenv -p python3.6 v3nv && . v3nv/bin/activate && pip install -r requirements-dev.txt && make install; }
gitclib() { git clone https://github.com/HumanCellAtlas/dcp-cli.git && cd dcp-cli && git checkout "$1"; }

ppjson() { cat "$1" | jq ''; }
gs_json() { python3 /usr/local/bin/gs_json.py "$1"; }
switch() { python3 /usr/local/bin/switch.py "$1"; }
